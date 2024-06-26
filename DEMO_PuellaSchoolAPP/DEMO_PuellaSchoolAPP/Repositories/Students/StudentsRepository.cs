﻿using Dapper;
using DEMO_PuellaSchoolAPP.Data;
using DEMO_PuellaSchoolAPP.Models;
using MiniExcelLibs;
using System.Data;

namespace DEMO_PuellaSchoolAPP.Repositories.RStudents
{
    public class StudentsRepository : IStudentsRepository
    {
        private readonly ISqlDataAccess _dataAccess;

        public StudentsRepository(ISqlDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task AddAsync(StudentModel students)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spStudents_Insert",
                new { students.StudentName, students.StudentLastName, students.StudentAge, students.StudentGender, students.StudentParentName });
        }

        public async Task DeleteAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spStudents_Delete",
                new { StudentId = id }
                );
        }

        public async Task EditAsync(StudentModel students)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spStudents_Update",
                students
                );
        }

        public async Task<IEnumerable<StudentModel>> GetAllAsync()
        {
            return await _dataAccess.GetDataAsync<StudentModel, dynamic>(
                "dbo.spStudents_GetAll",
                new { }
                );
        }

        public async Task<StudentModel?> GetByIdAsync(int id)
        {
            var student = await _dataAccess.GetDataAsync<StudentModel, dynamic>(
                "dbo.spStudents_GetById",
                new { StudentId = id }
                );

            return student.FirstOrDefault();
        }

        public async Task ImportDataAsync(string filePath)
        {
            var rows = MiniExcel.Query<StudentModel>(filePath).ToList();

            foreach (var row in rows)
            {
                var parameters = new
                {
                    row.StudentName,
                    row.StudentLastName,
                    row.StudentAge,
                    row.StudentGender,
                    row.StudentParentName
                };

                await _dataAccess.SaveDataAsync("dbo.spStudents_Insert", parameters);
            }
        }
    }
}
