<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Film Record</title>
</head>
<body>
	<h1>Delete Film Record</h1>
	<div class="container">
		<c:out value="${filmId }" />
		<c:if test="${empty film }">Determines if Film is deleted</c:if>
	<!-- 	film id field has 1000 rows, if film.Id < 1000, film was not deleted. -->
		<c:out value="${filmId }" />
		<c:if test="${film.filmId le 1000 }">hmm.. we couldn't delete that film.. try again?
			<h2>Title: ${film.title }</h2>
			<table>
				<tr>
					<td>Film ID:</td>
					<td>${film.filmId}</td>
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
				<c:choose>
						<tr>
							<td>Language:</td>
							<td>${film.language}</td>
						</tr>
					<c:otherwise>
						<tr>
							<td>Language ID:</td>
							<td>${film.languageID}</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr>
					<td>Special Features:</td>
					<td>${film.specialFeatures}</td>
				</tr>
				<tr>
					<c:choose>
							<td>Category:</td>
							<td>${film.categoryFilm}</td>
						<c:otherwise>
							<td>Category:</td>
							<td>No Category</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>Actors:</td>
					<td><c:if test="${empty film.actors }">sorry, there aren't any actors here..try again?</c:if>
						<c:if test="${not empty actors}">${actors}</c:if></td>
				</tr>
			</table>
			<form action="getFilmID.do" method="GET">
				<button type="submit" name="filmID" value="${film.filmId}">update</button>
			</form>
			<form action="deleteFilm.do" method="POST">
				<button type="submit" name="filmID" value="${film.filmId}">Delete
					Film</button>
			</form>

		</c:if>

		<br>
		<!-- home page something? -->
	</div>
</body>
</html>
