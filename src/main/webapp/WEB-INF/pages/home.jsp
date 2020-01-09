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
    padding-bottom: 5%;
    background-color: #add2c9;
}
.alert {
  padding: 20px;
  background-color: green;
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
  <div class="container">
    <h1>Welcome <c:out value="${user.getUser().name}"/></h1>
    <hr>

    <h2> Id : <c:out value="${user.getUser().id}"/></h2>
    <h2> Account Type : <c:out value="${user.getUser().getAccountType()}"/></h2>
    <h2> Balance : <c:out value="${user.getUser().balance}"/></h2>
    <form method="get" action="recharge">
    <label ><b>Recharge:</b></label><br>
    <input name="amount" placeholder="Enter amount" type="number" required>
    <c:if test="${user.isRechargeDone()==true}">
    	<div class="alert">
  		<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  		<strong><c:out value="Recharge Successful!"/></strong>
		</div>     
        
    </c:if>
    <button type="submit" class="registerbtn">Recharge</button>
    </form>
    <a href="/signout"><button type="submit" class="registerbtn">Sign Out</button></a><br>
    
    
  </div>
</div>

</body>
</html>