using System.Collections.Generic;

namespace DataManagement.Repository.Interfaces
{

    public interface IEmpRepository<T> where T : class
    {
        IEnumerable<T> GetAllEmp();
        T GetEmpById(int id);
        void AddEmp(T entity);
        void DeleteEmp(int id);
        void UpdateEmp(T entity);
    }


}
