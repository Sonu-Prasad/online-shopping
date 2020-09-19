package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entity.User;

public class Register extends HttpServlet {
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("userName");
		String phone=request.getParameter("userPhone");
		String address=request.getParameter("userAddress");
		String email=request.getParameter("useEmail");
		String pass=request.getParameter("userPassword");
		
		System.out.println(email +"  "+pass);
		
		User user=new User(username,email, pass, phone, null,address,"normal");
		int id=UserDAO.save(user);
		if(id>0)
		{
			System.out.println("sussfully Register");
			HttpSession session=request.getSession();
			session.setAttribute("message","User Sussflly Register "+id);
			response.sendRedirect("register.jsp");
			return;
		}
	}

}
