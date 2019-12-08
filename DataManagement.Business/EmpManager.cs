using DataManagement.Entities;
using DataManagement.Repository.Interfaces;
using EmpManagement.Business.Interfaces;
using System.Collections.Generic;

namespace DataManagement.Business
{
    public class EmpManager : IEmpManager<Emp>
    {
        public IEmpManager<Emp> _empManager;
        public EmpManager(IEmpManager<Emp> emp)
        {
            _empManager = emp;
        }
        public void AddEmp(Emp objEmp)
        {
            _empManager.AddEmp(objEmp);
        }

        public void DeleteEmp(int Id)
        {
            _empManager.DeleteEmp(Id);
        }

        public IEnumerable<Emp> GetAllEmp()
        {
            return _empManager.GetAllEmp();
        }

        public Emp GetEmpById(int Id)
        {
            return _empManager.GetEmpById(Id);
        }

        public void UpdateEmp(Emp objEmp)
        {
            _empManager.UpdateEmp(objEmp);
        }
    }
}
