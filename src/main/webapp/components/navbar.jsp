<%@page import="entity.User"%>
<%
	User user1 = (User) session.getAttribute("user");
	
%>
<nav class="navbar navbar-expand-lg navbar-light custombg">
	<div class="container">
		<a class="navbar-brand" href="#">ECom</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">Disabled</a></li>
			</ul>
			
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active" data-toggle="modal" data-target="#cart"><a class="nav-link"
					href="#"><i class="fa fa-cart-plus" style="font-size: 20px;"></i>
					<span class="ml-0 cart-items" style="font-size: 20px;"> (4)</span></a></li>
				
			</ul>
			
			<%
    if(user1==null)
	{
		%>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register </a></li>
			</ul>

			<%
	}else{
		%>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="<%=user1.getUserType().equalsIgnoreCase("admin")?"adminUser.jsp":"index.jsp" %>"><%=user1.getUserName() %> </a></li>
				<li class="nav-item active"><a class="nav-link" href="#">Logout </a></li>
			</ul>
			<%
	}

    %>

		</div>
	</div>
</nav>