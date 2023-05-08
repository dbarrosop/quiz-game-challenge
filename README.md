# Quiz Game Challenge

This is the backend for our quiz game challenge. Connect it to an Nhost project and you're good to go.

## Evaluating the solution

There is a lambda function called `evaluate` that candidates can use to evaluate their solution. It takes a single body parameter called `solutions`, which is an array of objects. Each object contains a `question_id` and an `answer_id`. The function returns a JSON object with a `score` and two arrays, `correctAnswers` and `wrongAnswers`.

Input:

```json
{
  "solutions": [
    {
      "question_id": "a6d7a14c-58f0-4f33-9bf9-92580b6e1aa3",
      "answer_id": "d72892ee-c1bd-472d-84a0-f44a75969f6b"
    },
    {
      "question_id": "ac8d5695-24df-46f6-b4ce-6836d49a070c",
      "answer_id": "871d7e9b-f81a-480d-9c8b-953faafb6983"
    }
  ]
}
```

Output:

```json
{
  "score": 1,
  "correctAnswers": [
    {
      "question_id": "a6d7a14c-58f0-4f33-9bf9-92580b6e1aa3",
      "answer_id": "d72892ee-c1bd-472d-84a0-f44a75969f6b"
    }
  ],
  "wrongAnswers": [
    {
      "question_id": "ac8d5695-24df-46f6-b4ce-6836d49a070c",
      "answer_id": "871d7e9b-f81a-480d-9c8b-953faafb6983"
    }
  ]
}
```
