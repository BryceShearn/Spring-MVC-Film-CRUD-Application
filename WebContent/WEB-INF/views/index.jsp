<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MVC Film Site</title>
	</head>
	<body>
		<h1>Welcome to the Film look-up tool!</h1>
			<p> <br>
			<br>menu text here<br>
			<br>menu text here<br>	
	  	<h3>Search by Id</h3>
  			<form action="searchid.do" method="GET">
    			Enter the Film Id:
    			<input type="text" name="filmId" size="10"/> 
    			<input type="submit" value="get film Id"/>
  			</form>
	  	
	<br><a href="addfilm.do">Click here to Add a film</a><br>
  	  	<h3>Search list of films by generic keyword</h3>
  			<form action="searchkeyword.do" method="GET">
    			Enter a keyword to search:
    			<input type="text" name="keyword" size="30"/> 
    			<input type="submit" value="search by keyword"/>
  			</form>
	</body>
</html>
