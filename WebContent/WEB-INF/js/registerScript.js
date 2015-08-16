var acceptColor = "#4BE115";
var declineColor = "#F71B1B";
var loginCorrect = false;
var passwordsCorrect = false;

$(document).ready(function() {
	// Check login avaiable
	$("#loginField").blur(function() {
		var login = $("#loginField").val();
		if (login.length == 0)
			setLoginFieldUndefined();

		$.ajax({
			url : "avaiable/" + login,
			success : function(response) {
				if (response)
					setLoginField(true);
				else
					setLoginField(false);
			}
		})
	});

	// Check correctness of passwords
	$("#passwordField,#repasswordField").blur(function() {
		var password = $("#passwordField").val();
		var repassword = $("#repasswordField").val();

		if (password.length == 0 || repassword.length == 0)
			setPasswordFieldsUndefined();
		else {
			if (password == repassword)
				setPasswordFields(true);
			else
				setPasswordFields(false);
		}

	});
});

function register() {
	if (loginCorrect && passwordCorrect)
		$("#registerForm").submit();	
}

function setPasswordFields(state) {
	if (state) {
		$("#passwordField").css({
			"background" : acceptColor
		});
		$("#repasswordField").css({
			"background" : acceptColor
		});
		$("#passwordError").text("");
		passwordCorrect = true;
	} else {
		$("#passwordField").css({
			"background" : declineColor
		});
		$("#repasswordField").css({
			"background" : declineColor
		});
		$("#passwordError").text("Password are not the same");
		passwordCorrect = false;
	}
}

function setPasswordFieldsUndefined() {
	$("#passwordField").css({
		"background" : "white"
	});
	$("#repasswordField").css({
		"background" : "white"
	});
	$("#passwordError").text("");
	passwordCorrect = false;
}

function setLoginFieldUndefined() {
	$("#loginField").css({
		"background" : "white"
	});
	$("#loginError").text("");
	loginCorrect = false;
}

function setLoginField(state) {
	if (state) {
		$("#loginField").css({
			"background" : acceptColor
		});
		$("#loginError").text("");
		loginCorrect = true;
	} else {
		$("#loginField").css({
			"background" : declineColor
		});
		$("#loginError").text("This login is not avaiable");
		loginCorrect = false;
	}
}