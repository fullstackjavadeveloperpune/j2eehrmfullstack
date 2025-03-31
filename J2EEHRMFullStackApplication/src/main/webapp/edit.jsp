<%@page import="com.fullstack.service.EmployeeServiceImpl"%>
<%@page import="com.fullstack.service.EmployeeService"%>
<%@page import="com.fullstack.model.Employee"%>
<%@page import="java.text.SimpleDateFormat"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
</head>
<body style="background-color: gray;">
<%
	Employee employee = new Employee();
%>
<%
	EmployeeService employeeServiceImpl = new EmployeeServiceImpl();
%>
<form method="GET" action='EmployeeController' name="frmEditUser"><input
	type="hidden" name="action" value="edit" /> <%
 	String uid = request.getParameter("empid");
 	if (!((uid) == null)) {
 		int id = Integer.parseInt(uid);
 		employee = employeeServiceImpl.findById(id);
 		

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		String dob = simpleDateFormat.format(employee.getEmpDOB());
 %>
<table>
	<tr>
		<td>Employee Id</td>
		<td><input type="text" name="empid" readonly="readonly"
			value="<%=employee.getEmpId()%>"></td>
	</tr>
	<tr>
		<td>Employee Name</td>
		<td><input type="text" name="empname" value="<%=employee.getEmpName()%>"/></td>
	</tr>
	
	<tr>
		<td>Employee Address</td>
		<td><input type="text" name="empaddress" value="<%=employee.getEmpAddress()%>"/></td>
	</tr>
	
	<tr>
		<td>Employee State</td>
		<td><input type="text" name="empstate" value="<%=employee.getEmpState()%>"/></td>
	</tr>
	
	
	<tr>
		<td>Employee Salary</td>
		<td><input type="text" name="empsalary" value="<%=employee.getEmpSalary()%>"/></td>
	</tr>
	
	<tr>
		<td>Employee Contact Number</td>
		<td><input type="text" name="empcontactnumber" value="<%=employee.getEmpContactNumber()%>"/></td>
	</tr>

	
	<tr>
		<td>Employee Gender</td>
		<td><input type="text" name="empgender" value="<%=employee.getEmpGender()%>"/></td>
	</tr>
	
	<tr>
		<td>Employee Department</td>
		<td><input type="text" name="empdept" value="<%=employee.getEmpDept()%>"/></td>
	</tr>
	
	<tr>
		<td> Employee DOB</td>
		<td><input type="text" name="empdob" value="<%=dob%>"/></td>
	</tr>
	
	<tr>
		<td>Employee UID</td>
		<td><input type="text" name="empuid" value="<%=employee.getEmpUID()%>"/></td>
	</tr>
	
	
	<tr>
		<td>Employee Pan Card</td>
		<td><input type="text" name="emppancard" value="<%=employee.getEmpPanCard()%>"/></td>
	</tr>
	
	<tr>
		<td>Employee Email</td>
		<td><input type="text" name="empemailid" value="<%=employee.getEmpEmailId()%>"/></td>
	</tr>
	
	<tr>
		<td>Employee Password</td>
		<td><input type="password" name="emppassword" value="<%=employee.getEmpPassword()%>"/></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Update" /></td>
	</tr>
</table>
<%
	} else
		out.println("ID Not Found");
%>
</form>
</body>
</html>