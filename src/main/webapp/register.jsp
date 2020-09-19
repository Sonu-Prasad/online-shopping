<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@include file="components/css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6 offset-md-3">

				<div class="card">
					<div class="card-body">
					<%@include file="components/message.jsp" %>
					<h3 class="text-center">Signup Here !</h3>
						<form action="Register" method="post">
							<div class="form-group">
								<label for="userName">userName</label> <input type="text"
									class="form-control" name="userName" id="userName"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1" name="useEmail"
									aria-describedby="emailHelp"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="userPassword" id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="userNameuserPhone">userPhone</label> <input
									type="number" class="form-control" name="userPhone"
									id="userPhone">
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">userAddress</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="3" name="userAddress"></textarea>
							</div>
							<button type="submit" class="btn btn-primary">Register</button>
						</form>
					</div>
				</div>


			</div>

		</div>
	</div>
</body>
</html>
