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
width:85%
}
.top img {
padding:5%;
}
.bottom {
display:flex;
width:85%;
margin-left:10%;
border:1px solid black;
flex-direction:row;
text-align:center;
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
	<div class="top">
	
		<img style="width:500px;"src="${image }" alt="card" />
<table class="table">
  <thead>
    <tr>
      <th scope="col">Card Name</th>
      <th scope="col">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>${card.getString("name") }</th>
      <th >${card.getString("oracle_text") }</th>
      </tr>
          <c:if test="${user.admin == true}">
	      <tr>
	      
	      	<th>
	      	<h4>Administration</h4>
      	    <form:form action="/addToStore" method="post" class="form-inline my-2 my-lg-0">
      	    				<input type="hidden" name="cardName" value="${card.getString('name') }"/>
      	    
			<h6>Price</h6>
		      <input class="form-control" style="width:100%;" name="cardPrice" aria-label="cardPrice">
		    <h6>Condition</h6>
			  <input class="form-control " style="width:100%;" name="cardCondition" aria-label="cardCondition">
			  <br><br>
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Add to inventory</button>
		    </form:form>
	      	</th>
	      </tr>
      </c:if>
  </tbody>
</table>
         </div>
         <div class="bottom">
        
 <h4>Legalities per format</h4>
<table style="border-left:1px solid black;" rules="all">
   <thead>
   <tr>
	   <th scope="col">Standard</th>
   	   <th scope="col">Oldschool</th>
   	   <th scope="col">Historic Brawl</th>
  	   <th scope="col">historic</th>
  	   
   	   <th scope="col">legacy</th>
   	   <th scope="col">Pauper commander</th>
   	   <th scope="col">Gladiator</th>
   	   <th scope="col">Alchemy</th>
   	</tr>
   	</thead>
   	<tbody>
   	<tr>
   	  <th style="width:30%">${legal.getString('standard').replace("_", " ")}</th>
      <th style="width:30%">${legal.getString('oldschool').replace("_", " ")}</th>
      <th style="width:30%">${legal.getString('historicbrawl').replace("_", " ")}</th>
      <th style="width:30%">${legal.getString('historic').replace("_", " ")}</th>
      <th style="width:30%">${legal.getString('legacy').replace("_", " ")}</th>
      <th style="width:30%">${legal.getString('paupercommander').replace("_", " ")}</th>
      <th style="width:30%">${legal.getString('gladiator').replace("_", " ")}</th>
      <th style="width:30%">${legal.getString('alchemy').replace("_", " ")}</th>
    </tr>
   	</tbody>
</table>

<table style="border-left:1px solid black;" rules="all">
   	<thead>
   	<tr>
  	   <th scope="col">Pioneer</th>
   	   <th scope="col">Commander</th>
   	   <th scope="col">Modern</th>
   	   <th scope="col">Pauper</th>
   	   <th scope="col">Pre Modern</th>
  	   <th scope="col">Future</th>
   	   <th scope="col">Vintage</th>
   	   <th scope="col">Duel</th>
   	   <th scope="col">Explorer</th>
   	   <th scope="col">Brawl</th>
  	   <th scope="col">Penny</th>
   	 </tr>
   	 </thead>
   	 <tbody>
   	 <tr>
	      <th style="width:30%">${legal.getString('pioneer').replace("_", " ")}</th>
	      <th style="width:30%">${legal.getString('commander').replace("_", " ")}</th>
	      <th style="width:30%">${legal.getString('modern').replace("_", " ")}</th>
	      <th style="width:30%">${legal.getString('pauper').replace("_", " ")}</th>
	      <th style="width:30%">${legal.getString('premodern').replace("_", " ")}</th>
	      <th style="width:30%">${legal.getString('future').replace("_", " ")}</th>
	      <th style="width:30%">${legal.getString('vintage').replace("_", " ")}</th>
	      <th style="width:30%">${legal.getString('duel').replace("_", " ")}</th>
	     <th style="width:30%">${legal.getString('explorer').replace("_", " ")}</th>
      <th style="width:30%">${legal.getString('brawl').replace("_", " ")}</th>
      <th style="width:30%">${legal.getString('penny').replace("_", " ")}</th>
      </tr>
   	 </tbody>
   	 </table>
   	 <table rules="all">
   	 <thead>
   	 <tr>

  	 </tr>
   <tbody>
      <tr>

    </tr>
  </tbody>
</table>
   </div>
</div>
</body>
</html>