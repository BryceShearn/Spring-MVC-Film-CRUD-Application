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
  <h3>States</h3>
  <form action="indexmethod.do" method="GET">
    Name:
    <input type="text" name="name"/> 
    <input type="submit" value="Get State Data" />
  </form>
</body>
</html>