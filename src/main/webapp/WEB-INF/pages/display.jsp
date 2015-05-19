<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="./resource/css/bootstrap-responsive.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<table cellpadding="4" cellspacing="4">
	<c:forEach var="user" items="${users}">
		<tr>
		<td>
  		<c:out value="${user}" />
  		 </td>
  		 </tr>
		<p>
	</c:forEach>
	</table>
	<form id="chat-room" method="POST" action="chat">
		<label class="to-Address">To </label><input type="text" id="toAddress" name="toAddress" />
		<br><br>
		<button class="btn btn-large btn-primary" type="submit"
				id="chat">Chat</button>
	</form>
	<br><BR>
	
	<form id="group-chat-room" method="POST" action="group_chat">
		<label class="to-Address">To </label><input type="text" id="roomId" name="roomId" />
		<br><br>
		<button class="btn btn-large btn-primary" type="submit"
				id="chat">Group Chat</button>
	</form>
</body>
</html>