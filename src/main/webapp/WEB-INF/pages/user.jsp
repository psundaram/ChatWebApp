<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 <script>
function getGroup(elem){
	var username = $(elem).attr('id');
	alert(username);
	$.ajax({
		  url: 'get_group',
		  type: 'GET',
		  data: {"name":username},
		  success: function(data) {
			//called when successful
			alert("success"+data);
		  },
		  error: function(e) {
			console.log(e.message);
		  }
		});
}
function getRosterGroup(elem){
	var username = $(elem).attr('id');
	alert(username);
	$.ajax({
		  url: 'get_roster',
		  type: 'GET',
		  data: {"name":username},
		  success: function(data) {
			//called when successful
			alert("success"+data);
		  },
		  error: function(e) {
			console.log(e.message);
		  }
		});
}
function addUser(elem){
	var username = $(elem).attr('id');
	alert(username);
	var groupname = "GP001";
	var group = {groupname : groupname};
	alert(JSON.stringify(group));
	
	
	$.ajax({
		  url: 'add_user_group',
		  type: 'GET',
		  data: {"name":username,"group": JSON.stringify(group)},
		  success: function(data) {
			//called when successful
			alert("success"+data);
		  },
		  error: function(e) {
			console.log(e.message);
		  }
		});
}
</script>

</head>
<body>

	<table cellpadding="4" cellspacing="4" border="1">
		<tr>
			<td>UserName</td>
			<td>Name</td>
			<td>Email</td>
			<%-- 	<td><c:out value="${list.properties}" /></td> --%>
		</tr>
		<c:forEach var="list" items="${userList}">
			<tr>
				<td><c:out value="${list.username}" /></td>
				<td><c:out value="${list.name}" /></td>
				<td><c:out value="${list.email}" /></td>
				<td><input type="button" value="Get Group" id="${list.username}" onclick="getGroup(this)"></td>
				<td><input type="button" value="Roster Group" id="${list.username}" onclick="getRosterGroup(this)"></td>
				<td><input type="button" value="Add User Group" id="${list.username}" onclick="addUser(this)"></td>
			<%-- 	<td><c:out value="${list.properties}" /></td> --%>
			</tr>
			<p>
		</c:forEach>
	</table>

</body>
</html>