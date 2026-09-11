package beans;
import java.io.Serializable;

/*
 * MovieBean.java
 * This JavaBean stores information about a movie.
 * It contains five fields and implements Serializable.
 */
public class MovieBean implements Serializable {

    private static final long serialVersionUID = 1L;

    // Fields used to store movie information
    private String title;
    private String genre;
    private int year;
    private String director;
    private String rating;

    // No-argument constructor
    public MovieBean() {
    }

    // Getter and setter for title
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    // Getter and setter for genre
    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    // Getter and setter for year
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    // Getter and setter for director
    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    // Getter and setter for rating
    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }
}