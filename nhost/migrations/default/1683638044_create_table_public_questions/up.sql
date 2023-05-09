CREATE TABLE public.questions (
  id uuid DEFAULT gen_random_uuid() NOT NULL,
  question text NOT NULL,
  points int4 DEFAULT 1 NOT NULL,
  PRIMARY KEY (id)
);