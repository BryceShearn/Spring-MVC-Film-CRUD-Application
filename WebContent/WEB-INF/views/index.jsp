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


<!-- fill -->

<h1>Welcome to the Film Site</h1>


<br><a href = "userSearchByFilmIdForm.do"> User search film by film ID</a><br>
<form action="**userSearchByFilmIdForm.do**" method="GET">
	<h2>Enter data into the form and examine it with Developer Tools:</h2>
	<label for="search">Search:</label> <input type="text" name="search">
	<br >
	<input type="submit" value="submit" >
</form>

public class FilmController {
	
	@Autowired
	private FilmDAO filmDAO;
	
	@RequestMapping(path= {"userSearchByFilmIdForm.doo"})
	public String userSearchByFilmIdForm() {
		Film film = findFilmById(int filmId);
		return "WEB-INF/views/.jsp";
	}

@RequestMapping(path = "userSearchByFilmIdForm.do", method = RequestMethod.GET)
	public ModelAndView getFilmByKeyword(String keyword) {
		ModelAndView mv = new ModelAndView();
		List<Film> films = filmDAO.findFilmsByKeyword(keyword);
		mv.setViewName("WEB-INF/views/filmKeyword.jsp");
		mv.addObject("films", films);
		return mv;
	}


<br><a href = "userSearchByKeywordForm.do"> User search film by keyword</a><br>
<br><a href = "generateNewFilmForm.do"> User create a new film</a>
</form>
</body>
</html>