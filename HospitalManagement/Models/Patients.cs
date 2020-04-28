using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Patients
    {
        public Patients()
        {
            Beds = new HashSet<Beds>();
            Departments = new HashSet<Departments>();
            Medicines = new HashSet<Medicines>();
        }

        public int PatientId { get; set; }
        public string PatientName { get; set; }
        public string PatientMobile { get; set; }
        public string PatientAddress { get; set; }
        public string PatientEmail { get; set; }
        public string PatientSymptoms { get; set; }
        public short? PatientAge { get; set; }
        public DateTimeOffset? PatientAdmittedDate { get; set; }
        public DateTimeOffset? PatientDischargeDate { get; set; }
        public string PatientGender { get; set; }
        public int? DepartmentId { get; set; }
        public int? DoctorId { get; set; }
        public int? BedId { get; set; }

        public virtual Beds Bed { get; set; }
        public virtual Departments Department { get; set; }
        public virtual Doctors Doctor { get; set; }
        public virtual ICollection<Beds> Beds { get; set; }
        public virtual ICollection<Departments> Departments { get; set; }
        public virtual ICollection<Medicines> Medicines { get; set; }
    }
}
