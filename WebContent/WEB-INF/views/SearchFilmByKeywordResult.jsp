<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
							<!-- External bootstrap css imports -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<title>Search film by Keyword</title>
		</head>
	<body>
		<h1>Search film by Keyword</h1>
			<div class="container">
			<c:forEach var="film" items="${films}">
			<c:if test="${film.title == null}">No film found</c:if>
			<c:if test="${not empty film}">
		<h2>Title: ${film.title}</h2>
		<table>
			<tr>
				<td>Film ID:</td>
				<td>${film.id}</td>
			</tr>
			<tr>
				<td>Film Title:</td>
				<td>${film.title}</td>
			</tr>
			<tr>
				<td>Film Description:</td>
				<td>${film.description}</td>
			</tr>
			<tr>
				<td>Release Year:</td>
				<td>${film.releaseYear}</td>
			</tr>
			<tr>
				<td>Rating:</td>
				<td>${film.rating}</td>
			</tr>
			<tr>
				<td>Language:</td>
				<td>${film.languageId}</td>
			</tr>
			<tr>
				<td>Special Features:</td>
				<td>${film.special_features}</td>
			</tr>
		</table>
		<form action="updatefilmform.do" method="GET">
			<button type="submit" name="id" value="${film.id}"> Update Film Record Details</button>
		</form>
		
		<form action="deleteresult.do" method="POST">
			<button type="submit" name="id" value="${film.id}">Delete Film Record</button>
		</form>
		</c:if>
		</c:forEach>
		<br>
  			<br>
				<a href="returntomain.do" class="btn btn-default"> Return to Home Page </a>
  	  		<br>
		</div>
	</body>
</html>