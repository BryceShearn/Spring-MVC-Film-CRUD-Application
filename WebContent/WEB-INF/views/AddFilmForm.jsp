<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Add Film Record form</title>
	</head>
	<body>
		<form:form action="addFilm.do" method="POST" modelAttribute="film">
			<form:label path="title">Title:</form:label>
			<form:input path="title"/>
				<br/>
					<form:label path="description">Description:</form:label>
					<form:input path="description"/>
				<br/>
					<form:label path="releaseYear">Release year:</form:label>
					<form:input path="releaseYear"/>
				<br/>
					<form:label path="language_id">Language:</form:label>
						<form:select path="language_id">
							<form:option value="1">English</form:option>
							<form:option value="2">Italian</form:option>
							<form:option value="3">Japanese</form:option>
							<form:option value="4">Mandarin</form:option>
							<form:option value="5">French</form:option>
							<form:option value="6">German</form:option>
						</form:select>
				<br/>
					<form:label path="rentalDuration">Rental duration:</form:label>
					<form:input path="rentalDuration"/>
				<br/>
					<form:label path="rentalRate">Rental rate:</form:label>
					<form:input path="rentalRate"/>
				<br/>
					<form:label path="length">Length:</form:label>
					<form:input path="length"/>
				<br/>
					<form:label path="replacementCost">Replacement Cost:</form:label>
					<form:input path="replacementCost"/>
				<br/>
					<form:label path="rating">Rating:</form:label>
						<form:select path="rating">
							<form:option value="G">G</form:option>
							<form:option value="PG">PG</form:option>
							<form:option value="PG13">PG-13</form:option>
							<form:option value="R">R</form:option>
							<form:option value="NC17">NC-17</form:option>
	
						</form:select>
				<br/>
					<form:label path="specialFeatures">Special Features:</form:label>
						<form:select multiple="true" path="specialFeatures">
		   					<form:option value="Trailers">Trailers</form:option>
							<form:option value="Commentaries">Commentaries</form:option>
							<form:option value="Deleted Scenes">Deleted Scenes</form:option>
							<form:option value="Behind the Scenes">Behind the Scenes</form:option>
							<form:option value="n/a">n/a</form:option>
					</form:select>
				<br/>
			<input type="submit" value="Submit"/>
		</form:form>
	</body>
</html>