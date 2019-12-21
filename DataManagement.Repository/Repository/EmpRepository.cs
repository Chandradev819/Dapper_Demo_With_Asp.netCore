using Dapper;
using DataManagement.Entities;
using DataManagement.Repository;
using DataManagement.Repository.Interfaces;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace EmpManagement.Repository
{
    public  class EmpRepository<T> : IEmpRepository<Emp>
    {
        private readonly IConfiguration _config;
        public EmpRepository(IConfiguration config)
        {
            _config = config;
        }
        internal IDbConnection DbConnection => new SqlConnection(_config.GetConnectionString("SQLDBConnectionString"));
        public void AddEmp(Emp objEmp)
        {
                using (IDbConnection con = DbConnection)
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("EmpName", objEmp.EmpName);
                    parameters.Add("EmpAddress", objEmp.EmpAddress);
                    parameters.Add("EmailId", objEmp.EmailId);
                    parameters.Add("MobileNum", objEmp.MobileNum);
                    SqlMapper.Execute(con, "AddEmp", param: parameters, commandType: CommandType.StoredProcedure);
                }
        }

        public void DeleteEmp(int Id)
        {
                using (IDbConnection con = DbConnection)
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("Id", Id);
                    SqlMapper.Execute(con, "DeleteEmp", param: parameters, commandType: CommandType.StoredProcedure);
                }
        }

        public IEnumerable<Emp> GetAllEmp()
        {
            using (IDbConnection con = DbConnection)
            {
                return SqlMapper.Query<Emp>(con, "GetAllEmps", commandType: CommandType.StoredProcedure);
            }
            
        }

        public Emp GetEmpById(int Id)
        {
            using (IDbConnection con = DbConnection)
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("Id", Id);
                return SqlMapper.Query<Emp>(con, "GetEmpById", parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
            
        }
        public void UpdateEmp(Emp objEmp)
        {
            using (IDbConnection con = DbConnection)
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("EmpName", objEmp.EmpName);
                parameters.Add("EmpAddress", objEmp.EmpAddress);
                parameters.Add("EmailId", objEmp.EmailId);
                parameters.Add("MobileNum", objEmp.MobileNum);
                parameters.Add("Id", objEmp.Id);
                SqlMapper.Execute(con, "UpdateEmp", param: parameters, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
