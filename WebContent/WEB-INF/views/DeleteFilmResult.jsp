<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Delete Film Record</title>
	</head>
	<body>
		<c:choose>
    	<c:when test="${deletedBool == true}">
  		Film was successfully deleted ${filmID}
    	</c:when>    

    	<c:otherwise> Film was not deleted.. try again? </c:otherwise>
		</c:choose>
		<p>
			<a href="returntomain.do" class="btn btn-secondary" role="button">Return to home page</a>
		</p>
	</body>
</html>