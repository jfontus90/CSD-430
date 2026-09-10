```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    /*
     * Entity Framework Comment:
     * This JSP demonstrates how data can be organized and displayed
     * using Java code. In a larger application, an Entity Framework
     * or similar data-access framework could be used to retrieve
     * records from a database.
     *
     * This Scriptlet contains the Java data used by this JSP page.
     */

    String[][] movies = {
        {"Friday", "Comedy", "1995"},
        {"Boyz n the Hood", "Drama", "1991"},
        {"Crooklyn", "Comedy/Drama", "1994"},
        {"The Notebook", "Romance/Drama", "2004"},
        {"Norbit", "Comedy", "2007"}
    };
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Favorite Movies</title>

    <!-- External CSS stylesheet -->
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <div class="container">

        <h1>My Favorite Movies</h1>

        <p>
            This page displays five movies that I have enjoyed watching.
            The information is generated dynamically using JSP Scriptlets.
        </p>

        <h2>Movie Information</h2>

        <p>
            The table below contains the movie title, genre, and year
            each movie was released.
        </p>

        <table>

            <tr>
                <th>Movie Title</th>
                <th>Genre</th>
                <th>Year</th>
            </tr>

            <%
                /*
                 * This loop goes through each movie record
                 * and creates a new row in the HTML table.
                 */

                for (int i = 0; i < movies.length; i++) {
            %>

            <tr>
                <td><%= movies[i][0] %></td>
                <td><%= movies[i][1] %></td>
                <td><%= movies[i][2] %></td>
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
        </ul>

        <h2>Data Description</h2>

        <p>
            The movie data is organized into three fields and five records.
            JSP Scriptlets are used to store and process the Java data,
            while HTML is used to display the information on the page.
        </p>

    </div>

</body>
</html>
```
