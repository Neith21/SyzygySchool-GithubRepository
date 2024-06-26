CREATE DATABASE PuellaSchoolDB;
GO

USE PuellaSchoolDB;
GO

CREATE TABLE Students(
	StudentId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    StudentName VARCHAR(50) NOT NULL,
    StudentLastName VARCHAR(50) NOT NULL,
    StudentAge INT NOT NULL,
    StudentGender CHAR(1),
    StudentParentName VARCHAR(50) NOT NULL   
);
GO

CREATE TABLE Sections(
	SectionId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	SectionName VARCHAR(50) NOT NULL,
	SectionInfo VARCHAR(100)
);
GO

CREATE TABLE Grades(
    GradeId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	GradeName VARCHAR(50) NOT NULL,
);
GO

CREATE TABLE Classes(
    ClassId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	ClassInfo VARCHAR(100) NOT NULL,
    GradeId INT NOT NULL,
    SectionId INT NOT NULL,
    
    FOREIGN KEY (GradeId) REFERENCES Grades(GradeId),
    FOREIGN KEY (SectionId) REFERENCES Sections(SectionId)
);
GO

CREATE TABLE Classrooms(
    ClassroomId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    ClassId INT NOT NULL,
    StudentId INT NOT NULL,
    
    foreign KEY (ClassId) REFERENCES Classes (ClassId),
    foreign KEY (StudentId) REFERENCES Students(StudentId)
);
GO

CREATE TABLE Subjects(
	SubjectId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	SubjectName VARCHAR(50) NOT NULL,
	SubjectInfo VARCHAR(100),
	GradeId INT,

	FOREIGN KEY (GradeId) REFERENCES Grades(GradeId)
);
GO

CREATE TABLE Teachers(
	TeacherId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	TeacherName VARCHAR(50) NOT NULL,
	TeacherLastName VARCHAR(50) NOT NULL,
	TeacherAge INT NOT NULL,
	TeacherGender CHAR(1),
	TeacherPhone VARCHAR(30),
	TeacherEmail NVARCHAR(75) NOT NULL
);
GO

-- Schedules
CREATE TABLE Schedules(
	IdSchedule INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	ScheduleInfo VARCHAR(100),
	ScheduleCreation DATE NOT NULL, -- Se tomar� automatico
	ScheduleDay VARCHAR(15) NOT NULL,
	ScheduleStart TIME NOT NULL,
	ScheduleEnd TIME NOT NULL,
	ScheduleExpiration DATE NOT NULL, -- Se le asignar� manual y junto con el ScheduleCreation se establece un periodo de validez al horario.
	SubjectId INT NOT NULL,
	TeacherId INT NOT NULL,
	ClassId INT NOT NULL,

	FOREIGN KEY (SubjectId) REFERENCES Subjects(SubjectId),
	FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId),
	FOREIGN KEY (ClassId) REFERENCES Classes(ClassId)	
);
GO

-- Roles and logins

CREATE TABLE Roles(
	RoleId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	RoleName VARCHAR(50) NOT NULL,
	RoleInfo VARCHAR(100)
);
GO

CREATE TABLE Logins(
	LoginId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	LoginUser NVARCHAR(50) NOT NULL,
	LoginPassword NVARCHAR(50) NOT NULL,
	TeacherId INT NOT NULL,
	RoleId INT NOT NULL,
	
	FOREIGN KEY (TeacherId) REFERENCES Teachers(TeacherId),
	FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)	
);
GO

