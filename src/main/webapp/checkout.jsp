<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<%@page import="entity.Product"%>
<%@page import="dao.AddItems"%>
<%@page import="helper.DescModify"%>
<%
		User loginUser=(User)session.getAttribute("user");
			if(loginUser==null)
			{
				session.setAttribute("message", "you are not loged in ! Login first");
				response.sendRedirect("login.jsp");
				return;
			}
		
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="components/css_js.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="cart-body">
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<h3 class="text-center custombg">Order Deatils</h3>
					<form action="#" class="m-2">
						<div class="form-group">
						    <label for="exampleFormControlInput1">Email address</label>
						    <input type="email" class="form-control" id="exampleFormControlInput1"
						     placeholder="name@example.com" name="email" value="<%=loginUser.getUseEmail()%>">
						  </div>
						 <div class="form-group">
						    <label for="name">Name </label>
						    <input type="text" class="form-control" id="name" value="<%=loginUser.getUserName()%>" placeholder="Enter Name">
						  </div>
						 <div class="form-group">
								<label for="userNameuserPhone">Mobile No</label> <input
									type="number" class="form-control" name="userPhone"
									id="userPhone" value="<%=loginUser.getUserPhone()%>">
							</div>
						<div class="form-group">
								<label for="exampleFormControlTextarea1">userAddress</label>
								<textarea class="form-control" id="exampleFormControlTextarea1" 
									rows="3" name="userAddress" ><%=loginUser.getUserAddress()%></textarea>
							</div>
							<div class="text-right">
								<button type="submit" class="btn btn-primary">Continue Shoping</button>
								<button type="submit" class="btn btn-outline-success">Order Now</button>
							</div>
							
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="components/commonModel.jsp" %>
</body>
</html>