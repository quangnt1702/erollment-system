﻿
using DataAccess.Models;
using DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EnrollmentSystemApp
{
    public partial class frmAdminCourses : Form
    {
        public User LoginUser { get; set; }
        ICourseRepository courseRepository = new CourseRepository();
        BindingSource source;
        public frmAdminCourses()
        {
            InitializeComponent();
        }

        private void frmAdminCourses_Load(object sender, EventArgs e)
        {
            var context = new EnrollmentSystemContext();
            var subject = context.Subjects.ToList();
            cbbSubject.DisplayMember = "SubjectName";
            cbbSubject.ValueMember = "SubjectId";
            cbbSubject.DataSource = subject;
            LoadCourseList();
        }

        public void LoadCourseList()
        {
            var courses = courseRepository.GetCourses();
            var list = (from c in courses
                        select new
                        {
                            CourseID = c.CourseId,
                            CourseName = c.CourseName,
                            SubjectID = c.Subject.SubjectName,
                            LecturerID = c.Lecturer.UserName,
                            StudentQuantity = c.StudentQuantity,
                            StartDate = c.StartDate,
                            EndDate = c.EndDate,
                            StatusID = c.Status.StatusName
                        }).ToList();
            try
            {
                source = new BindingSource();
                source.DataSource = list;

                txtCourseID.DataBindings.Clear();

                txtCourseID.DataBindings.Add("Text", source, "CourseID");

                dgvCourses.DataSource = null;
                dgvCourses.DataSource = source;
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Load courses list");
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            frmAdminCourseDetails frmAdminCourseDetails = new frmAdminCourseDetails
            {
                Text = "Create New Course",
                InsertOrUpdate = false,
                CourseRepository = courseRepository
            };
            if (frmAdminCourseDetails.ShowDialog() == DialogResult.OK)
            {
                LoadCourseList();
                source.Position = source.Count - 1;
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            int courseID = int.Parse(txtCourseID.Text);
            Course couse = courseRepository.GetCourseByID(courseID);
            if (LoginUser.RoleId == 1)
            {
                if (btnDelete.Enabled == true)
                {
                    frmAdminCourseDetails frmAdminCourseDetails = new frmAdminCourseDetails()
                    {
                        Text = "Update Course",
                        InsertOrUpdate = true,
                        courseInfo = couse,
                        CourseRepository = courseRepository
                    };
                    if (frmAdminCourseDetails.ShowDialog() == DialogResult.OK)
                    {
                        LoadCourseList();
                        source.Position = source.Count - 1;
                    }
                }
                else
                {
                    MessageBox.Show("Empty list course");
                }
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int courseID = int.Parse(txtCourseID.Text);
                if (MessageBox.Show("Do you want to delete?", "Notification", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    courseRepository.DeleteCourse(courseID);
                    LoadCourseList();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Delete Employee");
            }
        }

        private void btnAllCourses_Click(object sender, EventArgs e)
        {
            LoadCourseList();
        }

        private void btnReady_Click(object sender, EventArgs e)
        {
            LoadCourseByID(3);
        }

        private void btnStarting_Click(object sender, EventArgs e)
        {
            LoadCourseByID(1);
        }

        private void btnEnding_Click(object sender, EventArgs e)
        {
            LoadCourseByID(2);
        }

        public void LoadCourseByID(int statusID)
        {
            var courses = courseRepository.GetCourseByStatus(statusID);
            var list = (from c in courses
                        select new
                        {
                            CourseID = c.CourseId,
                            CourseName = c.CourseName,
                            SubjectID = c.Subject.SubjectName,
                            LecturerID = c.Lecturer.UserName,
                            StudentQuantity = c.StudentQuantity,
                            StartDate = c.StartDate,
                            EndDate = c.EndDate,
                            StatusID = c.Status.StatusName
                        }).ToList();
            try
            {
                source = new BindingSource();
                source.DataSource = list;

                txtCourseID.DataBindings.Clear();

                txtCourseID.DataBindings.Add("Text", source, "CourseID");

                dgvCourses.DataSource = null;
                dgvCourses.DataSource = source;
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Load courses list");
            }
        }

        public void LoadCourseBySubject(int subjectID)
        {
            var courses = courseRepository.GetCourseBySubject(subjectID);
            var list = (from c in courses
                        select new
                        {
                            CourseID = c.CourseId,
                            CourseName = c.CourseName,
                            SubjectID = c.Subject.SubjectName,
                            LecturerID = c.Lecturer.UserName,
                            StudentQuantity = c.StudentQuantity,
                            StartDate = c.StartDate,
                            EndDate = c.EndDate,
                            StatusID = c.Status.StatusName
                        }).ToList();
            try
            {
                source = new BindingSource();
                source.DataSource = list;

                txtCourseID.DataBindings.Clear();

                txtCourseID.DataBindings.Add("Text", source, "CourseID");

                dgvCourses.DataSource = null;
                dgvCourses.DataSource = source;
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Load courses list");
            }
        }

        private void cbbSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            int subject = (int)cbbSubject.SelectedValue;
            LoadCourseBySubject(subject);
        }

        private void btnFilter_Click(object sender, EventArgs e)
        {
            var listFilter = courseRepository.GetCourses().Where(c => c.StartDate >= dtpFrom.Value.Date && c.EndDate <= dtpTo.Value.Date).ToList();
            try
            {
                var list = (from c in listFilter
                            select new
                            {
                                CourseID = c.CourseId,
                                CourseName = c.CourseName,
                                SubjectID = c.Subject.SubjectName,
                                LecturerID = c.Lecturer.UserName,
                                StudentQuantity = c.StudentQuantity,
                                StartDate = c.StartDate,
                                EndDate = c.EndDate,
                                StatusID = c.Status.StatusName
                            }).ToList();
                source = new BindingSource();
                source.DataSource = list;

                txtCourseID.DataBindings.Clear();

                txtCourseID.DataBindings.Add("Text", source, "CourseID");

                dgvCourses.DataSource = null;
                dgvCourses.DataSource = source;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Load course list");
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            var listSearch = courseRepository.GetCourses().Where(c => c.CourseName.ToLower().Contains(txtSearch.Text.ToLower())).ToList();
            try
            {
                var list = (from c in listSearch
                            select new
                            {
                                CourseID = c.CourseId,
                                CourseName = c.CourseName,
                                SubjectID = c.Subject.SubjectName,
                                LecturerID = c.Lecturer.UserName,
                                StudentQuantity = c.StudentQuantity,
                                StartDate = c.StartDate,
                                EndDate = c.EndDate,
                                StatusID = c.Status.StatusName
                            }).ToList();
                source = new BindingSource();
                source.DataSource = list;


                txtCourseID.DataBindings.Clear();

                txtCourseID.DataBindings.Add("Text", source, "CourseID");

                dgvCourses.DataSource = null;
                dgvCourses.DataSource = source;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Load course list");
            }
        }
    }
}