-- Insertando registros en la tabla Students
INSERT INTO Students (StudentName, StudentLastName, StudentAge, StudentGender, StudentParentName)
VALUES 
    ('Ana', 'Gonz�lez', 8, 'F', 'Mar�a P�rez'),
    ('Carlos', 'Mart�nez', 9, 'M', 'Juan Mart�nez'),
    ('Luisa', 'Hern�ndez', 8, 'F', 'Jos� Hern�ndez'),
    ('Pedro', 'G�mez', 9, 'M', 'Sof�a G�mez'),
    ('Laura', 'S�nchez', 8, 'F', 'Alejandro S�nchez'),
    ('Diego', 'Rodr�guez', 9, 'M', 'Andrea Rodr�guez'),
    ('Valentina', 'L�pez', 8, 'F', 'David L�pez'),
    ('Manuel', 'P�rez', 9, 'M', 'Ana P�rez'),
    ('Sof�a', 'D�az', 8, 'F', 'Luis D�az'),
    ('Javier', 'Fern�ndez', 9, 'M', 'Elena Fern�ndez'),
    ('Mar�a', 'Guti�rrez', 8, 'F', 'Carlos Guti�rrez'),
    ('Juan', 'Torres', 9, 'M', 'Luc�a Torres'),
    ('Carmen', 'Vargas', 8, 'F', 'Miguel Vargas'),
    ('Miguel', 'Romero', 9, 'M', 'Carmen Romero'),
    ('Isabella', 'Su�rez', 8, 'F', 'Jorge Su�rez'),
    ('Alejandro', 'D�az', 9, 'M', 'Sof�a D�az'),
    ('Gabriela', 'Alvarez', 8, 'F', 'Fernando Alvarez'),
    ('Daniel', 'Garc�a', 9, 'M', 'Gabriela Garc�a'),
    ('Valeria', 'P�rez', 8, 'F', 'Francisco P�rez'),
    ('Jos�', 'Hern�ndez', 9, 'M', 'Valeria Hern�ndez'),
    ('Fernanda', 'Mart�nez', 8, 'F', 'Roberto Mart�nez'),
    ('Andr�s', 'Rodr�guez', 9, 'M', 'Adriana Rodr�guez'),
    ('Luc�a', 'G�mez', 8, 'F', 'Ignacio G�mez'),
    ('Juli�n', 'S�nchez', 9, 'M', 'Camila S�nchez'),
    ('Valentina', 'L�pez', 8, 'F', 'Emilio L�pez'),
    ('Mateo', 'P�rez', 9, 'M', 'Mar�a P�rez'),
    ('Camila', 'D�az', 8, 'F', 'Antonio D�az'),
    ('Diego', 'Fern�ndez', 9, 'M', 'Daniela Fern�ndez'),
    ('Valeria', 'Guti�rrez', 8, 'F', 'Hugo Guti�rrez'),
    ('Juan', 'Mart�nez', 9, 'M', 'Isabel Mart�nez'),
    ('Emma', 'Vargas', 8, 'F', 'Eduardo Vargas'),
    ('Samuel', 'Romero', 9, 'M', 'Patricia Romero'),
    ('Natalia', 'Su�rez', 8, 'F', 'Ricardo Su�rez'),
    ('Mat�as', 'D�az', 9, 'M', 'Marina D�az'),
    ('Valentina', 'Alvarez', 8, 'F', 'Luis Alvarez'),
    ('Santiago', 'Garc�a', 9, 'M', 'Andrea Garc�a'),
    ('Mar�a', 'P�rez', 8, 'F', 'Santiago P�rez'),
    ('Emilia', 'Hern�ndez', 9, 'M', 'Laura Hern�ndez'),
    ('Lucas', 'Mart�nez', 8, 'F', 'Mart�n Mart�nez'),
    ('Isabella', 'Rodr�guez', 9, 'M', 'Paula Rodr�guez'),
    ('Martina', 'G�mez', 8, 'F', 'Diego G�mez'),
    ('Juan', 'S�nchez', 9, 'M', 'Valentina S�nchez'),
    ('Gabriel', 'L�pez', 8, 'F', 'Felipe L�pez'),
    ('Valentina', 'Garc�a', 9, 'M', 'Juliana Garc�a'),
    ('Nicol�s', 'Vargas', 8, 'F', 'Manuel Vargas'),
    ('Emilia', 'Romero', 9, 'M', 'Carolina Romero'),
    ('Sof�a', 'Su�rez', 8, 'F', 'Gustavo Su�rez'),
    ('Alejandro', 'D�az', 9, 'M', 'Valeria D�az'),
    ('Valentina', 'Alvarez', 8, 'F', 'Fernando Alvarez'),
    ('Lucas', 'Garc�a', 9, 'M', 'Daniela Garc�a');
GO

-- Insertando registros en la tabla Sections
INSERT INTO Sections (SectionName, SectionInfo)
VALUES
('A', 'Section A Info'),
('B', 'Section B Info'),
('C', 'Section C Info');
GO

-- Insertando registros en la tabla Grades
INSERT INTO Grades (GradeName)
VALUES
('Grade 7'),
('Grade 8'),
('Grade 9');
GO

-- Insertando registros en la tabla Classes
INSERT INTO Classes (ClassInfo, GradeId, SectionId)
VALUES
('Math Class - Grade 1 A', 1, 1),
('Science Class - Grade 2 B', 2, 2),
('History Class - Grade 3 C', 3, 3);
GO


