<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Login</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- Le styles -->
<link href="./resource/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

#chatroom {
	font-size: 16px;
	height: 40px;
	line-height: 40px;
	width: 300px;
}

.received {
	width: 160px;
	font-size: 10px;
}
</style>
<link href="./resource/bootstrap-responsive.css" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="./resource/js/html5shiv.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="./resource/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="./resource/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="./resource/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="./resource/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="./resource/ico/favicon.png">
</head>

<script>
$(document).ready(function() {
$('#register').click(function(){
	window.location="register";
});
});
</script>

<body>

	<div class="container chat-signin">
		<form class="form-signin" action="login/authenticate" method="POST">
			<h2 class="form-signin-heading">Chat sign in</h2>
			<c:if test= "${not empty errorMsg}" >
				<font color ="red"><c:out value="${errorMsg}"/></font>
			</c:if>
			<br>
			<label for="userName">UserName</label> <input type="text"
				class="input-block-level" placeholder="Username" id="userName" name="userName">
				<label for="password">Password</label> 
					<input type="password"
				class="input-block-level" placeholder="Password" id="password" name="password">
			<button class="btn btn-large btn-primary" type="submit"
				id="sign-in">Sign in</button>
			<button class="btn btn-large btn-primary" type="button"
				id="register">Register</button>
		</form>
	</div>
	<!-- /container -->

</body>
</html>