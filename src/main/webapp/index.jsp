<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<%@page import="entity.Product"%>
<%@page import="dao.AddItems"%>
<%@page import="helper.DescModify"%>


<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@include file="components/css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<%@include file="components/carosal.jsp"%>
	<div class="container product">
			
		<div class="text-center">
		          
		</div>
		<div class="row">

			<%
				List<Category> list = AddItems.getAllCategory();
				List<Product> prodctList =null;
			
				String catId=request.getParameter("category");
				
				
					if(catId==null||catId.trim().equals("all"))
					{
						 prodctList = AddItems.getAllProduct();
					}else{
						prodctList = AddItems.getAllProductById(catId);
					}
				
			%>

			<div class="col-md-2 mt-2">
				<div class="list-group">

					<li class="list-group-item active">Categories</li>

					<%
						for (Category cat : list) {
					%>
					<a href="index.jsp?category=<%=cat.getCategoryID() %>" class="list-group-item list-group-item-action"><%=cat.getCategoryTitle()%></a>

					<%
						}
					%>


				</div>
			</div>
			<div class="col-md-10">

				<div class="row">
					<div clasd="col-md-12">
						<div class="card-columns mt-2">
							<%
								for (Product product : prodctList) {
								
							%>
							<div class="card">
								<div class="container text-center ">
								<img src="img/product/<%= product.getPhoto()%>" 
										style="max-height:200px;max-width:100%;width:auto" class="card-img-top m-2" alt="...">
								
								</div>
								<div class="card-body">
									<h5 class="card-title"><%=product.getpName()%></h5>
									<p class="card-text"><%=DescModify.getModify10words(product.getpDesc())%></p>
									
								</div>
								<div class="text-center m-2">
									<button type="button" class="btn btn-outline-success"> &#8377;
										<%=Product.getCalclatedPrice(product.getpPrice(), product.getpDiscount()) %>
										<span class="text-secondary ml-1 discont-label"> <del style="color: red">&#8377;<%=product.getpPrice()%></del> ( <%=product.getpDiscount() %>% off )</span></button>
								
								</div>

								<div class="card-footer">
			 						<button type="button" class="btn btn-primary" 
			 					
			 						onclick="addToCart(<%=product.getpID()%>,'<%=product.getpName()%>',<%=product.getpPrice()%>)" >Add To Card</button> 
									</div>
							</div>

							<%
								}
							%>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
<%@include file="components/commonModel.jsp" %>


</body>
</html>
