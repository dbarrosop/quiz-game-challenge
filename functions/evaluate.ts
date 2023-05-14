import { NhostClient } from "@nhost/nhost-js";
import { Request, Response } from "express";
import { gql } from "graphql-tag";

interface Answer {
  id: string;
  answer: string;
  is_correct: boolean;
}

interface Question {
  id: string;
  question: string;
  points: number;
  answers: Answer[];
}

interface Solution {
  question_id: string;
  answer_id: string;
}

const client = new NhostClient({
  subdomain: process.env.NHOST_SUBDOMAIN,
  region: process.env.NHOST_REGION,
  adminSecret: process.env.NHOST_ADMIN_SECRET,
});

export default async function handler(req: Request, res: Response) {
  if (req.method === "OPTIONS") {
      // CORS preflight
      res.setHeader('Access-Control-Allow-Origin', '*');
      res.setHeader('Access-Control-Allow-Methods', '*');
      res.setHeader('Access-Control-Allow-Headers', '*');
      res.setHeader('Access-Control-Max-Age', '86400');
      return res.status(200).end();
  } else if (req.method !== "POST") {
    return res.status(405).json({ error: { message: "Method not allowed" } });
  }

  const { body } = req;

  if (!body) {
    return res.status(400).json({
      error: { message: "No body provided" },
    });
  }

  const solutions = body.solutions as Solution[];

  if (!solutions) {
    return res.status(400).json({
      error: { message: "No solutions provided" },
    });
  }

  if (!solutions.length) {
    return res.status(200).json({
      numberOfCorrectAnswers: 0,
      score: 0,
      correctAnswers: [],
      wrongAnswers: [],
    });
  }

  const { data, error } = await client.graphql.request<{
    questions: Question[];
  }>(
    gql`
      query getCorrectAnswers($ids: [uuid!]) {
        questions(where: { id: { _in: $ids } }) {
          id
          question
          points
          answers(where: { is_correct: { _eq: true } }) {
            id
            answer
            is_correct
          }
        }
      }
    `,
    { ids: solutions.map((solution: any) => solution.question_id) }
  );

  if (error) {
    if (Array.isArray(error)) {
      return res.status(500).json({
        error: { message: error[0].message || "Error fetching questions" },
      });
    }

    return res.status(500).json({
      error: { message: error?.message || "Error fetching questions" },
    });
  }

  const { questions } = data;

  if (!questions?.length) {
    return res.status(200).json({
      numberOfCorrectAnswers: 0,
      score: 0,
      correctAnswers: [],
      wrongAnswers: [],
    });
  }

  const correctAnswers = solutions.filter((solution) => {
    const question = questions.find(
      (question) => question.id === solution.question_id
    );

    return question?.answers.some((answer) => answer.id === solution.answer_id);
  });

  const wrongAnswers = solutions.filter(
    (solution) =>
      !correctAnswers.some(
        (answer) => answer.question_id === solution.question_id
      )
  );

  const score = questions.reduce((acc, question) => {
    const correctAnswer = correctAnswers.some(
      (answer) => answer.question_id === question.id
    );

    if (!correctAnswer) {
      return acc;
    }

    return acc + question.points;
  }, 0);

  return res.status(200).json({
    score,
    correctAnswers,
    wrongAnswers,
  });
}
