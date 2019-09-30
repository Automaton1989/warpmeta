<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login or Register</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
		<div class="col-6">
		    <h1>Register!</h1>
		    <p><form:errors path="user.*"/></p>
		    
		    <form:form method="POST" action="/registration" modelAttribute="user">
		    	<div class="form-group">
		    		<form:label path="userName">Username</form:label>
		    		<form:input class="form-control" type="text" path="userName" placeholder="Enter Username..."/>
		    	</div>
		        <div class="form-group">
		            <form:label path="email">Email:</form:label>
		            <form:input class="form-control" type="email" path="email" placeholder="Enter Email..."/>
		        </div>
		        <div class="form-group">
		            <form:label path="password">Password:</form:label>
		            <form:password class="form-control" path="password" placeholder="Enter Password..."/>
		        </div>
		        <div class="form-group">
		            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
		            <form:password class="form-control" path="passwordConfirmation" placeholder="Confirm Password..."/>
		        </div>
		        <input class="btn btn-primary" type="submit" value="Register!"/>
		    </form:form>
		</div>
		<div class="col-6">
		    <h1>Login</h1>
		    <p><c:out value="${error}" /></p>
		    <form:form method="POST" action="/login" modelAttribute="user">
		    	<div class="form-group">
		            <form:label path="email">Email</form:label>
		            <form:input class="form-control" aria-describedby="emailHelp" type="text" name="email" path="email" placeholder="Enter Email..."/>
		        </div>
		    	<div class="form-group">
		            <form:label path="password">Password</form:label>
		            <form:input class="form-control" type="password" path="password" name="password" placeholder="Enter Password..."/>
		            <small class="form-text text-muted">We'll never share your password</small>
		        </div>
		        <input class="btn btn-success" type="submit" value="Login!"/>
		    </form:form> 
		</div>
		</div>
	</div>
</body>
</html>