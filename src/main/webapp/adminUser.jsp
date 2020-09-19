<%@page import="entity.User"%>
<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<%@page import="dao.AddItems"%>
<%@page import="dao.UserDAO"%>

<%
	User user = (User) session.getAttribute("user");

if (user == null) {
	session.setAttribute("message", "you are not loged in ! Login first");
	response.sendRedirect("login.jsp");
	return;
} else if (!user.getUserType().equals("admin")) {
	session.setAttribute("message", "Invalid User you are not Admin");
	response.sendRedirect("login.jsp");

} else {
	//List<Product> productlist=AddItems.getAllProduct();
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="components/css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container admin">
		<%@include file="components/message.jsp"%>
		<div class="row mt-5">
			<div class="col-md-4 text-center">
				<div class="card">
					<div class="card-body">
						<img alt="img" class="rounded-circle w-25" src="img/woman.png">
						<h5 class="card-title">Total Users</h5>
						<h5 class="card-title"><%=UserDAO.getAllUser().size() %></h5>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-center">
		
				<div class="card">
					<div class="card-body">
						<img alt="img" class="rounded-circle w-25" src="img/list.png">
						<h5 class="card-title">Total Categories</h5>
						<h5 class="card-title"><%=AddItems.getAllCategory().size() %></h5>
					</div>
				</div>
			</div>
			<div class="col-md-4 text-cetner">
			
				<div class="card">
					<div class="card-body text-center">
						<img alt="img" class="rounded-circle w-25" src="img/prodct.png">
						<h5 class="card-title">Total prodct</h5>
						<h5 class="card-title"><%=AddItems.getAllProduct().size() %></h5>
					</div>
				</div>
			</div>
		</div>


		<div class="row mt-2">
			<div class="col-md-6 text-center">
				<div class="card" >
					<div class="card-body text-left">
						<div class="row">
						<div class="col-md-6 text-center">
						<img alt="img" class="rounded-circle w-25" src="img/addcat.jpg">
						<h3 class="card-title">Categories</h3>
						</div>
						<div class="col-md-6">
							<button type="button" class="btn btn-outline-success  btn-block" data-toggle="modal" data-target="#addcategories">Add Categories</button>
							<button type="button" class="btn btn-outline-warning  btn-block">Update Categories</button>
							<button type="button" class="btn btn-outline-danger  btn-block">Delete Categories</button>
						</div>
					</div>
					
						
					</div>
				</div>
				
			</div>
			<div class="col-md-6 text-center">
				<div class="card">
					<div class="card-body">
					<div class="row">
						<div class="col-md-6 text-center">
						<img alt="img" class="rounded-circle w-25" src="img/addprodct.png">
						<h3 class="card-title">Product</h3>
						
						</div>
						<div class="col-md-6">
							<button type="button" class="btn btn-outline-success  btn-block" data-toggle="modal" data-target="#addproduct">Add Product</button>
							<button type="button" class="btn btn-outline-warning  btn-block">Update Product</button>
							<button type="button" class="btn btn-outline-danger  btn-block"  data-toggle="modal" data-target="#daleteproduct">Delete Product</button>
						</div>
					</div>
						
					</div>
				</div>
			</div>

		</div>


	</div>

	
	<!-- categories end product Modal -->
	<%@include file="ProductModal.jsp" %>
	<%@include file="categoryModal.jsp" %>
	<%@include file="components/commonModel.jsp" %>
</body>
</html>

<%} %>
