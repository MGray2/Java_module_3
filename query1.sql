SELECT * FROM teacher;

SELECT student_id FROM assignment_student WHERE assignment_id = 1;

SELECT * FROM student WHERE student_id < 5;

SELECT a.assignment_name, s.first_name, s.last_name
FROM assignment AS a JOIN assignment_student AS ast ON a.assignment_id = ast.assignment_id
JOIN student AS s ON ast.student_id = s.student_id;

SELECT a.assignment_name, t.first_name AS teacher_first_name, t.last_name AS teacher_last_name
FROM assignment AS a JOIN teacher AS t ON a.teacher = t.teacher_id;