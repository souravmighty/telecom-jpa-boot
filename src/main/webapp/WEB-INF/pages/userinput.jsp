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
</style>
</head>
<body>

<div class="ui">
<form method="GET" action="logincheck">
  <div class="container">
    <h1>Sign in</h1>
    <hr>

    <label for="mobileno">Mobile No </label> 
    <input name="mobileno" placeholder="Enter your mobile number" type="text" />
    <br>
    <label for="password">Password <label> 
    <input name="password" placeholder="Enter your password" type="password" required/>
    
    <hr>


    <button type="submit" class="registerbtn">Login</button>
  </div>
  
  <div class="container signin">
    <p>New user? <a href="register">Register here</a>.</p>
  </div>
</form>
</div>

</body>
</html>