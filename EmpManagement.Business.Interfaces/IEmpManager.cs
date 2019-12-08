using System;
using System.Collections.Generic;

namespace EmpManagement.Business.Interfaces
{
    public interface IEmpManager<T> where T : class
    {
        IEnumerable<T> GetAllEmp();
        T GetEmpById(int id);
        void AddEmp(T entity);
        void DeleteEmp(int id);
        void UpdateEmp(T entity);
    }
}
