﻿    using DEMO_PuellaSchoolAPP.Models;
    using DEMO_PuellaSchoolAPP.Repositories.RClassrooms;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;

    namespace DEMO_PuellaSchoolAPP.Controllers
    {
        [Authorize]
        public class ClassroomController : Controller
        {
            private readonly IClassroomsRepository _classroomsRepository;
            private SelectList _studentsList;

            public ClassroomController(IClassroomsRepository classroomsRepository)
            {
                _classroomsRepository = classroomsRepository;
                
            }

            public async Task<ActionResult> Index()
            {

                var clasrooms = await _classroomsRepository.GetAllAsync();
                    _studentsList = new SelectList(
                                        await _classroomsRepository.GetAllStudents(),
                                        nameof(StudentModel.StudentId),
                                        nameof(StudentModel.StudentName)
                        );

                return View(clasrooms);
            }

            [HttpGet]
            public ActionResult Create()
            {
                ViewBag.TheStudent = _studentsList;
                return View();
            }

            [HttpPost]
            [ValidateAntiForgeryToken]
            public async Task<ActionResult> Create(ClassroomModel classrooms)
            {
                try
                {
                    await _classroomsRepository.AddAsync(classrooms);

                    return RedirectToAction(nameof(Index));
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;

                    ViewBag.TheStudent = _studentsList;

                    return View(classrooms);
                }
            }

            [HttpGet]
            public async Task<ActionResult> Edit(int id)
            {
                var classrooms = await _classroomsRepository.GetByIdAsync(id);

                if (classrooms == null)
                    return NotFound();

                _studentsList = new SelectList(
                                        await _classroomsRepository.GetAllStudents(),
                                        nameof(StudentModel.StudentId),
                                        nameof(StudentModel.StudentName),
                                        classrooms?.Students?.StudentId
                    );


                return View(classrooms);
            }

            [HttpPost]
            [ValidateAntiForgeryToken]
            public async Task<ActionResult> Edit(ClassroomModel classrooms)
            {
                try
                {
                    await _classroomsRepository.EditAsync(classrooms);

                    return RedirectToAction(nameof(Index));
                }
                catch (Exception ex)
                {
                    ViewBag.TheStudent = _studentsList;
                    ViewBag.Error = ex.Message;
                    return View(classrooms);
                }
            }

            [HttpGet]
            public async Task<ActionResult> Delete(int id)
            {
                var classrooms = await _classroomsRepository.GetByIdAsync(id);

                if (classrooms == null)
                {
                    return NotFound();
                }

                return View(classrooms);
            }

            [HttpPost]
            [ValidateAntiForgeryToken]
            public async Task<ActionResult> Delete(ClassroomModel classrooms)
            {
                try
                {
                    await _classroomsRepository.DeleteAsync(classrooms.ClassroomId);
                    return RedirectToAction(nameof(Index));
                }
                catch
                {
                    return View();
                }
            }
        }
    }
