CREATE TABLE public.answers (
  id uuid DEFAULT gen_random_uuid() NOT NULL,
  answer text NOT NULL,
  is_correct bool DEFAULT 'false' NOT NULL,
  question_id uuid NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (question_id) REFERENCES public.questions (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);
