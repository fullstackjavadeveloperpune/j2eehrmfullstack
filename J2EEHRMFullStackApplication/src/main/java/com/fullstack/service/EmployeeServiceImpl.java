package com.fullstack.service;

import java.util.List;

import com.fullstack.dao.EmployeeDao;
import com.fullstack.dao.EmployeeDaoImpl;
import com.fullstack.model.Employee;

public class EmployeeServiceImpl implements EmployeeService {

	EmployeeDao employeeDao = new EmployeeDaoImpl();

	@Override
	public void signUp(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.signUp(employee);
	}

	@Override
	public boolean signIn(String empEmailId, String empPassword) {
		// TODO Auto-generated method stub
		return employeeDao.signIn(empEmailId, empPassword);
	}

	@Override
	public Employee findById(int empId) {
		// TODO Auto-generated method stub
		return employeeDao.findById(empId);
	}

	@Override
	public List<Employee> findAll() {
		// TODO Auto-generated method stub
		return employeeDao.findAll();
	}

	@Override
	public void update(int empId, Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.update(empId, employee);
	}

	@Override
	public void deleteById(int empId) {
		// TODO Auto-generated method stub
		employeeDao.deleteById(empId);
	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		employeeDao.deleteAll();
	}

}
