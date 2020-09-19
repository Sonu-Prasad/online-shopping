package controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.AddItems;
import entity.Category;
import entity.Product;

@MultipartConfig
public class addItems extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String type=request.getParameter("operation");
		
		System.out.println(type);
		if(type.equals("categoris"))
		{
			String title=request.getParameter("categoryTitle");
			String desc=request.getParameter("categoriesDescription");
			System.out.println(desc);
			Category cat=new Category();
				cat.setCategoryTitle(title);
				cat.setcategoriesDescription(desc);
			
				int id=AddItems.saveCategoris(cat);
					if(id>0)
					{
						System.out.println("categroris add scessfll");
						HttpSession session=request.getSession();
						session.setAttribute("message","Categories Scessflly Added");
						response.sendRedirect("adminUser.jsp");
						return;
						
					}
			
		}else if(type.equals("product"))
		{
			String pName=request.getParameter("pName");
			String pPrice=request.getParameter("pPrice");
			String pQuantity=request.getParameter("pQuantity");
			String pDiscount=request.getParameter("pDiscount");
			String categories=request.getParameter("categories");
			String pDesc=request.getParameter("pDesc");
			
			Product product=null;
			
			Part part=request.getPart("img");
			try {
				
				String path=request.getRealPath("img")+File.separator+"product"+File.separator+part.getSubmittedFileName();
				
				product=new Product();
					product.setpName(pName);
					product.setpPrice(Integer.parseInt(pPrice));
					product.setpDesc(pDesc);
					product.setpQuantity(Integer.parseInt(pQuantity));
					product.setpDiscount(Integer.parseInt(pDiscount));
					product.setPhoto(part.getSubmittedFileName());
					
					product.setCategories(AddItems.getCategoryById(Integer.parseInt(categories)));
					
					System.out.println(AddItems.getCategoryById(Integer.parseInt(categories)));
				
					int id=AddItems.saveProduct(product);
				
				if(id>0)
				{
					System.out.println("productsucessflly added");
				}
					
				FileOutputStream fos=new FileOutputStream(path);
				InputStream is=part.getInputStream();
				byte[] data=new byte[is.available()];
				
				is.read(data);
				fos.write(data);
				fos.close();
				
				System.out.println(pName+" "+pPrice+" "+pQuantity+" "+pDiscount+" "+categories+" "+pDesc+"  "+path);
			
				HttpSession session=request.getSession();
				session.setAttribute("message","Products Scessflly Added");
				response.sendRedirect("adminUser.jsp");
				return;
				
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			}
	}
	

}
