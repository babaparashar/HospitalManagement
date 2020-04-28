using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Departments
    {
        public Departments()
        {
            Doctors = new HashSet<Doctors>();
            HealthCareAssistants = new HashSet<HealthCareAssistants>();
            Patients = new HashSet<Patients>();
        }

        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public string DepartmentLocation { get; set; }
        public int DoctorId { get; set; }
        public int PatientId { get; set; }
        public int HealthCareAssistantId { get; set; }
        public string DepartmentType { get; set; }

        public virtual Doctors Doctor { get; set; }
        public virtual HealthCareAssistants HealthCareAssistant { get; set; }
        public virtual Patients Patient { get; set; }
        public virtual ICollection<Doctors> Doctors { get; set; }
        public virtual ICollection<HealthCareAssistants> HealthCareAssistants { get; set; }
        public virtual ICollection<Patients> Patients { get; set; }
    }
}
