<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
#formLogin{padding: 15px; min-width:300px;}

.mainBody {
	display:flex;
	flex-direction:column;
}
.top {
display:flex;
flex-direction:row;
margin-left:10%;
margin-top:2%;
border:1px solid black;
width:80%
}
.top img {
padding:5%;
}
.bottom {
display:flex;
flex-direction:column;
}
</style>
<title>Dashboard</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Trading Card Shop</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
           
   <c:if test="${userId == null}">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Login 
        </a>
                            <div class="dropdown-menu" id="formLogin">
                        <div class="row">
                            <div class="container-fluid">
						<form:form action="/login" method="post" modelAttribute="newLogin">
                                    <div class="form-group">
										<form:label path="email">Email</form:label>
										<form:errors path="email"/>
										<form:input style="width:100%;" path="email"/>
                                    </div>
                                    <div class="form-group">
										<form:label path="password">Password</form:label>
										<form:errors path="password"/>
										<form:input  style="width:100%;" type="password" path="password"/>
                                    </div>
                                    <button type="submit" id="btnLogin" class="btn btn-success btn-sm">Login</button>
                                </form:form>
                            </div>
                            </div>
                            </div>
      </li>
            <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Register
        </a>
                            <div class="dropdown-menu" id="formLogin">
                        <div class="row">
                            <div class="container-fluid">
		<form:form action="/register" class="form" method="post" modelAttribute="newUser">
				<form:input type="hidden" path="admin" value="0"/>
		
                                    <div class="form-group">
										<form:label path="email">Email</form:label>
										<form:errors path="email"/>
										<form:input style="width:100%;" path="email"/>
                                    </div>
                                    <div class="form-group">
										<form:label path="userName">User Name</form:label>
										<form:errors path="userName"/>
										<form:input style="width:100%;" path="userName"/>
                                    </div>
                                    <div class="form-group">
										<form:label path="password">Password</form:label>
										<form:errors path="password"/>
										<form:input  style="width:100%;" type="password" path="password"/>
                                    </div>
                                    <div class="form-group">
										<form:label path="confirm">Confirm Password</form:label>
										<form:errors path="confirm"/>
										<form:input  style="width:100%;" type="password" path="confirm"/>
                                    </div>
                                    <button type="submit" id="btnLogin" class="btn btn-success btn-sm">Login</button>
                                </form:form>
                                </div>
                                </div>
                               
                            </div>
      </li>
      </c:if>
      <c:if test="${userId != null}">
      <li class="nav-item">
        <a class="nav-link" href="/viewProduct">View Store Inventory</a>
      </li>
            <li class="nav-item">
        <a class="nav-link" href="/logout">Logout</a>
      </li>
      </c:if>
    </ul>
    
    <form:form action="/search" modelAttribute="search" method="post" style="margin-left:20%;" class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search"  name="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form:form>
    <a href="/viewCart"><img style="width:20%" src="https://www.freeiconspng.com/thumbs/shopping-cart-icon/shopping-cart-icon-2.png" alt="cart" /></a>

  </div>
</nav>
<div class="mainBody">
<table class="table">
<thead>
	<tr>
		<td>Card Name</td>
		<td>Card Condition</td>
		<td>Card Price</td>
	</tr>
</thead>
<tbody>
      <c:forEach items="${cart}" var="current">
        <tr>
          <td><c:out value="${current.cardName}" /></td>
		  <td><c:out value="${current.cardCondition}" /></td>
		  <td>$<c:out value="${current.cardPrice}" /></td>
		  
        </tr>
        </c:forEach>

</tbody>
</table>
<c:if test="${total<.1 }">
 <p style="margin-left:80%"><b>Total: $</b> <c:out value="${Math.round(total) }"></c:out></p>
</c:if>
<c:if test="${total>.5 }">

 <p style="margin-left:80%"><b>Total: $</b> <c:out value="${Math.round(total/.5) *.5}"></c:out></p> 		
 </c:if>
</div>
        <div id="paypal-button-container"></div>
        <!-- Sample PayPal credentials (client-id) are included -->
        <script src="https://www.paypal.com/sdk/js?client-id=test&currency=USD&intent=capture&enable-funding=venmo" data-sdk-integration-source="integrationbuilder"></script>

        <script>
          const fundingSources = [
            paypal.FUNDING.PAYPAL,
              paypal.FUNDING.VENMO,
              paypal.FUNDING.PAYLATER,
              paypal.FUNDING.CARD
            ]

          for (const fundingSource of fundingSources) {
            const paypalButtonsComponent = paypal.Buttons({
              fundingSource: fundingSource,

              // optional styling for buttons
              // https://developer.paypal.com/docs/checkout/standard/customize/buttons-style-guide/
              style: {
                shape: 'rect',
                height: 40,
              },

              // set up the transaction
              createOrder: (data, actions) => {
                // pass in any options from the v2 orders create call:
                // https://developer.paypal.com/api/orders/v2/#orders-create-request-body
                const createOrderPayload = {
                  purchase_units: [
                    {
                      amount: {
                        value: ${total},
                      },
                    },
                  ],
                }

                return actions.order.create(createOrderPayload)
              },

              // finalize the transaction
              onApprove: (data, actions) => {
                const captureOrderHandler = (details) => {
                  const payerName = details.payer.name.given_name
                  console.log('Transaction completed!')
                }

                return actions.order.capture().then(captureOrderHandler)
              },

              // handle unrecoverable errors
              onError: (err) => {
                console.error(
                  'An error prevented the buyer from checking out with PayPal',
                )
              },
            })

            if (paypalButtonsComponent.isEligible()) {
              paypalButtonsComponent
                .render('#paypal-button-container')
                .catch((err) => {
                  console.error('PayPal Buttons failed to render')
                })
            } else {
              console.log('The funding source is ineligible')
            }
          }
        </script>
</body>
</html>