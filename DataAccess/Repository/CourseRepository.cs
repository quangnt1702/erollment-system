﻿using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class CourseRepository : ICourseRepository
    {
        public List<TblCourse> GetAllCourse() => CourseDAO.Instance.GetAllCourse();
    }
}
