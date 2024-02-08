CREATE TABLE teacher (
    teacher_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
CREATE TABLE assignment (
    assignment_id SERIAL PRIMARY KEY,
    assignment_name VARCHAR(80) NOT NULL,
    teacher INT UNIQUE,
    FOREIGN KEY (teacher) REFERENCES teacher(teacher_id) ON DELETE CASCADE
);
CREATE TABLE assignment_student (
    assignment_id INT,
    student_id INT,
    PRIMARY KEY (assignment_id, student_id),
    FOREIGN KEY (assignment_id) REFERENCES assignment(assignment_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

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

insert into Teacher (first_name, last_name) values ('Mag', 'Cosans');
insert into Teacher (first_name, last_name) values ('Gare', 'Loding');
insert into Teacher (first_name, last_name) values ('Robbie', 'Ellinor');
insert into Teacher (first_name, last_name) values ('Jacynth', 'Blint');
insert into Teacher (first_name, last_name) values ('Querida', 'Pancost');

insert into Assignment (assignment_name, teacher) VALUES ('US History', 1);
insert into Assignment (assignment_name, teacher) VALUES ('Chemistry', 2);
insert into Assignment (assignment_name, teacher) VALUES ('English II', 3);
insert into Assignment (assignment_name, teacher) VALUES ('Algebra I', 4);

insert into Assignment_Student (assignment_id, student_id) VALUES (1, 1);
insert into Assignment_Student (assignment_id, student_id) VALUES (2, 1);
insert into Assignment_Student (assignment_id, student_id) VALUES (1, 2);
insert into Assignment_Student (assignment_id, student_id) VALUES (1, 3);
insert into Assignment_Student (assignment_id, student_id) VALUES (4, 1);

SELECT * FROM teacher;

SELECT student_id FROM assignment_student WHERE assignment_id = 1;

SELECT * FROM student WHERE student_id < 5;

SELECT a.assignment_name, s.first_name, s.last_name
FROM assignment AS a JOIN assignment_student AS ast ON a.assignment_id = ast.assignment_id
                     JOIN student AS s ON ast.student_id = s.student_id;

SELECT a.assignment_name, t.first_name AS teacher_first_name, t.last_name AS teacher_last_name
FROM assignment AS a JOIN teacher AS t ON a.teacher = t.teacher_id;