<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/registerStyle.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="js/registerScript.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:url value="/register" var="registerAction" />
	<form:form commandName="account" id="registerForm" method="post"
		action="${registerAction}" class="basic-grey">
		<h1>
			Register Form <span>Please fill all the texts in the fields.</span>
		</h1>
		<div>
			<span>Login</span>
			<form:input id="loginField" path="accountName" placeholder="Login" />
			<div id="loginError" class="errorElem"></div>
		</div>
		<div>
			<span>Password</span>
			<form:password id="passwordField" path="password"
				placeholder="Password"/>
			<div id="passwordError" class="errorElem"></div>
			
		</div>
		<div>
			<span>Retype password</span> <input type="password"
				id="repasswordField" placeholder="Repassword" /> 
		</div>
		<div>
			<span>&nbsp;</span> <input type="button" class="button" value="Register"
				 onclick="setTimeout(register(),2000);"/>
		</div>
	</form:form>
</body>
</html>