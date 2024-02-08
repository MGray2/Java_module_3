CREATE TABLE Teacher (
                         teacher_id SERIAL PRIMARY KEY,
                         first_name VARCHAR(40) NOT NULL ,
                         last_name VARCHAR(40) NOT NULL
);
CREATE TABLE Student (
                         student_id SERIAL PRIMARY KEY,
                         first_name VARCHAR(40) NOT NULL,
                         last_name VARCHAR(40) NOT NULL
);
CREATE TABLE Assignment (
                            assignment_id SERIAL PRIMARY KEY,
                            assignment_name VARCHAR(80) NOT NULL,
                            teacher INT UNIQUE,
                            FOREIGN KEY (teacher) REFERENCES Teacher(teacher_id) ON DELETE CASCADE
);
CREATE TABLE Assignment_Students (
                                     assignment_id INT,
                                     student_id INT,
                                     PRIMARY KEY (assignment_id, student_id),
                                     FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id) ON DELETE CASCADE,
                                     FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE
);

/* Student Dummy Data */
insert into Student (first_name, last_name) values ('Thane', 'Lemerie');
insert into Student (first_name, last_name) values ('Rodger', 'Joysey');
insert into Student (first_name, last_name) values ('Quinn', 'Kyles');
insert into Student (first_name, last_name) values ('Wendall', 'Skeech');
insert into Student (first_name, last_name) values ('Edmon', 'Draijer');
insert into Student (first_name, last_name) values ('Carlota', 'Pawlicki');
insert into Student (first_name, last_name) values ('Karia', 'Rainbird');
insert into Student (first_name, last_name) values ('Veriee', 'Bog');
insert into Student (first_name, last_name) values ('Helaina', 'Faull');
insert into Student (first_name, last_name) values ('Kissie', 'Waltho');

/* Teacher Dummy Data */
insert into Teacher (first_name, last_name) values ('Mag', 'Cosans');
insert into Teacher (first_name, last_name) values ('Gare', 'Loding');
insert into Teacher (first_name, last_name) values ('Robbie', 'Ellinor');
insert into Teacher (first_name, last_name) values ('Jacynth', 'Blint');
insert into Teacher (first_name, last_name) values ('Querida', 'Pancost');

/* Assignment Dummy Data */
insert into Assignment (assignment_name, teacher) VALUES ('US History', 1);
insert into Assignment (assignment_name, teacher) VALUES ('Chemistry', 2);
insert into Assignment (assignment_name, teacher) VALUES ('English II', 3);
insert into Assignment (assignment_name, teacher) VALUES ('Algebra I', 4);

/* adding students to assignments */
insert into Assignment_Students (assignment_id, student_id) VALUES (1, 1);
insert into Assignment_Students (assignment_id, student_id) VALUES (2, 1);
insert into Assignment_Students (assignment_id, student_id) VALUES (1, 2);
insert into Assignment_Students (assignment_id, student_id) VALUES (1, 3);
insert into Assignment_Students (assignment_id, student_id) VALUES (4, 1);