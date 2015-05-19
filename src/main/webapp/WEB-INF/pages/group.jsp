<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Group</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 <script>
function deleteGroup(elem){
	var groupName = $(elem).attr('id');
	alert(groupName);
	$.ajax({
		  url: 'delete_group',
		  type: 'GET',
		  data: {"name":groupName},
		  success: function(data) {
			//called when successful
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
			<td>Name</td>
			<td>Description</td>
			<%-- 	<td><c:out value="${list.properties}" /></td> --%>
		</tr>
		<c:forEach var="group" items="${groupList}">
			<tr>
				<td><c:out value="${group.name}" /></td>
				<td><c:out value="${group.description}" /></td>
				<td><input type="button" value="Delete" id="${group.name}" onclick="deleteGroup(this)"></td>
			<%-- 	<td><c:out value="${list.properties}" /></td> --%>
			</tr>
			<p>
		</c:forEach>
	</table>
	
	
	<div id="add-group">
		<form class="add-group" action="create_group" method="POST">
			<h2 class="form-signin-heading">Create Group</h2>
			<br>
			<label for="name">name</label> <input type="text"
				class="input-block-level" placeholder="Name" id="name" name="name"> <br>
				<label for="description">Description</label>
					<input type="text"
				class="input-block-level" placeholder="Group Description" id="description" name="description"> <br>
			<button class="btn btn-large btn-primary" type="submit"
				id="sign-in">Create Group</button>
		</form>
	
	</div>

</body>
</html>