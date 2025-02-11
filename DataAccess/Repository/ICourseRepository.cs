﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Models;

namespace DataAccess.Repository
{
    public interface ICourseRepository
    {
        IEnumerable<Course> GetCourses();
        IEnumerable<Course> GetCoursesByUserId(string userId);
        Course GetCourseByID(int courseId);
        void DeleteCourse(int courseId);
        void InsertCourse(Course course);
        void UpdateCourse(Course course);
        int GetNumberStudent(int courseId);
        IEnumerable<Course> GetCourseByStatus(int statusID);
        IEnumerable<Course> GetCourseBySubject(int subjectID);
        void CheckStatusCourse();
        IEnumerable<Course> GetCourseListOfLecturer(string lecturerId);
        IEnumerable<Course> GetCourseByStatusAndID(int statusID, string userID);

    }
}
