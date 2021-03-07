package com.skilldistillery.film.dao;

import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public interface FilmDAO {
	
	public Film findFilmById(int filmId);

	public List<Film> findFilmByKeyword(String keyword);

	public Actor findActorById(int actorId);

	public List<Actor> findActorsByFilmId(int filmId);
	
	public Film createFilm(Film film);
	
	public boolean deleteFilm(Film film);

	public Film updateFilm(int filmID, String title, String description, int rentalDuration, double rentalRate, double replacementCost, String rating, String specialFeatures);
	
	public List<Film> getAllFilms();



}