-- Insertando registros en la tabla Classrooms
INSERT INTO Classrooms (ClassId, StudentId)
VALUES
(1, 1),
(2, 2),
(3, 3);
GO

-- Insertando registros en la tabla Subjects
INSERT INTO Subjects (SubjectName, SubjectInfo, GradeId)
VALUES
('Mathematics', 'Maths Class', 1),
('Science', 'Science Class', 2),
('History', 'History Class', 3);
GO

-- Insertando registros en la tabla Teachers
INSERT INTO Teachers (TeacherName, TeacherLastName, TeacherAge, TeacherGender, TeacherPhone, TeacherEmail)
VALUES
('Alice', 'Brown', 30, 'F', '555-1234', 'alice.brown@example.com'),
('David', 'Wilson', 40, 'M', '555-5678', 'david.wilson@example.com'),
('Sophia', 'Miller', 35, 'F', '555-8765', 'sophia.miller@example.com');
GO

-- Insertando registros en la tabla Schedules
INSERT INTO Schedules (ScheduleInfo, ScheduleCreation, ScheduleDay, ScheduleStart, ScheduleEnd, ScheduleExpiration, SubjectId, TeacherId, ClassId)
VALUES
('Science Class on Wednesday Morning', GETDATE(), 'Mi�rcoles', '07:00:00', '08:20:00', DATEADD(MONTH, 6, GETDATE()), 2, 2, 1),
('History Class on Friday Morning', GETDATE(), 'Viernes', '07:00:00', '08:20:00', DATEADD(MONTH, 6, GETDATE()), 3, 3, 1),
('Mathematics Class on Monday Morning', GETDATE(), 'Lunes', '07:00:00', '08:20:00', DATEADD(MONTH, 6, GETDATE()), 1, 1, 1),
('Science Class on Wednesday Morning', GETDATE(), 'Mi�rcoles', '08:50:00', '10:10:00', DATEADD(MONTH, 6, GETDATE()), 2, 2, 2),
('History Class on Friday Morning', GETDATE(), 'Viernes', '10:40:00', '12:00:00', DATEADD(MONTH, 6, GETDATE()), 3, 3, 3);
GO

-- Insertando registros en la tabla Roles
INSERT INTO Roles (RoleName, RoleInfo)
VALUES
('Admin', 'Administrator role'),
('Teacher', 'Teacher role'),
('Student', 'Student role');
GO

-- Insertando registros en la tabla Logins
INSERT INTO Logins (LoginUser, LoginPassword, TeacherId, RoleId)
VALUES
('alice.brown', 'password1', 1, 1),
('david.wilson', 'password2', 2, 2),
('sophia.miller', 'password3', 3, 3);
GO

CREATE OR ALTER PROCEDURE spSchedules_GetBGSId
    @GradeId INT,
    @SectionId INT
AS
BEGIN
    SELECT 
        sc.IdSchedule,
        sc.ScheduleInfo,
        sc.ScheduleCreation,
		sc.ScheduleDay,
        sc.ScheduleStart,
        sc.ScheduleEnd,
        sc.ScheduleExpiration,
		sc.ClassId,
        sc.SubjectId,
        s.SubjectName,
        sc.TeacherId,
        t.TeacherName,
		sc.ClassId,
		c.ClassInfo
    FROM 
        Schedules sc
    JOIN Subjects s ON sc.SubjectId = s.SubjectId -- Corregido el join con Subjects
    JOIN Teachers t ON sc.TeacherId = t.TeacherId
    JOIN Classes c ON sc.ClassId = c.ClassId
    WHERE c.GradeId = @GradeId -- Usar los par�metros
    AND c.SectionId = @SectionId -- Usar los par�metros
    GROUP BY sc.IdSchedule, sc.ScheduleInfo, sc.ScheduleCreation, sc.ScheduleDay, sc.ScheduleStart, sc.ScheduleEnd, sc.ScheduleExpiration, sc.ClassId, sc.SubjectId, s.SubjectName, sc.TeacherId, t.TeacherName, t.TeacherLastName, c.ClassInfo; -- Ajustar las columnas en el GROUP BY
END;
GO

---[Procesos almacenados para tab la students]---

CREATE OR ALTER PROC dbo.spStudents_Insert --Insert
(@StudentName VARCHAR(50), @StudentLastName VARCHAR(50), @StudentAge INT, @StudentGender CHAR(1), @StudentParentName VARCHAR(50))
AS
BEGIN
	INSERT INTO Students VALUES(@StudentName, @StudentLastName, @StudentAge, @StudentGender, @StudentParentName)
