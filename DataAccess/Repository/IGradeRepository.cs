﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Models;

namespace DataAccess.Repository
{
    public interface IGradeRepository
    {
        void InsertGrade(Grade grade);
        IEnumerable<Grade> GetGradesList();
        IEnumerable<Grade> GetGradeOfStudent(string studentId, int courseId);
        Grade GetGradeByID(string studentId, int courseId);
        void UpdateGrade(Grade grade);
    }
}
