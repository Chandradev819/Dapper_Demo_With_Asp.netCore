using DataManagement.Entities;
using System.Collections.Generic;

namespace EmpManagement.Business.Interfaces
{
    public interface IEmpManager
    {
        bool AddEmp(Emp objEmp);
        bool UpdateEmp(Emp objEmp);
        bool DeleteEmp(int Id);
        IEnumerable<Emp> GetAllEmp();
        Emp GetEmpById(int Id);
    }
}
