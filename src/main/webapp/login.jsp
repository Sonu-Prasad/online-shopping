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
						<div class="card-header custombg text-white text-center">
						<h4>Login Here !!</h2>
						</div>
						<%@include file="components/message.jsp" %>
						<form action="login" method="post">
							<div class="form-group mt-2">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" name="useEmail" id="exampleInputEmail1"
									aria-describedby="emailHelp"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" name="userPassword"  id="exampleInputPassword1">
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-outline-success ">Submit</button>
							<button type="reset"class="btn btn-outline-info ">Reset</button>
							</div>
							
						</form>
					</div>
				</div>


			</div>

		</div>
	</div>
</body>
</html>
