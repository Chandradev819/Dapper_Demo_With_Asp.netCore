using DataManagement.Entities;
using DataManagement.Repository.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Dapper_Demo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpController : ControllerBase
    {
        //IEmpManager _empManager;
        IEmpRepository<Emp> _empRepository;
        public EmpController(IEmpRepository<Emp> empRepository)

        {
            _empRepository = empRepository;
        }

        // GET: api/Emp
        [HttpGet]
        public IEnumerable<Emp> Get()
        {
            return _empRepository.GetAllEmp();
        }

        // GET: api/Emp/5
        [HttpGet("{id}", Name = "Get")]
        public Emp Get(int id)
        {
            return _empRepository.GetEmpById(id);
        }

        // POST: api/Emp
        [HttpPost]
        public void Post([FromBody] Emp emp)
        {
            _empRepository.AddEmp(emp);
        }

        // PUT: api/Emp/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Emp emp)
        {
            _empRepository.UpdateEmp(emp);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            _empRepository.DeleteEmp(id);
        }
    }
}
