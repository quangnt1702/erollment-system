﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess.Models;

namespace DataAccess
{
    class CourseDAO
    {
        private static CourseDAO instance = null;
        private static readonly object instanceLock = new object();
        private CourseDAO()
        {

        }
        public static CourseDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new CourseDAO();
                    }
                    return instance;
                }
            }
        }
        public IEnumerable<Course> GetCourseList()
        {
            var courseList = new List<Course>();
            try
            {
                using var context = new EnrollmentSystemContext();
                courseList = context.Courses.ToList();
                foreach (var course in courseList)
                {
                    course.Subject = context.Subjects.SingleOrDefault(s => s.SubjectId == course.SubjectId);
                    course.Status= context.StatusCourses.SingleOrDefault(s => s.StatusId == course.StatusId);
                    course.Lecturer = context.Users.SingleOrDefault(s => s.UserId == course.LecturerId);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return courseList;
        }

        public Course GetCourseByID(int courseId)
        {
            Course course = null;
            try
            {
                using var context = new EnrollmentSystemContext();
                course = context.Courses.SingleOrDefault(c => c.CourseId == courseId);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return course;
        }

        public void AddNew(Course course)
        {
            try
            {
                //var c = GetCourseByID(course.CourseId);
                //if (c==null)
                //{
                using var context = new EnrollmentSystemContext();
                context.Courses.Add(course);
                context.SaveChanges();
                //}
                //else
                //{
                //    throw new Exception("The course is already exist.");
                //}

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Update(Course course)
        {
            try
            {
                var c = GetCourseByID(course.CourseId);
                if (c != null)
                {
                    using var context = new EnrollmentSystemContext();
                    context.Courses.Update(course);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The course does not already exist.");
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        public void Remove(int courseId)
        {
            try
            {
                var course = GetCourseByID(courseId);
                if (course != null)
                {
                    using var context = new EnrollmentSystemContext();
                    context.Courses.Remove(course);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The course does not already exist.");
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
