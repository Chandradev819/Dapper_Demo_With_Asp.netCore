using Dapper;
using DataManagement.Entities;
using DataManagement.Repository;
using DataManagement.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace EmpManagement.Repository
{
    public  class EmpRepository<T> : BaseRepository, IEmpRepository<Emp>
    {
        public void AddEmp(Emp objEmp)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                con.Open();
                parameters.Add("EmpName", objEmp.EmpName);
                parameters.Add("EmpAddress", objEmp.EmpAddress);
                parameters.Add("EmailId", objEmp.EmailId);
                parameters.Add("MobileNum", objEmp.MobileNum);
                SqlMapper.Execute(con, "AddEmp", param: parameters, commandType: CommandType.StoredProcedure);

                //For implementing commandtimeout and transaction
                // SqlMapper.Execute(con, "AddEmp", param: parameters, transaction:null, commandTimeout: 100, commandType: CommandType.StoredProcedure);
                // Other approach to excecute Storeprocedure in dapper
                // con.Execute("AddEmp", parameters, null, null, commandType: CommandType.StoredProcedure);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void DeleteEmp(int Id)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("Id", Id);
                SqlMapper.Execute(con, "DeleteEmp", param: parameters, commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IEnumerable<Emp> GetAllEmp()
        {
            try
            {
                return SqlMapper.Query<Emp>(con, "GetAllEmps", commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Emp GetEmpById(int Id)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("Id", Id);
                return SqlMapper.Query<Emp>(con, "GetEmpById", parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void UpdateEmp(Emp objEmp)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                con.Open();
                parameters.Add("EmpName", objEmp.EmpName);
                parameters.Add("EmpAddress", objEmp.EmpAddress);
                parameters.Add("EmailId", objEmp.EmailId);
                parameters.Add("MobileNum", objEmp.MobileNum);
                parameters.Add("Id", objEmp.Id);
                SqlMapper.Execute(con, "UpdateEmp", param: parameters, commandType: CommandType.StoredProcedure);
            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}
