import { Request, Response } from "express";

export default function handler(req: Request, res: Response) {
  const { body } = req;

  if (!body) {
    return res.status(400).json({
      error: { message: "No body provided" },
    });
  }

  const { solutions } = body;

  if (!solutions) {
    return res.status(400).json({
      error: { message: "No solutions provided" },
    });
  }

  // TODO: Evaluate solutions

  return res.status(200).json({ data: "Hello World!" });
}
