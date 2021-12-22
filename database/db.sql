--users
INSERT INTO quiz_app.users (user_id, user_name, user_lastname, user_email, user_passwd) VALUES (1, 'clara', null, 'robin@f.to', '25d55ad283aa400af464c76d713c07ad');
INSERT INTO quiz_app.users (user_id, user_name, user_lastname, user_email, user_passwd) VALUES (2, 'e@e.e', null, 'rel', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO quiz_app.users (user_id, user_name, user_lastname, user_email, user_passwd) VALUES (3, '1234', null, 'q@q.q', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO quiz_app.users (user_id, user_name, user_lastname, user_email, user_passwd) VALUES (4, 'w', null, 'w@w.w', '81dc9bdb52d04dc20036dbd8313ed055');
--categorias
INSERT INTO quiz_app.categories (category_id, category_name, category_description, category_image) VALUES (1, 'Historia', '¿Cómo llegamos hasta est punto? Descúbrelo', null);
INSERT INTO quiz_app.categories (category_id, category_name, category_description, category_image) VALUES (2, 'Espacio', 'Descubre el cosmos, descubre que somos y hacia donde vamos', null);
INSERT INTO quiz_app.categories (category_id, category_name, category_description, category_image) VALUES (3, 'Biología', '¿Te interesa los plantas y sus cositas?', null);
INSERT INTO quiz_app.categories (category_id, category_name, category_description, category_image) VALUES (4, 'Geología', 'Descubre nuestro pequeño hogar', null);
--temas
INSERT INTO quiz_app.topics (topic_id, topic_name, topic_description, topic_image, category_id) VALUES (1, 'El sistema solar', 'link here', null, 2);
INSERT INTO quiz_app.topics (topic_id, topic_name, topic_description, topic_image, category_id) VALUES (2, 'El sol', 'link here', null, 2);
--preguntas
INSERT INTO quiz_app.questions (question_id, question_name, question_is_active, topic_id) VALUES (1, '¿Cuantas estrellas hay en el sistema solar?', '0', 1);
--opciones de las preguntas
INSERT INTO quiz_app.questions_choices (choice_id, choice_name, is_right_choice, questions_id) VALUES (2, 'Ninguno', '0', 1);
INSERT INTO quiz_app.questions_choices (choice_id, choice_name, is_right_choice, questions_id) VALUES (3, 'No se puede contabilizar', '0', 1);
INSERT INTO quiz_app.questions_choices (choice_id, choice_name, is_right_choice, questions_id) VALUES (4, '2', '0', 1);
INSERT INTO quiz_app.questions_choices (choice_id, choice_name, is_right_choice, questions_id) VALUES (5, '1', '1', 1);
--La ultima tabla no tiene datos hasta que el usuario responda
