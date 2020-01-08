<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
  border-radius: 12px;
}

/* Full-width input fields */
input[type=text], input[type=password], input[type=number] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
  border-radius: 12px;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
  border-radius: 12px;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}

.ui{
    padding-left: 30%;
    padding-right: 30%;
    padding-top: 5%;
    background-color: #add2c9;  
}

.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>
</head>
<body>



<div class="ui">
<form method="GET" action="processregister">
  <div class="container">
    <h1 align="center">New User Registration</h1>
    <hr>

    
    <input name="name" placeholder="Enter your name" type="text" required/>
    <br>
    
    <input name="mobileno" placeholder="Enter your mobile number" type="text" required/>
    <c:if test="${message!=null}">
    	<div class="alert">
  		<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  		<strong><c:out value="${message}"/></strong>
		</div>     
        
    </c:if>
    <br>
    
    <input name="password" placeholder="Choose your password" type="password" required/>
    <br>
    <label for="accounttype">Account type:</label><br>
    <input type="radio" name="accounttype" value="prepaid"> Prepaid<br>
    <input type="radio" name="accounttype" value="postpaid"> Postpaid<br>


	  <br>
    <input name="balance" placeholder="Enter your initial balance" type="number" />
    <hr>


    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="home">Sign in</a>.</p>
  </div>
</form>

</div>

</body>
</html>
