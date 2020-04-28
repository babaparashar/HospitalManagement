using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Beds
    {
        public Beds()
        {
            Patients = new HashSet<Patients>();
        }

        public int BedId { get; set; }
        public int PatientId { get; set; }
        public DateTimeOffset AllocationDateTime { get; set; }
        public DateTimeOffset DateTimeOfDischarge { get; set; }

        public virtual Patients Patient { get; set; }
        public virtual ICollection<Patients> Patients { get; set; }
    }
}