END
GO

CREATE OR ALTER PROC dbo.spStudents_Update --Update
(@StudentId INT, @StudentName VARCHAR(50), @StudentLastName VARCHAR(50), @StudentAge INT, @StudentGender CHAR(1), @StudentParentName VARCHAR(50))
AS
BEGIN
	UPDATE Students SET StudentName = @StudentName, StudentLastName = @StudentLastName,
	StudentAge = @StudentAge, StudentGender = @StudentGender, StudentParentName = @StudentParentName
	WHERE StudentId = @StudentId
END
GO

CREATE OR ALTER PROC dbo.spStudents_Delete --delete
(@StudentId INT)
AS
BEGIN
	DELETE FROM Students WHERE StudentId = @StudentId
END
GO

CREATE OR ALTER PROC dbo.spStudents_GetAll
AS
BEGIN
	SELECT StudentId, StudentName, StudentLastName, StudentAge, StudentGender, StudentParentName FROM Students
END
GO

CREATE OR ALTER PROC dbo.spStudents_GetById --delete
(@StudentId INT)
AS
BEGIN
	SELECT StudentId, StudentName, StudentLastName, StudentAge, StudentGender, StudentParentName FROM Students 
	WHERE StudentId = @StudentId
END
GO

---[Procesos almacenados para tabla Classrooms]---
CREATE OR ALTER PROC dbo.spClassrooms_Insert --Insert
(@ClassId INT, @StudentId INT)
AS
BEGIN
	INSERT INTO Classrooms VALUES(@ClassId, @StudentId)
END
GO

CREATE OR ALTER PROC dbo.spClassrooms_Update --Edit
(@ClassroomId INT, @ClassId INT, @StudentId INT)
AS
BEGIN
	UPDATE Classrooms SET ClassId = @ClassId, StudentId = @StudentId WHERE ClassroomId = @ClassroomId
END
GO

CREATE OR ALTER PROC dbo.spClassrooms_Delete --Delete
(@ClassroomId INT)
AS
BEGIN
	DELETE FROM Classrooms WHERE ClassroomId = @ClassroomId
END
GO

CREATE OR ALTER PROC dbo.spClassrooms_GetById --gETbY ID
(@ClassroomId INT)
AS
BEGIN
	SELECT ClassroomId, (S.StudentName + ' ' + S.StudentLastName ) AS StudentName, ClassId, C.StudentId FROM Classrooms C INNER JOIN Students S ON C.StudentID = S.StudentID
	WHERE ClassroomId = @ClassroomId
END
GO

CREATE OR ALTER PROC dbo.spClassrooms_GetAll 
AS
BEGIN
	SELECT ClassroomId, (S.StudentName + ' ' + S.StudentLastName ) AS StudentName, CL.ClassInfo, CL.ClassId, C.StudentId FROM Classrooms C
	INNER JOIN
		Students S ON C.StudentID = S.StudentID
	INNER JOIN
		Classes CL ON C.ClassId = CL.ClassId
END
GO

---------------------------------------- Procesos almacenados de login --------------------------------------
CREATE OR ALTER PROCEDURE spLogin_Login
AS
BEGIN
	SELECT LoginId, LoginUser, LoginPassword, TeacherId, RoleId
    FROM Logins
END
GO

-- Procedimiento almacenado para SELECT
CREATE OR ALTER PROCEDURE spLogin_GetAll
AS
BEGIN
    SELECT l.LoginId, l.LoginUser, l.LoginPassword, l.TeacherId, t.TeacherName, l.RoleId, r.RoleName
    FROM Logins l
	INNER JOIN Teachers t ON l.TeacherId = t.TeacherId
	INNER JOIN Roles r ON l.RoleId = r.RoleId
END;
GO

-- Procedimiento almacenado para SELECTBYID
CREATE OR ALTER PROCEDURE spLogin_GetByID
	@LoginId INT
AS
BEGIN
    SELECT LoginId, LoginUser, LoginPassword, TeacherId, RoleId
    FROM Logins
	WHERE LoginId = @LoginId
END;
GO

-- Procedimiento almacenado para INSERT
CREATE OR ALTER PROCEDURE spLogin_Insert
    @LoginUser NVARCHAR(50),
    @LoginPassword NVARCHAR(50),
    @TeacherId INT,
    @RoleId INT
AS
BEGIN
    INSERT INTO Logins (LoginUser, LoginPassword, TeacherId, RoleId)
    VALUES (@LoginUser, @LoginPassword, @TeacherId, @RoleId);
