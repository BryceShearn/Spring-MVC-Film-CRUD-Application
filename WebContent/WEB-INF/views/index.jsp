<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<title>MVC Film Site</title>
	</head>
	<body>
		<h1>Welcome to the Film look-up tool!</h1>
	    <br>
	  	<h3>Search by Id</h3>
  			<form action="searchid.do" method="GET">
    			Enter the Film Id:
    			<input type="text" name="id" size="10"/> 
    			<input type="submit" value="get film Id"/>
  			</form>
  	  	<h3>Search for films by an entered keyword</h3>
  			<form action="searchkeyword.do" method="GET">
    			Enter a keyword to search:
    			<input type="text" name="keyword" size="30"/> 
    			<input type="submit" value="search by keyword"/>
  			<br>
  			<br>
				<a href="addfilm.do" class="btn btn-default">Click here to add a film</a>
  	  		<br>
  			</form>
	</body>
</html>
