<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.MovieBean" %>

<%
    
/*
 * Create five MovieBean objects using the movie data
 * from the Module 2 assignment.
 */

    MovieBean movie1 = new MovieBean();
    movie1.setTitle("Friday");
    movie1.setGenre("Comedy");
    movie1.setYear(1995);
    movie1.setDirector("F. Gary Gray");
    movie1.setRating("R");

    MovieBean movie2 = new MovieBean();
    movie2.setTitle("Boyz n the Hood");
    movie2.setGenre("Drama");
    movie2.setYear(1991);
    movie2.setDirector("John Singleton");
    movie2.setRating("R");

    MovieBean movie3 = new MovieBean();
    movie3.setTitle("Crooklyn");
    movie3.setGenre("Comedy/Drama");
    movie3.setYear(1994);
    movie3.setDirector("Spike Lee");
    movie3.setRating("PG-13");

    MovieBean movie4 = new MovieBean();
    movie4.setTitle("The Notebook");
    movie4.setGenre("Romance/Drama");
    movie4.setYear(2004);
    movie4.setDirector("Nick Cassavetes");
    movie4.setRating("PG-13");

    MovieBean movie5 = new MovieBean();
    movie5.setTitle("Norbit");
    movie5.setGenre("Comedy");
    movie5.setYear(2007);
    movie5.setDirector("Brian Robbins");
    movie5.setRating("PG-13");

    // Store the five MovieBean objects in an array
    MovieBean[] movies = {
        movie1, movie2, movie3, movie4, movie5
    };
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Favorite Movies - JavaBean</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container">
  
        <h1>My Favorite Movies</h1>
    

    <p>
        This page displays movie information using a JavaBean
        and JSP Scriptlets.
    </p>

    <h2>Movie Information</h2>

    <p>
        Each row in the table represents one movie record.
        The information is retrieved from MovieBean objects.
    </p>

    <table>
        <tr>
            <th>Movie Title</th>
            <th>Genre</th>
            <th>Year</th>
            <th>Director</th>
            <th>Rating</th>
        </tr>

        <%
            /*
             * Loop through the MovieBean objects.
             * Each MovieBean represents one movie record.
             */
            for (MovieBean movie : movies) {
        %>

        <tr>
            <td><%= movie.getTitle() %></td>
            <td><%= movie.getGenre() %></td>
            <td><%= movie.getYear() %></td>
            <td><%= movie.getDirector() %></td>
            <td><%= movie.getRating() %></td>
        </tr>

        <%
            }
        %>

    </table>
<h2>Field Descriptions</h2>

<ul>
    <li><strong>Movie Title:</strong> The name of the movie.</li>
    <li><strong>Genre:</strong> The category or type of movie.</li>
    <li><strong>Year:</strong> The year the movie was released.</li>
    <li><strong>Director:</strong> The person who directed the movie.</li>
    <li><strong>Rating:</strong> The movie's MPAA rating.</li>
</ul>

<h2>Record Description</h2>

<p>
    Each row in the table represents one movie record.
    Each record contains five fields of information.
</p>

<h2>Overall Data Description</h2>

<p>
    This data is based on the movie information used in the Module 2 assignment.
    The information is stored in MovieBean objects and retrieved by the JSP page
    using JavaBean getter methods.
</p>
</div>
</body>
</html>