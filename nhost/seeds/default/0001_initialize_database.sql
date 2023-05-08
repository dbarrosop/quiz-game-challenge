CREATE TABLE public.questions (
  id uuid DEFAULT gen_random_uuid() NOT NULL,
  question text NOT NULL,
  points int4 DEFAULT 1 NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE public.answers (
  id uuid DEFAULT gen_random_uuid() NOT NULL,
  answer text NOT NULL,
  is_correct bool DEFAULT 'false' NOT NULL,
  question_id uuid NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (question_id) REFERENCES public.questions (id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

INSERT INTO public.questions (id, question) VALUES ('a6d7a14c-58f0-4f33-9bf9-92580b6e1aa3', 'How many planets are in our solar system?');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('6', 'false', 'a6d7a14c-58f0-4f33-9bf9-92580b6e1aa3');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('7', 'false', 'a6d7a14c-58f0-4f33-9bf9-92580b6e1aa3');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('9', 'false', 'a6d7a14c-58f0-4f33-9bf9-92580b6e1aa3');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('8', 'true', 'a6d7a14c-58f0-4f33-9bf9-92580b6e1aa3');

INSERT INTO public.questions (id, question) VALUES ('7a624d26-327f-49e6-8bfe-cab8ae49b950', 'How long is an Olympic swimming pool (in meters)?');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('75', 'false', '7a624d26-327f-49e6-8bfe-cab8ae49b950');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('25', 'false', '7a624d26-327f-49e6-8bfe-cab8ae49b950');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('100', 'false', '7a624d26-327f-49e6-8bfe-cab8ae49b950');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('50', 'true', '7a624d26-327f-49e6-8bfe-cab8ae49b950');

INSERT INTO public.questions (id, question) VALUES ('2dd95c9b-a7fe-47a8-8f78-a92caf3de955', 'Which ''The Lord of the Rings'' movie has the highest IMDb rating?');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('The Fellowship of the Ring', 'false', '2dd95c9b-a7fe-47a8-8f78-a92caf3de955');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('The Two Towers', 'false', '2dd95c9b-a7fe-47a8-8f78-a92caf3de955');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('The Return of the King', 'true', '2dd95c9b-a7fe-47a8-8f78-a92caf3de955');

INSERT INTO public.questions (id, question) VALUES ('b12ad57b-1501-4ebb-9b17-3ab8a57d135d', 'What is the only continent with land in all four hemispheres?');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('Asia', 'false', 'b12ad57b-1501-4ebb-9b17-3ab8a57d135d');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('North America', 'false', 'b12ad57b-1501-4ebb-9b17-3ab8a57d135d');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('South America', 'false', 'b12ad57b-1501-4ebb-9b17-3ab8a57d135d');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('Africa', 'true', 'b12ad57b-1501-4ebb-9b17-3ab8a57d135d');

INSERT INTO public.questions (id, question) VALUES ('ac8d5695-24df-46f6-b4ce-6836d49a070c', 'What is the capital of Australia?');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('Perth', 'false', 'ac8d5695-24df-46f6-b4ce-6836d49a070c');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('Sydney', 'false', 'ac8d5695-24df-46f6-b4ce-6836d49a070c');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('Melbourne', 'false', 'ac8d5695-24df-46f6-b4ce-6836d49a070c');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('Canberra', 'true', 'ac8d5695-24df-46f6-b4ce-6836d49a070c');

INSERT INTO public.questions (id, question) VALUES ('3a8379bc-317b-4d80-9095-183750b621f3', 'How many elements are there in the periodic table?');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('119', 'false', '3a8379bc-317b-4d80-9095-183750b621f3');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('120', 'false', '3a8379bc-317b-4d80-9095-183750b621f3');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('121', 'false', '3a8379bc-317b-4d80-9095-183750b621f3');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('118', 'true', '3a8379bc-317b-4d80-9095-183750b621f3');

INSERT INTO public.questions (id, question) VALUES ('c6c7065a-1cc0-437e-8aa5-345a7cd7f8b0', 'What is the diameter of Earth?');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('12 742 mi', 'false', 'c6c7065a-1cc0-437e-8aa5-345a7cd7f8b0');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('12 742 m', 'false', 'c6c7065a-1cc0-437e-8aa5-345a7cd7f8b0');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('12 742 ft', 'false', 'c6c7065a-1cc0-437e-8aa5-345a7cd7f8b0');
INSERT INTO public.answers (answer, is_correct, question_id) VALUES ('12 742 km', 'true', 'c6c7065a-1cc0-437e-8aa5-345a7cd7f8b0');
