
<%
	String message = (String) session.getAttribute("message");
if (message != null) {
%>
<div class="alert alert-warning alert-dismissible "
	role="alert">
	<strong>
		<%
			out.println(message);
			session.removeAttribute("message");
		}
		%>
	</strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