END;
GO

-- Procedimiento almacenado para UPDATE
CREATE OR ALTER PROCEDURE spLogin_Update
    @LoginId INT,
    @LoginUser NVARCHAR(50),
    @LoginPassword NVARCHAR(50),
    @TeacherId INT,
    @RoleId INT
AS
BEGIN
    UPDATE Logins
    SET LoginUser = @LoginUser,
        LoginPassword = @LoginPassword,
        TeacherId = @TeacherId,
        RoleId = @RoleId
    WHERE LoginId = @LoginId;
END;
GO

-- Procedimiento almacenado para DELETE
CREATE OR ALTER PROCEDURE spLogin_Delete
    @LoginId INT
AS
BEGIN
    DELETE FROM Logins
    WHERE LoginId = @LoginId;
END;
GO

-------------------------------------Procesos almacenados de ROLES --------------------------------------

-- Procedimiento almacenado para la consulta SELECT
CREATE OR ALTER PROCEDURE spRoles_GetAll
AS
BEGIN
    SELECT RoleId, RoleName, RoleInfo
    FROM Roles;
END;
GO

CREATE PROCEDURE spRoles_GetById
	@RoleId INT
AS
BEGIN
    SELECT RoleId, RoleName, RoleInfo
    FROM Roles
	WHERE RoleId = @RoleId
END;
GO


-- Procedimiento almacenado para la consulta INSERT
CREATE OR ALTER PROCEDURE spRoles_Insert
    @RoleName VARCHAR(50),
    @RoleInfo VARCHAR(100)
AS
BEGIN
    INSERT INTO Roles (RoleName, RoleInfo)
    VALUES (@RoleName, @RoleInfo);
END;
GO


-- Procedimiento almacenado para la consulta UPDATE
CREATE OR ALTER PROCEDURE spRoles_Update
    @RoleId INT,
    @RoleName VARCHAR(50),
    @RoleInfo VARCHAR(100)
AS
BEGIN
    UPDATE Roles
    SET RoleName = @RoleName, RoleInfo = @RoleInfo
    WHERE RoleId = @RoleId;
END;
GO

-- Procedimiento almacenado para la consulta DELETE
CREATE OR ALTER PROCEDURE spRoles_Delete
    @RoleId INT
AS
BEGIN
    DELETE FROM Roles
    WHERE RoleId = @RoleId;
END;
GO

------------------------------------- TEACHER --------------------------------
-- Procedimiento almacenado para la consulta SELECT
CREATE OR ALTER PROCEDURE spTeachers_GetAll
AS
BEGIN
    SELECT TeacherId, TeacherName, TeacherLastName, TeacherAge, TeacherGender, TeacherPhone, TeacherEmail
    FROM Teachers;
END;
GO

CREATE OR ALTER PROCEDURE spTeachers_Insert
    @TeacherName NVARCHAR(100),
    @TeacherLastName NVARCHAR(100),
    @TeacherAge INT,
    @TeacherGender NVARCHAR(10),
    @TeacherPhone NVARCHAR(20),
    @TeacherEmail NVARCHAR(100)
AS
BEGIN
    INSERT INTO Teachers (TeacherName, TeacherLastName, TeacherAge, TeacherGender, TeacherPhone, TeacherEmail)
    VALUES (@TeacherName, @TeacherLastName, @TeacherAge, @TeacherGender, @TeacherPhone, @TeacherEmail);
END;
GO

CREATE OR ALTER PROCEDURE spTeachers_Update
    @TeacherId INT,
    @TeacherName NVARCHAR(100),
    @TeacherLastName NVARCHAR(100),
    @TeacherAge INT,
    @TeacherGender NVARCHAR(10),
    @TeacherPhone NVARCHAR(20),
    @TeacherEmail NVARCHAR(100)
AS
BEGIN
    UPDATE Teachers
    SET TeacherName = @TeacherName,
        TeacherLastName = @TeacherLastName,
        TeacherAge = @TeacherAge,
        TeacherGender = @TeacherGender,
        TeacherPhone = @TeacherPhone,
        TeacherEmail = @TeacherEmail
    WHERE TeacherId = @TeacherId;
END;
GO

CREATE OR ALTER PROCEDURE spTeachers_Delete
    @TeacherId INT
AS
BEGIN
    DELETE FROM Teachers WHERE TeacherId = @TeacherId;
END;
GO

