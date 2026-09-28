<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Updated State Record</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<h1>Updated State Record</h1>

<%

String stateId = request.getParameter("stateId");
String stateName = request.getParameter("stateName");
String abbreviation = request.getParameter("abbreviation");
String capital = request.getParameter("capital");
String region = request.getParameter("region");
String population = request.getParameter("population");

String url = "jdbc:mysql://localhost:3306/CSD430";
String username = "student1";
String password = "pass";

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection connection =
        DriverManager.getConnection(url, username, password);

    // Update the selected state record.
    String updateSql =
        "UPDATE jasmine_states_data "
        + "SET state_name = ?, abbreviation = ?, capital = ?, "
        + "region = ?, population = ? "
        + "WHERE state_id = ?";

    PreparedStatement updateStatement =
        connection.prepareStatement(updateSql);

    updateStatement.setString(1, stateName);
    updateStatement.setString(2, abbreviation);
    updateStatement.setString(3, capital);
    updateStatement.setString(4, region);
    updateStatement.setInt(5, Integer.parseInt(population));
    updateStatement.setInt(6, Integer.parseInt(stateId));

    updateStatement.executeUpdate();
    updateStatement.close();

    // Retrieve the updated record.
    String selectSql =
        "SELECT * FROM jasmine_states_data WHERE state_id = ?";

    PreparedStatement selectStatement =
        connection.prepareStatement(selectSql);

    selectStatement.setInt(1, Integer.parseInt(stateId));

    ResultSet results =
        selectStatement.executeQuery();

    if (results.next()) {

%>

<p>The state record was updated successfully.</p>

<table border="1">

    <thead>
        <tr>
            <th>State ID (INT)</th>
            <th>State Name (VARCHAR)</th>
            <th>Abbreviation (VARCHAR)</th>
            <th>Capital (VARCHAR)</th>
            <th>Region (VARCHAR)</th>
            <th>Population (INT)</th>
        </tr>
    </thead>

    <tbody>
        <tr>
            <td><%= results.getInt("state_id") %></td>
            <td><%= results.getString("state_name") %></td>
            <td><%= results.getString("abbreviation") %></td>
            <td><%= results.getString("capital") %></td>
            <td><%= results.getString("region") %></td>
            <td><%= results.getInt("population") %></td>
        </tr>
    </tbody>

</table>

<br>

<a href="stateUpdateSelection.jsp">Update Another State</a>

<%

    } else {

        out.println("<p>Updated record could not be found.</p>");

    }

    results.close();
    selectStatement.close();
    connection.close();

} catch (Exception e) {

    out.println(
        "<p>Error updating state: "
        + e.getMessage()
        + "</p>"
    );

}

%>

</body>
</html>