<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add Film Result</title>
	</head>
	<body>
		<h1>Add Film Result</h1>
			<div class="container">
			<c:forEach var="film" items="${films}">
			<c:if test="${film.title == null}">Sorry.. we didn't quite catch that. Try again?</c:if>
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
				<td>Language:</td>
				<td>${film.language}</td>
			</tr>
			<tr>
				<td>Rental Duration:</td>
				<td>${film.rentalDuration}</td>
			</tr>
			<tr>
				<td>Rental Rate:</td>
				<td>${film.rentalRate}</td>
			</tr>
			<tr>
				<td>Length:</td>
				<td>${film.length}</td>
			</tr>
			<tr>
				<td>Replacement Cost:</td>
				<td>${film.replacementCost}</td>
			</tr>
			<tr>
				<td>Rating:</td>
				<td>${film.rating}</td>
			</tr>
			<tr>
				<td>(CMD + CLICK for multiple)Special Features:</td>
				<td>${film.special_features}</td>
			</tr>
		</table>
		</c:if>
		</c:forEach>
		<form action="updatefilmform.do" method="GET">
			<button type="submit" name="film" value="${film}"> Update Film Record Details</button>
		</form>
		<form action="deleteresult.do" method="POST">
			<button type="submit" name="film" value="${film}">Delete Film Record</button>
		</form>
		<br>
			<p>
				<a href="index.jsp" class="btn btn-secondary" role="button">Return to home page</a>
			</p>
		</div>
	</body>
</html>