<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/registerStyle.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
				 onclick="register()"/>
		</div>
	</form:form>
	<script type="text/javascript">
		var acceptColor = "#4BE115";
		var declineColor = "#F71B1B";
		var loginCorrect = false;
		var passwordsCorrect = false;
		
		function register()
		{			
			if(loginCorrect && passwordCorrect)
				{
				console.log("inside");
				$("#registerForm").submit();
				}
			else
				alert("Your form has errors");
		}
		
		$(document).ready(function()
		{
			//Check login avaiable
			$("#loginField").blur(function()
			{				
				var login = $("#loginField").val();
				if(login.length == 0){
					$("#loginField").css({"background":"white"});
					$("#loginError").text("");
					loginCorrect = false;
				}
					
				$.ajax({
					url:"avaiable/"+login,
					success:function(response){
						if(response){
							$("#loginField").css({"background":acceptColor});
							$("#loginError").text("");
							loginCorrect = true;
						}
						else{
							$("#loginField").css({"background":declineColor});
							$("#loginError").text("This login is not avaiable");
							loginCorrect = false;
						}
					}
				})
			})	
			
			//Check correctness of passwords
			$("#passwordField,#repasswordField").blur(function(){
				var password = $("#passwordField").val();
				var repassword = $("#repasswordField").val();
				
				if(password.length == 0 || repassword.length == 0)
				{
					$("#passwordField").css({"background":"white"});
					$("#repasswordField").css({"background":"white"});
					$("#passwordError").text("");
					passwordCorrect = false;
				}
				else
				{
					if(password == repassword)
					{
						$("#passwordField").css({"background":acceptColor});
						$("#repasswordField").css({"background":acceptColor});	
						$("#passwordError").text("");
						passwordCorrect = true;
					}
					else
					{
						$("#passwordField").css({"background":declineColor});
						$("#repasswordField").css({"background":declineColor});	
						$("#passwordError").text("Not the same passwords");
						passwordCorrect = false;						
					}						
				}
					
			})
			
		});
		
	</script>
</body>
</html>