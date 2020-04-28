using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Doctors
    {
        public Doctors()
        {
            Departments = new HashSet<Departments>();
            HealthCareAssistants = new HashSet<HealthCareAssistants>();
            Patients = new HashSet<Patients>();
        }

        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public string DoctorMobile { get; set; }
        public string DoctorEmail { get; set; }
        public string DoctorSpeciality { get; set; }
        public int? DepartmentId { get; set; }

        public virtual Departments Department { get; set; }
        public virtual ICollection<Departments> Departments { get; set; }
        public virtual ICollection<HealthCareAssistants> HealthCareAssistants { get; set; }
        public virtual ICollection<Patients> Patients { get; set; }
    }
}