-- Procedimiento para obtener un profesor por su ID
CREATE OR ALTER PROCEDURE spTeachers_GetById
    @TeacherId INT
AS
BEGIN
    SELECT TeacherId, TeacherName, TeacherLastName, TeacherAge, TeacherGender, TeacherPhone, TeacherEmail
    FROM Teachers
    WHERE TeacherId = @TeacherId;
END;
GO

-- Procedimiento almacenado para insertar un nuevo registro en la tabla Subjects
CREATE OR ALTER PROCEDURE spSubject_Insert
    @SubjectName NVARCHAR(100),
    @SubjectInfo NVARCHAR(MAX),
    @GradeId INT
AS
BEGIN
    INSERT INTO Subjects (SubjectName, SubjectInfo, GradeId)
    VALUES (@SubjectName, @SubjectInfo, @GradeId);
    SELECT SCOPE_IDENTITY(); -- Retorna el ID del nuevo registro insertado
END;
GO

-- Procedimiento almacenado para eliminar un registro de la tabla Subjects por su ID
CREATE OR ALTER PROCEDURE spSubject_Delete
    @SubjectId INT
AS
BEGIN
    DELETE FROM Subjects
    WHERE SubjectId = @SubjectId;
END;
GO

-- Procedimiento almacenado para obtener todos los registros de la tabla Subjects
CREATE OR ALTER PROCEDURE dbo.spSubjects_GetAll
AS
BEGIN
    SELECT SubjectId, SubjectName, SubjectInfo, g.GradeName, s.GradeId
	FROM Subjects s
	INNER JOIN Grades g ON s.GradeId = g.GradeId;
END;
GO

-- Procedimiento almacenado para obtener un registro de la tabla Subjects por su ID
CREATE OR ALTER PROCEDURE spSubject_GetById
    @SubjectId INT
AS
BEGIN
    SELECT * FROM Subjects
    WHERE SubjectId = @SubjectId;
END;
GO

-- Procedimiento almacenado para actualizar un registro de la tabla Subjects por su ID
CREATE OR ALTER PROCEDURE spSubject_Update
    @SubjectId INT,
    @SubjectName NVARCHAR(100),
    @SubjectInfo NVARCHAR(MAX),
    @GradeId INT
AS
BEGIN
    UPDATE Subjects
    SET SubjectName = @SubjectName,
        SubjectInfo = @SubjectInfo,
        GradeId = @GradeId
    WHERE SubjectId = @SubjectId;
END;
GO

---[Procesos almacenados para tabla Schedules]---
CREATE OR ALTER PROCEDURE dbo.spSchedules_GetAll
AS
BEGIN
    SELECT 
        sc.IdSchedule,
        sc.ScheduleInfo,
        sc.ScheduleCreation,
		sc.ScheduleDay,
        sc.ScheduleStart,
        sc.ScheduleEnd,
        sc.ScheduleExpiration,
		sc.ClassId,
        sc.SubjectId,
        s.SubjectName,
        sc.TeacherId,
        t.TeacherName,
		sc.ClassId,
		c.ClassInfo
    FROM 
        Schedules sc
    INNER JOIN 
        Subjects s ON sc.SubjectId = s.SubjectId
    INNER JOIN 
        Teachers t ON sc.TeacherId = t.TeacherId
	INNER JOIN
		Classes c ON sc.ClassId = c.ClassId;
END;
GO

CREATE OR ALTER PROC dbo.spSchedules_Insert
(
    @ScheduleInfo VARCHAR(100),
    @ScheduleDay VARCHAR(15),
    @ScheduleStart TIME,
    @ScheduleEnd TIME,
    @SubjectId INT,
    @TeacherId INT,
    @ClassId INT
)
AS
BEGIN
    DECLARE @CurrentYear INT = YEAR(GETDATE());
    DECLARE @ScheduleExpiration DATE = DATEFROMPARTS(@CurrentYear, 12, 31);

    -- Verificar si ya existe un horario con el mismo maestro en el mismo d�a y hora
    IF EXISTS (SELECT 1
               FROM Schedules
               WHERE ScheduleDay = @ScheduleDay
               AND ScheduleStart = @ScheduleStart
               AND ScheduleEnd = @ScheduleEnd
               AND TeacherId = @TeacherId)
    BEGIN
        RAISERROR('El maestro ya tiene un horario asignado en esta franja horaria.', 16, 1);
        RETURN;
    END

    -- Verificar si ya existe un horario con la misma clase en el mismo d�a y hora
    IF EXISTS (SELECT 1
               FROM Schedules
               WHERE ScheduleDay = @ScheduleDay
               AND ScheduleStart = @ScheduleStart
               AND ScheduleEnd = @ScheduleEnd
               AND ClassId = @ClassId)
    BEGIN
        RAISERROR('La clase ya tiene un horario asignado en esta franja horaria.', 16, 1);
        RETURN;
    END

    INSERT INTO Schedules
    (
        ScheduleInfo,
        ScheduleCreation,
        ScheduleDay,
        ScheduleStart,
        ScheduleEnd,
        ScheduleExpiration,
        SubjectId,
        TeacherId,
        ClassId
    )
    VALUES
    (
        @ScheduleInfo,
        GETDATE(), -- Fecha actual
        @ScheduleDay,
        @ScheduleStart,
        @ScheduleEnd,
        @ScheduleExpiration, -- Fecha de expiraci�n autom�tica (31 de diciembre del presente a�o)
        @SubjectId,
        @TeacherId,
        @ClassId
    )
