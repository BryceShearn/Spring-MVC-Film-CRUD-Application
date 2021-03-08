package com.skilldistillery.film.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Component
public class FilmDAOjdbcImpl implements FilmDAO {

	private String url = "jdbc:mysql://localhost:3306/sdvid?useSSL=false";
	private String user = "student";
	private String pass = "student";

	
	 public FilmDAOjdbcImpl() throws ClassNotFoundException {
		    Class.forName("com.mysql.jdbc.Driver");
		  }
	
	@Override
	public Film findFilmById(int id) {
		Film film = null;
		Connection conn;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "SELECT film.*, language.* FROM film JOIN language ON film.language_id = language.id WHERE film.id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet filmResult = stmt.executeQuery();
			if (filmResult.next()) {
				film = new Film();
				film.setId(filmResult.getInt("id"));
				film.setTitle(filmResult.getString("title"));
				film.setDescription(filmResult.getString("description"));
				film.setReleaseYear(filmResult.getInt("release_year"));
				film.setLanguageId(filmResult.getInt("language_id"));
				film.setRentalDuration(filmResult.getInt("rental_duration"));
				film.setRentalRate(filmResult.getDouble("rental_rate"));
				film.setLength(filmResult.getInt("length"));
				film.setReplacementCost(filmResult.getDouble("replacement_cost"));
				film.setRating(filmResult.getString("rating"));
				film.setSpecial_features(filmResult.getString("special_features"));
				film.setLanguage(filmResult.getString("name"));
				film.setActors(findActorsByFilmId(id));
			}
			filmResult.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return film;
	}

	@Override
	public Actor findActorById(int actorId) {
		Actor actor = null;
		Connection conn;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "SELECT * FROM actor WHERE id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, actorId);
			ResultSet actorResult = stmt.executeQuery();
			if (actorResult.next()) {
				actor = new Actor();
				actor.setId(actorResult.getInt("id"));
				actor.setFirstName(actorResult.getString("first_name"));
				actor.setLastName(actorResult.getString("last_name"));
			}
			actorResult.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return actor;

	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) {
		List<Actor> actorsInFilm = new ArrayList<>();

		Actor actor = null;
		Connection conn;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "SELECT * FROM actor JOIN film_actor ON actor.id = film_actor.actor_id JOIN film ON film_actor.film_id = film.id WHERE film.id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet actorResult = stmt.executeQuery();
			while (actorResult.next()) {
				actor = new Actor();
				actor.setId(actorResult.getInt("id"));
				actor.setFirstName(actorResult.getString("first_name"));
				actor.setLastName(actorResult.getString("last_name"));
				actorsInFilm.add(actor);
			}
			actorResult.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return actorsInFilm;
	}

	@Override
	public List<Film> findFilmByKeyword(String keyword) {
		Film film = null;
		List<Film> films = new ArrayList<>();
		Connection conn;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "SELECT film.*, language.* FROM film JOIN language ON film.language_id = language.id WHERE film.title REGEXP ? OR film.description REGEXP ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, keyword);
			stmt.setString(2, keyword);

			ResultSet filmResult = stmt.executeQuery();
			while (filmResult.next()) {
				film = new Film();
				film.setId(filmResult.getInt("id"));
				film.setTitle(filmResult.getString("title"));
				film.setDescription(filmResult.getString("description"));
				film.setReleaseYear(filmResult.getInt("release_year"));
				film.setLanguageId(filmResult.getInt("language_id"));
				film.setRentalDuration(filmResult.getInt("rental_duration"));
				film.setRentalRate(filmResult.getDouble("rental_rate"));
				film.setLength(filmResult.getInt("length"));
				film.setReplacementCost(filmResult.getDouble("replacement_cost"));
				film.setRating(filmResult.getString("rating"));
				film.setSpecial_features(filmResult.getString("special_features"));
				film.setActors(findActorsByFilmId(film.getId()));
				film.setLanguage(filmResult.getString("name"));
				films.add(film);
			}
			filmResult.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return films;
	}

	@Override
	public Film createFilm(Film film) {

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false);
			String sql = "INSERT INTO film (title,description,release_year,language_id,rental_duration,rental_rate,replacement_cost,rating,special_features) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setInt(3, film.getReleaseYear());
			stmt.setInt(4, film.getLanguageId());
			stmt.setInt(5, film.getRentalDuration());
			stmt.setDouble(6, film.getRentalRate());
			stmt.setDouble(7, film.getReplacementCost());
			stmt.setString(8, film.getRating());
			stmt.setString(9, film.getSpecial_features());

