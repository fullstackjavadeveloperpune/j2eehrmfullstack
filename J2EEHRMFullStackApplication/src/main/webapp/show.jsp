<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>


<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>Employee List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>



	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: 	green">
			<div>
				<a href="http://www.fullstackjavadeveloper.in" class="navbar-brand"> User
					Employee Mgnt App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Employee</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Employees</h3>
			<hr>
			<div class="container text-left">

				<a href="index.jsp" class="btn btn-success">Add
					New Employee Data</a>
			</div> 
			
		  
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th><a href="EmployeeController?action=sortbyid">Id</a></th>
						<th><a href="EmployeeController?action=sortbyname">Name</a></th>
						<th>Address</th>
						<th> <a href="EmployeeController?action=sortbystate">State </a></th>
						<th> <a href="EmployeeController?action=sortbysalary">Salary</a></th>
						<th>Contact Number</th>			
						<th> <a href="EmployeeController?action=sortbygender"> Gender</a></th>
						<th><a href="EmployeeController?action=sortbydept">Department</a></th>
						<th><a href="EmployeeController?action=sortbydob">DOB</a></th>
						<th>UID</th>
						<th>PanCard</th>
						<th>Email</th>
						<th>Password</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="employee" items="${empList}">

						<tr>
							<td><c:out value="${employee.empId}" /></td>
							<td><c:out value="${employee.empName}" /></td>
							<td><c:out value="${employee.empAddress}" /></td>
							<td><c:out value="${employee.empState}" /></td>
							<td><c:out value="${employee.empSalary}"/></td>
							<td><c:out value="${employee.empContactNumber}" /></td>
							
							
							
							<td><c:out value="${employee.empGender}"/></td>
								<td><c:out value="${employee.empDept}"/></td>
								<td><fmt:formatDate value = "${employee.empDOB}"  type = "date"  pattern = "dd-MM-yyyy" /></td>
							
						
							
							<td><c:out value="${employee.empUID}" /></td>
							<td><c:out value="${employee.empPanCard}" /></td>
							
							<td><c:out value="${employee.empEmailId}" /></td>
							<td><c:out value="${employee.empPassword}" /></td>
							<td><a href="EmployeeController?action=edit_form&empid=<c:out value='${employee.empId}' />" class="btn btn-success">Update</a>
								 <a
								href="EmployeeController?action=deletebyid&empid=<c:out value='${employee.empId}' />" class="btn btn-danger">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
			
			
			
			<a href="EmployeeController?action=deleteall" class="btn btn-danger">Delete All Employee Data</a>
		</div>
	
</body>
</html>
