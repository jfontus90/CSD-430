<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<%
    /*
     * CSD 430 Module 7
     *
     * This JSP receives state information from addState.jsp,
     * inserts the new record into the CSD430 database,
     * and retrieves all state records for display.
     */

    String stateName = request.getParameter("stateName");
    String abbreviation = request.getParameter("abbreviation");
    String capital = request.getParameter("capital");
    String region = request.getParameter("region");
    String populationValue = request.getParameter("population");

    Connection connection = null;
    PreparedStatement insertStatement = null;
    Statement selectStatement = null;
    ResultSet resultSet = null;

    String message = "";

    try {

        // Load the MySQL JDBC driver.
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to the CSD430 database.
    // Connect to the CSD430 database.
	String url = "jdbc:mysql://localhost:3306/CSD430";
	String username = "student1";
	String password = "pass";

	connection = DriverManager.getConnection(
    url,
    username,
    password
);

	// Insert the new state into the database.
	String insertSQL =
	    "INSERT INTO jasmine_states_data " +
	    "(state_name, abbreviation, capital, region, population) " +
	    "VALUES (?, ?, ?, ?, ?)";

	insertStatement = connection.prepareStatement(insertSQL);

	insertStatement.setString(1, stateName);
	insertStatement.setString(2, abbreviation);
	insertStatement.setString(3, capital);
	insertStatement.setString(4, region);
	insertStatement.setInt(5, Integer.parseInt(populationValue));

	// Add the new record to the database.
	insertStatement.executeUpdate();

	message = "The new state was added successfully.";

        // Retrieve all records after inserting the new state.
        String selectSQL =
            "SELECT state_id, state_name, abbreviation, capital, " +
            "region, population FROM jasmine_states_data " +
            "ORDER BY state_id";

        selectStatement = connection.createStatement();
        resultSet = selectStatement.executeQuery(selectSQL);

    } catch (Exception e) {

        message = "Database Error: " + e.getMessage();

    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>State Database Results</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <h1>State Database Records</h1>

    <p>
        This table displays all state records currently stored
        in the CSD430 database.
    </p>

    <p><strong><%= message %></strong></p>

    <table>
        <thead>
            <tr>
                <th>State ID</th>
                <th>State Name</th>
                <th>Abbreviation</th>
                <th>Capital</th>
                <th>Region</th>
                <th>Population</th>
            </tr>
        </thead>

        <tbody>

        <%
            if (resultSet != null) {

                while (resultSet.next()) {
        %>

            <tr>
                <td><%= resultSet.getInt("state_id") %></td>
                <td><%= resultSet.getString("state_name") %></td>
                <td><%= resultSet.getString("abbreviation") %></td>
                <td><%= resultSet.getString("capital") %></td>
                <td><%= resultSet.getString("region") %></td>
                <td><%= resultSet.getInt("population") %></td>
            </tr>

        <%
                }
            }
        %>

        </tbody>
    </table>

    <br>

    <a href="addState.jsp">Add Another State</a>

    <br><br>

    <a href="index.jsp">Return to Home</a>

</body>
</html>

<%
    // Close database resources.
    try {
        if (resultSet != null) {
            resultSet.close();
        }

        if (selectStatement != null) {
            selectStatement.close();
        }

        if (insertStatement != null) {
            insertStatement.close();
        }

        if (connection != null) {
            connection.close();
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>