			int createCount = stmt.executeUpdate();
			if (createCount == 1) {
				ResultSet keys = stmt.getGeneratedKeys();
				if (keys.next()) {
					int newFilmId = keys.getInt(1);
					film.setId(newFilmId);
				}
			} else {
				film = null;
			}
			conn.commit();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException e2) {
					System.err.println("Error trying to rollback");
				}
			}
		}

		return film;
	}

	@Override
	public boolean deleteFilm(int id) {
		Film film = findFilmById(id);
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "DELETE FROM film WHERE id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, film.getId());
			int updateCount = stmt.executeUpdate();
			conn.commit(); // COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}

	@Override
	public Film updateFilm(int filmID, String title, String description, Integer releaseYear, int languageId, Integer rentalDuration,
			Double rentalRate, Integer length, Double replacementCost, String rating, String specialFeatures) {
		Connection conn = null;
		Film film = findFilmById(filmID);
		try {
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "UPDATE film SET title=?,description=?,release_year=?,language_id=?,rental_duration=?,rental_rate=?,length=?,replacement_cost=?,rating=?,special_features=? WHERE id=?;";
			PreparedStatement stmt = conn.prepareStatement(sql);

			//if (title != null && title.length() > 0) {
				stmt.setString(1, title);
			//} else {
				//stmt.setString(1, film.getTitle());
			//}

			//if (description != null && description.length() > 0) {
				stmt.setString(2, description);
			//} else {
				//stmt.setString(2, film.getDescription());
			//}

			//if (releaseYear != null) {
				stmt.setInt(3, releaseYear);
			//} else {
				//stmt.setInt(3, film.getReleaseYear());
			//}
			
			stmt.setInt(4, languageId); // is not null

				//if (rentalDuration != null) {
					stmt.setInt(5, rentalDuration);
				//} else {
				//	stmt.setInt(5, film.getRentalDuration());
				//}

			//	if (rentalRate != null) {
					stmt.setDouble(6, rentalRate);
			//	} else {
				//	stmt.setDouble(6, film.getRentalRate());
				//}

				//if (length != null) {
					stmt.setInt(7, length);
				//} else {
				//	stmt.setInt(7, film.getLength());
			//	}

			//	if (replacementCost != null) {
					stmt.setDouble(8, replacementCost);
			//	} else {
				//	stmt.setDouble(8, film.getReplacementCost());
				//}

				//if (rating != null && rating.length() > 0) {
					stmt.setString(9, rating);
			//	} else {
				//	stmt.setString(9, film.getRating());
			//	}

			//	if (specialFeatures != null && specialFeatures.length() > 0) {
					stmt.setString(10, specialFeatures);
			//	} else {
				//	stmt.setString(10, film.getSpecial_features());
				//}

				stmt.setInt(11, filmID);

				int updateCount = stmt.executeUpdate();

				if (updateCount == 1) {
					conn.commit(); // COMMIT TRANSACTION
				} else {
					try {
						conn.rollback();
					} catch (SQLException sqle2) {
						System.err.println("Error trying to rollback");
					}
					return null;
				}
			
		}

		catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}

		}
		return findFilmById(filmID);

	}

	@Override
	public List<Film> getAllFilms() {

		List<Film> films = new ArrayList<>();
		Film film = null;

		Connection conn;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			String sql = "SELECT film.*, language.* FROM film JOIN language ON film.language_id = language.id;";
			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet filmResult = stmt.executeQuery();
			while (filmResult.next()) {
				film = new Film();
				film.setId(filmResult.getInt("id"));
				film.setTitle(filmResult.getString("title"));
				film.setDescription(filmResult.getString("description"));
				film.setReleaseYear(filmResult.getInt("release_year"));
				film.setLanguageId(filmResult.getInt("language_id"));
				film.setRentalDuration(filmResult.getInt("rental_duration"));
				film.setRentalRate(filmResult.getDouble("rental_rate"));
				film.setLength(filmResult.getInt("length"));
				film.setReplacementCost(filmResult.getDouble("replacement_cost"));
				film.setRating(filmResult.getString("rating"));
				film.setSpecial_features(filmResult.getString("special_features"));
				film.setActors(findActorsByFilmId(film.getId()));
				film.setLanguage(filmResult.getString("name"));
				films.add(film);
			}
			filmResult.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return films;
	}

}
