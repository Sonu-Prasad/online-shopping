function addToCart(pid,pname,pprice)
{
	console.log(pid+ "  "+pname+"  "+pprice);
	let cart=localStorage.getItem("cart");
		
	if(cart==null)
			{
				let products=[];
				let prodct={productId:pid,prodctName:pname,productQantity:1,productPrice:pprice};
				products.push(prodct);
	   			localStorage.setItem("cart",JSON.stringify(products));
				console.log("prodct is added first time");
				
			}else{
			
				let pcart=JSON.parse(cart);
				
				console.log("pcart i else "+(pcart.length));
				
			//	console.log("pcart value "+(pcart[0].productId));
			  var match=0;
					for (index = 0; index < pcart.length; index++)
					{ 
						console.log(pcart[index].productId+"   "+pid);
					  
						if((pcart[index].productId)==pid)  
						   {
								match=1;
					            break;
						   }
					} 
					if(match==1)
						{
							pcart[index].productQantity=pcart[index].productQantity+1;
					        localStorage.setItem("cart",JSON.stringify(pcart));
							console.log("same item");
						
						}else{
							let prodct={productId:pid,prodctName:pname,productQantity:1,productPrice:pprice};
							pcart.push(prodct);
							localStorage.setItem("cart",JSON.stringify(pcart)); 
							match=0;
							console.log("product is added");
							
						}
				
			}
	updateart()
}

function updateart()
{
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
		if(cart==null || cart.length==0)
			{
				console.log("cart is empty");
				$(".cart-items").html("( 0 )");
				$(".cart-body").html("<h3> Cart does not have any items </h3>");
				$(".checkout-btn").attr('disabled', true); 
				
			}else{
				console.log(cart);
				$(".cart-items").html(`( ${cart.length} )`);
				let table=`
						<table class="table">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">Item Name</th>
						      <th scope="col">Item Quantity</th>
						      <th scope="col">Item MRP</th>
						      <th scope="col">Total price</th>
						      <th scope="col">Action</th>
						      </tr>
						  </thead>
						
					<tbody>
				`;
				let totalprice=0;
				cart.map((item)=>{
					
					table+=`
							    <tr> 
									<td>${item.prodctName}</td>
							      	<td>${item.productQantity}</td>
							      	<td>${item.productPrice}</td>
							      	<td>${item.productPrice * item.productQantity}</td>
							      	<td><button onclick="deleteItemFromCart(${item.productId})" type="button" class="btn btn-danger btn-sm">Remove</button></td>
							    </tr>
							    
							`
						totalprice+=item.productPrice * item.productQantity;
				})
				
				table=table+`
								
								<tr><td colspan='5' class="text-right font-weight-bold">Total Price : ${totalprice}</td></tr>
								</tbody></table>`;
				$(".cart-body").html(table);
				$(".checkout-btn").attr('disabled', false); 
			}
}

function deleteItemFromCart(pid)
{
	let cart=JSON.parse(localStorage.getItem("cart"));
	let newCart=cart.filter((item)=>item.productId!=pid)
	localStorage.setItem("cart",JSON.stringify(newCart));
	console.log("item removed"+pid);
	updateart()
	
}

function gotoCheckout()
{
	
	window.location="checkout.jsp";
}

$(document).ready(function (){
	updateart()
})
