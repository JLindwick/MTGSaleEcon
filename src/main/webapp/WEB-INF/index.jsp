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
.btn-group{
	display:flex;
	flex-direction:column;
	width:15%;
	border:1px solid black;
}
.btn-group button:not(:last-child) {
  border-bottom: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
  background-color: coral;
}
.mainBody {
margin-bottom:10%;
margin-top:5%;
margin-left:10%;
margin-right:5%;
font-family:Goudy Medieval;
height:25%;
width:80%;
  font-size: 20px;
overflow:scroll;
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
<h2>About Magic the Gathering</h2>
<br>
			Magic: The Gathering (colloquially known as Magic or MTG) is a tabletop and digital collectible card game created by Richard Garfield. Released in 1993 by Wizards of the Coast (now a subsidiary of Hasbro), Magic was the first trading card game and had approximately thirty-five million players as of December 2018, and over twenty billion Magic cards were produced in the period from 2008 to 2016, during which time it grew in popularity.

A player in Magic takes the role of a Planeswalker, a powerful wizard who can travel ("walk") between dimensions ("planes") of the Multiverse, doing battle with other players as Planeswalkers by casting spells, using artifacts, and summoning creatures as depicted on individual cards drawn from their individual decks. A player defeats their opponent typically (but not always) by casting spells and attacking with creatures to deal damage to the opponent's "life total," with the objective being to reduce it from 20 to 0. Although the original concept of the game drew heavily from the motifs of traditional fantasy role-playing games such as Dungeons & Dragons, the gameplay bears little similarity to paper-and-pencil games, while simultaneously having substantially more cards and more complex rules than many other card games.

Magic can be played by two or more players, either in person with printed cards or on a computer, smartphone or tablet with virtual cards through the Internet-based software Magic: The Gathering Online or other video games such as Magic: The Gathering Arena and Magic Duels. It can be played in various rule formats, which fall into two categories: constructed and limited. Limited formats involve players building a deck spontaneously out of a pool of random cards with a minimum deck size of 40 cards; in constructed formats, players create decks from cards they own, usually with a minimum of 60 cards per deck.

New cards are released on a regular basis through expansion sets. Further developments include the Wizards Play Network played at the international level and the worldwide community Players Tour, as well as a substantial resale market for Magic cards. Certain cards can be valuable due to their rarity in production and utility in gameplay, with prices ranging from a few cents to tens of thousands of dollars.
</div>

<rssapp-carousel id="vYD5SaI9PXnMrwpa"></rssapp-carousel><script src="https://widget.rss.app/v1/carousel.js" type="text/javascript" async></script>	</div>

</body>
</html>