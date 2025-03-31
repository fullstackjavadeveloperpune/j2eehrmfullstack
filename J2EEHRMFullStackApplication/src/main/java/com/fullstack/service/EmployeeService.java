package com.fullstack.service;

import java.util.List;

import com.fullstack.model.Employee;

public interface EmployeeService {
	
	void signUp(Employee employee);

	boolean signIn(String empEmailId, String empPassword);

	Employee findById(int empId);

	List<Employee> findAll();

	void update(int empId, Employee employee);

	void deleteById(int empId);

	void deleteAll();

}
