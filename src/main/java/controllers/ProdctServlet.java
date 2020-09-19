package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import dao.AddItems;
import entity.Product;

/**
 * Servlet implementation class ProdctServlet
 */
public class ProdctServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String catId = request.getParameter("id");
		
		List<Product> prodctList =AddItems.getAllProductById(catId);
		System.out.println("categeory id  "+catId);
      
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        PrintWriter out = response.getWriter();
		out.print(gson.toJson(prodctList));
		out.flush();
		out.close();
        //System.out.println(jsonFromJavaArrayList);
}
	}


