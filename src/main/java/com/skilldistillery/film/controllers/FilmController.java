package com.skilldistillery.film.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.FilmDAO;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	
	@Autowired
	private FilmDAO filmDAO;
	
	@RequestMapping(path= {"/", "home.do"})
	public String home() {
		// TODO - add list of all films to model?
		
		
		
		return "WEB-INF/views/index.jsp";
	}

@RequestMapping(path="updatefilm.do")
public ModelAndView updateFilm(int filmID, String title, String description, Integer releaseYear, Integer rentalDuration,
		Double rentalRate, Integer length, Double replacementCost, String rating, String specialFeatures) {
	ModelAndView mv = new ModelAndView();
	mv.addObject("updatedFilm",filmDAO.updateFilm(filmID, title, description, releaseYear, rentalDuration, 
			rentalRate, length, replacementCost, rating, specialFeatures));
	mv.setViewName("WEB-INF/views/UpdateFilm.jsp");
	
	return mv;
}
	
	
}
