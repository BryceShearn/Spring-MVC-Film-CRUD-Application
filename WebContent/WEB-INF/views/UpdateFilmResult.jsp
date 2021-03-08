<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:if test="${film == null}">Sorry.. we couldn't update that film.</c:if>
			<c:if test="${not empty film }">
		<h2>Title: ${film.title}</h2>
			Film ID: ${film.id}
		<table>
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
				<td>${film.languageId}</td>
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
</body>
</html>