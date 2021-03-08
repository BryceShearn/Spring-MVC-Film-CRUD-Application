<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search for Film Record by ID Form</title>
</head>
	<body>
		<h1>Search Film Results</h1>
			<div class="container">
			<c:if test="${film == null}">Sorry.. we couldn't find that film. Try again?</c:if>
			<c:if test="${not empty film }">
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
				<td>${film.language}</td>
			</tr>
			<tr>
				<td>Special Features:</td>
				<td>${film.special_features}</td>
			</tr>
		</table>
		</c:if>
		<form action="updatefilmform.do" method="GET">
			<button type="submit" name="film" value="${film.id}">Update
					Film Record Details</button>
			</form>
			<form action="deleteresult.do" method="POST">
				<button type="submit" name="filmId" value="${film.id}">Delete
					Film Record</button>
			</form>
		<br>
			<p>
				<a href="index.jsp" class="btn btn-secondary" role="button">Return to home page</a>
			</p>	
		</div>
	</body>
</html>