<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update State Record</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<h1>Update State Record</h1>

<%
    String stateId = request.getParameter("stateId");

    String url = "jdbc:mysql://localhost:3306/CSD430";
    String username = "student1";
    String password = "pass";

    if (stateId != null && !stateId.isEmpty()) {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection =
                DriverManager.getConnection(url, username, password);

            String sql =
                "SELECT * FROM jasmine_states_data WHERE state_id = ?";

            PreparedStatement statement =
                connection.prepareStatement(sql);

            statement.setInt(1, Integer.parseInt(stateId));

            ResultSet results = statement.executeQuery();

            if (results.next()) {
%>

<form action="stateUpdateResults.jsp" method="post">

    <!-- Primary key is displayed but cannot be edited -->
    <p>
        <strong>State ID:</strong>
        <%= results.getInt("state_id") %>
    </p>

    <!-- Hidden field sends the State ID to the results JSP -->
    <input type="hidden"
           name="stateId"
           value="<%= results.getInt("state_id") %>">

    <p>
        <label for="stateName">State Name:</label>

        <input type="text"
               id="stateName"
               name="stateName"
               value="<%= results.getString("state_name") %>"
               required>
    </p>

    <p>
        <label for="abbreviation">Abbreviation:</label>

        <input type="text"
               id="abbreviation"
               name="abbreviation"
               value="<%= results.getString("abbreviation") %>"
               maxlength="2"
               required>
    </p>

    <p>
        <label for="capital">Capital:</label>

        <input type="text"
               id="capital"
               name="capital"
               value="<%= results.getString("capital") %>"
               required>
    </p>

    <p>
        <label for="region">Region:</label>

        <input type="text"
               id="region"
               name="region"
               value="<%= results.getString("region") %>"
               required>
    </p>

    <p>
        <label for="population">Population:</label>

        <input type="number"
               id="population"
               name="population"
               value="<%= results.getInt("population") %>"
               required>
    </p>

    <input type="submit" value="Update State">

</form>

<%
            } else {

                out.println("<p>State record not found.</p>");

            }

            results.close();
            statement.close();
            connection.close();

        } catch (Exception e) {

            out.println(
                "<p>Error retrieving state: "
                + e.getMessage()
                + "</p>"
            );

        }

    } else {

        out.println("<p>No State ID was selected.</p>");

    }
%>

</body>
</html>