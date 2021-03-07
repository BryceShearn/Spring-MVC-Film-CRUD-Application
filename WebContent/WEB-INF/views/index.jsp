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

<h1>Welcome to the Film Site</h1>
<p><br>
<br><br>
<br><br>	
	  <h3>Search by Id</h3>
  <form action="searchid.do" method="GET">
    Name:
    <input type="text" name="filmID"/> 
    <input type="submit" value="film Id"/>
  </form>
	  
	  <h3>Add a film</h3>
	<br><a href="createFilmForm.do">Create a Film</a><br>
  	 
  	  <h3>Search by keyword</h3>
  <form action="searchkeyword.do" method="GET">
    Name:
    <input type="text" name="filmID"/> 
    <input type="submit" value="film Id"/>
  </form>
</body>
</html>