END
GO


CREATE OR ALTER PROC dbo.spSchedules_Update
(
    @IdSchedule INT,
    @ScheduleInfo VARCHAR(100),
    @ScheduleDay VARCHAR(15),
    @ScheduleStart TIME,
    @ScheduleEnd TIME,
    @SubjectId INT,
    @TeacherId INT,
    @ClassId INT
)
AS
BEGIN
    -- Verificar si ya existe un horario con el mismo maestro en el mismo d�a y hora
    IF EXISTS (SELECT 1
               FROM Schedules
               WHERE ScheduleDay = @ScheduleDay
               AND ScheduleStart = @ScheduleStart
               AND ScheduleEnd = @ScheduleEnd
               AND TeacherId = @TeacherId
               AND IdSchedule != @IdSchedule)
    BEGIN
        RAISERROR('El maestro ya tiene un horario asignado en esta franja horaria.', 16, 1);
        RETURN;
    END

    -- Verificar si ya existe un horario con la misma clase en el mismo d�a y hora
    IF EXISTS (SELECT 1
               FROM Schedules
               WHERE ScheduleDay = @ScheduleDay
               AND ScheduleStart = @ScheduleStart
               AND ScheduleEnd = @ScheduleEnd
               AND ClassId = @ClassId
               AND IdSchedule != @IdSchedule)
    BEGIN
        RAISERROR('La clase ya tiene un horario asignado en esta franja horaria.', 16, 1);
        RETURN;
    END

    UPDATE Schedules
    SET 
        ScheduleInfo = @ScheduleInfo,
        ScheduleDay = @ScheduleDay,
        ScheduleStart = @ScheduleStart,
        ScheduleEnd = @ScheduleEnd,
        SubjectId = @SubjectId,
        TeacherId = @TeacherId,
        ClassId = @ClassId
    WHERE IdSchedule = @IdSchedule
END
GO

CREATE OR ALTER PROC dbo.spSchedules_Delete
(
    @IdSchedule INT
)
AS
BEGIN
    DELETE FROM Schedules
    WHERE IdSchedule = @IdSchedule
END
GO

CREATE OR ALTER PROC dbo.spSchedules_GetById
(
    @IdSchedule INT
)
AS
BEGIN
    SELECT 
        IdSchedule,
        ScheduleInfo,
        ScheduleCreation,
        ScheduleDay,
        ScheduleStart,
        ScheduleEnd,
        ScheduleExpiration,
        SubjectId,
        TeacherId,
        ClassId
    FROM Schedules
    WHERE IdSchedule = @IdSchedule
END
GO

---[Procesos almacenados para tabla Grades]---
CREATE OR ALTER PROC dbo.spGrades_Insert --Insert
	@GradeName VARCHAR(50)
AS
BEGIN
	INSERT INTO Grades VALUES(@GradeName)
END
GO

CREATE OR ALTER PROC dbo.spGrades_Update --Edit
	@GradeId INT, 
	@GradeName VARCHAR(50)
AS
BEGIN
	UPDATE Grades SET GradeName = @GradeName WHERE GradeId = @GradeId
END
GO

CREATE OR ALTER PROC dbo.spGrades_Delete --Delete
	@GradeId INT
AS
BEGIN
	DELETE FROM Grades WHERE GradeId = @GradeId
END
GO

CREATE OR ALTER PROC dbo.spGrades_GetById --GetbyId
	@GradeId INT
AS
BEGIN
	SELECT GradeId, GradeName FROM Grades WHERE GradeId = @GradeId
