<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
</head>
<body style="background-color: pink">

<form action="EmployeeController" method="get">

<input type="hidden" name="action" value="signup">

Employee Id<input type="text" name="empid"><br>
Employee Name<input type="text" name="empname"><br>
Employee Address<input type="text" name="empaddress"><br>
Employee State<br>
<select name="empstate">
<option value="MH">MH</option>
<option value="KA">KA</option>
<option value="MP">MP</option>
<option value="GOA">GOA</option>
<option value="NCR">NCR</option>
</select><br>

Employee Salary<input type="text" name="empsalary"><br>
Employee Contact Number<input type="text" name="empcontactnumber"><br>
Employee Gender<br>
Male<input type="radio" name="empgender" value="Male">
Female<input type="radio" name="empgender" value="Female"><br>

Employee Departments<br>
HR<input type="checkbox" name="empdept" value="HR">
R&D<input type="checkbox" name="empdept" value="R&D">
QA<input type="checkbox" name="empdept" value="QA">
Fin<input type="checkbox" name="empdept" value="Fin"><br>

Employee DOB<input type="date" name="empdob"><br>
Employee PAN CARD<input type="text" name="emppancard"><br>
Employee UID<input type="text" name="empuid"><br>
Employee Email<input type="email" name="empemailid"><br>
Employee Password<input type="password" name="emppassword"><br>

<input type="submit" value="SignUp">
</form>
</body>
</html>