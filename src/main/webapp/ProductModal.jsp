<%@page import="entity.User"%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<%@page import="dao.AddItems"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<Category> list = AddItems.getAllCategory();
	List<Product> prodctList =AddItems.getAllProduct();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  
<script>
$(document).ready(function() {

$('#sports').change(function(event) {
        var catId = this.value;
        alert(this.value);
        $.ajax({
    	     type: "POST",
    	     url : "ProdctServlet",
    	     data :{id:catId},
    	   
    	      success: function(respContent) {
                // alert(transportid);
                 $("#vehicleno").attr('disabled', false);
                 var options ='<option value=' + 0 + '>' + "Select Vechile Number" + '</option>';
                 $.each(respContent,function(key, value)
                         {
               	  options +=('<option value=' + key + '>' + value + '</option>');
               	  $("#vehicleno").html(options);
                         });

    	       },
    	});
      
      });
});
</script>
</head>
<body>
<!--  add product Modal -->

 <div class="modal fade" id="addproduct" tabindex="-1" role="dialog"
 	aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> 
 	<div class="modal-dialog modal-dialog-centered" role="document">
 		<div class="modal-content">
 			<div class="modal-header"> 
 				<h5 class="modal-title" id="exampleModalLongTitle">Fill Product Details</h5>
 				<button type="button" class="close" data-dismiss="modal"
 					aria-label="Close"> 
 					<span aria-hidden="true">&times;</span>
			</button> -->
</div>
<div class="modal-body">

	<form action="addItems" method="post" enctype="multipart/form-data">
		<input type="hidden" name="operation" value="product">
		<div class="form-group">
			<label for="categoryTitle">Product Name</label> <input type="text"
				class="form-control" id="categoryTitle" name="pName"
				placeholder="Enter Prodct Name">

		</div>

		<div class="form-group">
			<label for="categoryTitle">Product Price</label> <input type="number"
				class="form-control" id="categoryTitle" name="pPrice"
				placeholder="Enter Prodct price">

		</div>
		<div class="form-group">
			<label for="categoryTitle">Product Quantity</label> <input
				type="number" class="form-control" id="categoryTitle"
				name="pQuantity" placeholder="Enter Prodct price">

		</div>
		<div class="form-group">
			<label for="categoryTitle">Product Discount</label> <input
				type="number" class="form-control" id="categoryTitle"
				name="pDiscount" placeholder="Enter Prodct Discont">

		</div>


		<div class="form-group">
			<label for="categoryTitle">Product Categories</label>
			 <select id="categoryTitle" class="form-control" name="categories">
				<option selected >Choose...</option>
				<%
					for (Category cat : list) {
				%>
				<option value="<%=cat.getCategoryID()%>"><%=cat.getCategoryTitle()%></option>

				<%
					}
				%>

			</select>
		</div>
		<div class="form-group">
			<label for="exampleFormControlFile1">Select Image</label> <input
				type="file" class="form-control-file" name="img"
				id="exampleFormControlFile1">
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">Product Description</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				name="pDesc" rows="3"></textarea>
		</div>

		<div class="text-center">
			<button type="submit" class="btn btn-outline-success ">Submit</button>
		</div>

	</form>


</div>
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

</div>
</div></div></div>



<!-- categories end product Modal -->

<!-- Delete Product Modal -->
<div class="modal fade" id="daleteproduct" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			
			<div class="modal-header">
				
				<h5 class="modal-title" id="exampleModalLongTitle">Update Product
					Details</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				
			</div>
		<div class="modal-body">
		
		<div class="form-group">
			<label for="categoryTitle">Product Categories</label>
			 <select id="sports" class="form-control" name="categories">
				<option selected >Choose...</option>
				<%
					for (Category cat : list) {
				%>
				<option value="<%=cat.getCategoryID()%>"><%=cat.getCategoryTitle()%></option>

				<%
					}
				%>

			</select>
		</div>
		
		
			<div class="form-group">
				<select id="sports">
                <option>Select Sports</option>
                <option value="Football">Football</option>
                <option value="Cricket">Cricket</option>
        </select>
        <br /> <br /> 
        Select Favorite Player:
        <select id="player">
                <option>Select Player</option>
        </select>		</div>
		
		<div class="form-group">
				<label for="categoryTitle">Product Name</label> 
				<select name="vechileNo" id='vehicleno' class='form-control' disabled>
									<option value="0">Select Product</option>
									<c:forEach var="vechile" items="${vechile}">
									   <option value="${vechile.vechileNo }">${vechile.vechileNo }</option>
									</c:forEach> 
								</select>
							</div>
		</div>
			</div>
		</div>
	</div>
</div>


<!-- Delete Product Modal end -->
</body>
</html>
