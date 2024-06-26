﻿using System.ComponentModel.DataAnnotations;

namespace DEMO_PuellaSchoolAPP.Models
{
    public class GradeModel
    {
        public int GradeId { get; set; }

        [Display(Name = "Grado")]
        [Required(ErrorMessage = "El nombre del grado es obligatorio")]
        public string GradeName { get; set; }
    }
}
