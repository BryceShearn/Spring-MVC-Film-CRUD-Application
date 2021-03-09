<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
							<!-- External bootstrap css imports -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<title>Delete Film Record</title>
	</head>
	<body>
		<c:choose>
    	<c:when test="${deletedBool == true}">
  		Film was successfully deleted
    	</c:when>    

    	<c:otherwise> Film was not deleted.. try again? </c:otherwise>
		</c:choose>
  			<br>
				<a href="returntomain.do" class="btn btn-default"> Return to Home Page </a>
  	  		<br>
	</body>
</html>