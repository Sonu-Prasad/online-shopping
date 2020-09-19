package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entity.User;

public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("useEmail");
		String pass=request.getParameter("userPassword");
		
		User user=UserDAO.getByEmailAndPassword(email, pass);
		if(user!=null)
		{
			System.out.println(user);
			HttpSession session=request.getSession();
			session.setAttribute("user",user);
			System.out.println("user   "+user.getUserType());
			if(user.getUserType().equals("admin"))
			{
				response.sendRedirect("adminUser.jsp");
			}else {
				response.sendRedirect("index.jsp");
			}
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("message","Invalid Email and Password");
			response.sendRedirect("login.jsp");
		}
		
	}

}
