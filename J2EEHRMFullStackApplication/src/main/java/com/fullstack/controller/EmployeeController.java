package com.fullstack.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fullstack.model.Employee;
import com.fullstack.service.EmployeeService;
import com.fullstack.service.EmployeeServiceImpl;

/**
 * Servlet implementation class EmployeeController
 */
@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService employeeService = new EmployeeServiceImpl();

	String SIGNIN_PAGE = "/signin.jsp";
	String SHOWDATA_PAGE = "/show.jsp";
	String EDITDATA_PAGE = "/edit.jsp";

	/**
	 * Default constructor.
	 */
	public EmployeeController() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		String redirect = "";

		String employeeId = request.getParameter("empid");
		String action = request.getParameter("action");

		if (action.equals("signup") && employeeId != null) {
			int empId = Integer.parseInt(employeeId);
			String empName = request.getParameter("empname");
			String empAddress = request.getParameter("empaddress");
			String empState = request.getParameter("empstate");
			double empSalary = Double.valueOf(request.getParameter("empsalary"));
			long empContactNumber = Long.valueOf(request.getParameter("empcontactnumber"));
			String empGender = request.getParameter("empgender");
			String empDept = "";

			String depts[] = request.getParameterValues("empdept");
			for (int i = 0; i < depts.length; i++) {
				empDept = empDept + depts[i] + " ";
			}

			Date empDOB = null;

			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				empDOB = simpleDateFormat.parse(request.getParameter("empdob"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String empPanCard = request.getParameter("emppancard");
			long empUID = Long.valueOf(request.getParameter("empuid"));
			String empEmailId = request.getParameter("empemailid");
			String empPassword = request.getParameter("emppassword");

			Employee employee = new Employee(empId, empName, empAddress, empState, empSalary, empContactNumber,
					empGender, empDept, empDOB, empPanCard, empUID, empEmailId, empPassword);

			employeeService.signUp(employee);

			redirect = SIGNIN_PAGE;

		} else if (action.equals("signin")) {

			String empEmailId = request.getParameter("empemailid");
			String empPassword = request.getParameter("emppassword");

			if (employeeService.signIn(empEmailId, empPassword)) {
				request.setAttribute("empList", employeeService.findAll());
				redirect = SHOWDATA_PAGE;
			} else {
				request.setAttribute("msg", "Oops, Invalid Credentials. Please try again!!!!!");
				redirect = SIGNIN_PAGE;
			}

		} else if (action.equals("edit_form")) {
			redirect = EDITDATA_PAGE;
		} else if (action.equals("edit")) {

			int empId = Integer.parseInt(request.getParameter("empid"));
			String empName = request.getParameter("empname");
			String empAddress = request.getParameter("empaddress");
			String empState = request.getParameter("empstate");
			double empSalary = Double.valueOf(request.getParameter("empsalary"));
			long empContactNumber = Long.valueOf(request.getParameter("empcontactnumber"));
			String empGender = request.getParameter("empgender");
			String empDept = "";

			String depts[] = request.getParameterValues("empdept");
			for (int i = 0; i < depts.length; i++) {
				empDept = empDept + depts[i] + " ";
			}

			Date empDOB = null;

			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
			try {
				empDOB = simpleDateFormat.parse(request.getParameter("empdob"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String empPanCard = request.getParameter("emppancard");
			long empUID = Long.valueOf(request.getParameter("empuid"));
			String empEmailId = request.getParameter("empemailid");
			String empPassword = request.getParameter("emppassword");

			Employee employee = new Employee(empId, empName, empAddress, empState, empSalary, empContactNumber,
					empGender, empDept, empDOB, empPanCard, empUID, empEmailId, empPassword);

			employeeService.update(empId, employee);

			request.setAttribute("empList", employeeService.findAll());
			redirect = SHOWDATA_PAGE;

		} else if (action.equals("deletebyid")) {

			int empId = Integer.parseInt(request.getParameter("empid"));
			employeeService.deleteById(empId);
			request.setAttribute("empList", employeeService.findAll());
			redirect = SHOWDATA_PAGE;

		} else if (action.equals("deleteall")) {

			employeeService.deleteAll();
			request.setAttribute("empList", employeeService.findAll());
			redirect = SHOWDATA_PAGE;

		}else if (action.equals("sortbyid")) {
			request.setAttribute("empList",
					employeeService.findAll().stream().sorted(Comparator.comparing(Employee::getEmpId)).toList());
			redirect = SHOWDATA_PAGE;

		}else if (action.equals("sortbyname")) {
			request.setAttribute("empList",
					employeeService.findAll().stream().sorted(Comparator.comparing(Employee::getEmpName)).toList());
			redirect = SHOWDATA_PAGE;

		} else if (action.equals("sortbystate")) {
			request.setAttribute("empList",
					employeeService.findAll().stream().sorted(Comparator.comparing(Employee::getEmpState)).toList());
			redirect = SHOWDATA_PAGE;

		} else if (action.equals("sortbysalary")) {
			request.setAttribute("empList",
					employeeService.findAll().stream().sorted(Comparator.comparing(Employee::getEmpSalary)).toList());
			redirect = SHOWDATA_PAGE;

		} else if (action.equals("sortbydob")) {
			request.setAttribute("empList",
					employeeService.findAll().stream().sorted(Comparator.comparing(Employee::getEmpDOB)).toList());
			redirect = SHOWDATA_PAGE;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(redirect);

		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
