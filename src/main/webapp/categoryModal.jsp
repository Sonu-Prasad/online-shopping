<%@page import="entity.User"%>
<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<%@page import="dao.AddItems"%>
<!-- categories start Modal -->
	<div class="modal fade" id="addcategories" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Fill
						Categories Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="addItems" method="post">
						<input type="hidden" name="operation" value="categoris">
						<div class="form-group">
							<label for="categoryTitle">categoryTitle</label> <input
								type="text" class="form-control" id="categoryTitle"
								name="categoryTitle" placeholder="Enter categoryTitle">

						</div>
						<div class="form-group">
							<label for="exampleFormControlTextarea1">categoriesDescription</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								name="categoriesDescription" rows="3"></textarea>
						</div>
						<div class="text-center">
							<button type="sbmit" class="btn btn-outline-success">Submit</button>
						</div>

					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

	<!-- categories end Modal -->