END
GO

CREATE OR ALTER PROC dbo.spGrades_GetAll --GetAll
AS
BEGIN
	SELECT * FROM Grades
END
GO

---[Procesos almacenados para tabla Section]---
CREATE OR ALTER PROC dbo.spSections_Insert --Insert
	@SectionName VARCHAR(50),
	@SectionInfo VARCHAR(100)
AS
BEGIN
	INSERT INTO Sections VALUES(@SectionName, @SectionInfo)
END
GO

CREATE OR ALTER PROC dbo.spSections_Update --Edit
	@SectionId INT, 
	@SectionName VARCHAR(50),
	@SectionInfo VARCHAR(100)
AS
BEGIN
	UPDATE Sections SET SectionName = @SectionName, SectionInfo = @SectionInfo WHERE SectionId = @SectionId
END
GO

CREATE OR ALTER PROC dbo.spSections_Delete --Delete
	@SectionId INT
AS
BEGIN
	DELETE FROM Sections WHERE SectionId = @SectionId
END
GO

CREATE OR ALTER PROC dbo.spSections_GetById --GetbyId
	@SectionId INT
AS
BEGIN
	SELECT SectionId, SectionName, SectionInfo FROM Sections WHERE SectionId = @SectionId
END
GO

CREATE OR ALTER PROC dbo.spSections_GetAll --GetAll
AS
BEGIN
	SELECT * FROM Sections
END
GO

CREATE OR ALTER PROC dbo.spStudents_GetByClassId
(@ClassId INT)
AS
BEGIN
    SELECT C.StudentId, S.StudentName, S.StudentLastName, S.StudentAge, S.StudentGender, S.StudentParentName
	FROM Classrooms C
	INNER JOIN
		Students S ON S.StudentId = c.StudentId
    INNER JOIN
		Classes Cl ON Cl.ClassId = C.ClassId
    WHERE C.ClassId = @ClassId;
END
GO

---[Procesos almacenados para tabla Classes]---
CREATE OR ALTER PROCEDURE dbo.spClasses_GetAll
AS
BEGIN
    SELECT 
        c.ClassId,
        c.ClassInfo,
        c.GradeId,
        g.GradeName,
        c.SectionId,
        s.SectionName
    FROM 
        Classes c
    INNER JOIN 
        Grades g ON c.GradeId = g.GradeId
    INNER JOIN 
        Sections s ON c.SectionId = s.SectionId
END;
GO

CREATE OR ALTER PROCEDURE dbo.spClasses_Insert
(
    @ClassInfo VARCHAR(100),
    @GradeId INT,
    @SectionId INT
)
AS
BEGIN
    -- Verificar si ya existe un registro con el mismo grado y secci�n
    IF EXISTS (SELECT 1 FROM Classes WHERE GradeId = @GradeId AND SectionId = @SectionId)
    BEGIN
        RAISERROR('Ya existe un registro con el mismo grado y secci�n.', 16, 1);
        RETURN;
    END

    INSERT INTO Classes
    (
        ClassInfo,
        GradeId,
        SectionId
    )
    VALUES
    (
        @ClassInfo,
        @GradeId,
        @SectionId
    )
END;
GO

CREATE OR ALTER PROCEDURE dbo.spClasses_Update
(
    @ClassId INT,
    @ClassInfo VARCHAR(100),
    @GradeId INT,
    @SectionId INT
)
AS
BEGIN
    -- Verificar si ya existe otro registro con el mismo grado y secci�n
    IF EXISTS (SELECT 1 FROM Classes WHERE GradeId = @GradeId AND SectionId = @SectionId AND ClassId != @ClassId)
    BEGIN
        RAISERROR('Ya existe un registro con el mismo grado y secci�n.', 16, 1);
        RETURN;
    END

    UPDATE Classes
    SET 
        ClassInfo = @ClassInfo,
        GradeId = @GradeId,
        SectionId = @SectionId
    WHERE ClassId = @ClassId
END;
GO

CREATE OR ALTER PROCEDURE dbo.spClasses_Delete
(
    @ClassId INT
)
AS
BEGIN
    DELETE FROM Classes
    WHERE ClassId = @ClassId
END;
GO

CREATE OR ALTER PROCEDURE dbo.spClasses_GetById
(
    @ClassId INT
)
AS
BEGIN
    SELECT 
        ClassId,
        ClassInfo,
        GradeId,
        SectionId
    FROM Classes
    WHERE ClassId = @ClassId
END;
GO