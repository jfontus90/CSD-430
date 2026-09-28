<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Update State</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<h1>Update State Information</h1>

<p>Select the State ID of the record you would like to update.</p>

<form action="stateUpdateForm.jsp" method="post">

    <label for="stateId">State ID:</label>

    <select name="stateId" id="stateId" required>

        <option value="">-- Select a State ID --</option>

        <%

        String url = "jdbc:mysql://localhost:3306/CSD430";
        String username = "student1";
        String password = "pass";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection =
                DriverManager.getConnection(url, username, password);

            String sql =
                "SELECT state_id, state_name FROM jasmine_states_data ORDER BY state_id";

            PreparedStatement statement =
                connection.prepareStatement(sql);

            ResultSet results =
                statement.executeQuery();

            while (results.next()) {

        %>

        <option value="<%= results.getInt("state_id") %>">

            <%= results.getInt("state_id") %>
            -
            <%= results.getString("state_name") %>

        </option>

        <%

            }

            results.close();
            statement.close();
            connection.close();

        } catch (Exception e) {

            out.println(
                "<p>Error loading states: "
                + e.getMessage()
                + "</p>"
            );

        }

        %>

    </select>

    <br><br>

    <input type="submit" value="Select State">

</form>

</body>
</html>