using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class Medicines
    {
        public int MedicineId { get; set; }
        public string MedicineName { get; set; }
        public string MedicineType { get; set; }
        public string MedicineDescription { get; set; }
        public int? PatientId { get; set; }
        public byte[] MedicineApplyTime { get; set; }

        public virtual Patients Patient { get; set; }
    }
}
