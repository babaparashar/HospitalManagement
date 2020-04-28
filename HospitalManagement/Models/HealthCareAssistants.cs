using System;
using System.Collections.Generic;

namespace HospitalManagement.Models
{
    public partial class HealthCareAssistants
    {
        public HealthCareAssistants()
        {
            Departments = new HashSet<Departments>();
        }

        public int HealthCareAssistantId { get; set; }
        public string AssistantName { get; set; }
        public string AssistantMobile { get; set; }
        public string AssistantAddress { get; set; }
        public int? DepartmentId { get; set; }
        public int? DoctorId { get; set; }

        public virtual Departments Department { get; set; }
        public virtual Doctors Doctor { get; set; }
        public virtual ICollection<Departments> Departments { get; set; }
    }
}
