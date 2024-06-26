﻿using DEMO_PuellaSchoolAPP.Data;
using DEMO_PuellaSchoolAPP.Models;

namespace DEMO_PuellaSchoolAPP.Repositories.RClassrooms
{
    public class ClassroomsRepository : IClassroomsRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public ClassroomsRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task AddAsync(ClassroomModel classrooms)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spClassrooms_Insert",
                new { classrooms.ClassId, classrooms.StudentId });
        }

        public async Task DeleteAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spClassrooms_Delete",
                new { ClassroomId = id }
                );
        }

        public async Task EditAsync(ClassroomModel classrooms)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spClassrooms_Update",
				new { ClassroomId = classrooms.ClassroomId, ClassId = classrooms.ClassId, StudentId = classrooms.StudentId }
				);
        }

        public async Task<IEnumerable<ClassroomModel>> GetAllAsync()
        {
           var classrooms = await _dataAccess.GetData1Async<ClassroomModel, StudentModel, ClassModel, dynamic>(
                "dbo.spClassrooms_GetAll",
                new { },
                (classroom, student, classs) =>
                {
                    classroom.Students = student;
                    classroom.Class = classs;
                    return classroom;
                },
                splitOn: "StudentName,ClassInfo"
            );
            return classrooms;
        }

        public async Task<IEnumerable<StudentModel>> GetAllStudents()
        {
            return await _dataAccess.GetDataAsync<StudentModel, dynamic>(
                "dbo.spStudents_GetAll",
                new { }
                );
        }

        public async Task<ClassroomModel?> GetByIdAsync(int id)
        {
            var classroom = await _dataAccess.GetDataAsync<ClassroomModel, dynamic>(
                "dbo.spClassrooms_GetById",
                new { ClassroomId = id }
                );

            return classroom.FirstOrDefault();
        }

        public async Task<IEnumerable<ClassModel>> GetAllClassAsync()
        {
            return await _dataAccess.GetDataAsync<ClassModel, dynamic>(
                "dbo.spClasses_GetAll",
                new { }
            );
        }
    }
}
