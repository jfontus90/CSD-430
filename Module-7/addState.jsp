<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New State</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <h1>Add a New State</h1>

    <p>
        Enter the information below to add a new state
        to the CSD430 database.
    </p>

    <!--
        Module 7:
        This form collects the information needed
        to add a new state record to the database.
        The state_id is not entered because MySQL
        automatically generates the primary key.
    -->

    <form action="addStateResults.jsp" method="post">

        <label for="stateName">State Name:</label>
        <input type="text"
               id="stateName"
               name="stateName"
               required>

        <br><br>

        <label for="abbreviation">Abbreviation:</label>
        <input type="text"
               id="abbreviation"
               name="abbreviation"
               maxlength="2"
               required>

        <br><br>

        <label for="capital">Capital:</label>
        <input type="text"
               id="capital"
               name="capital"
               required>

        <br><br>

        <label for="region">Region:</label>
        <input type="text"
               id="region"
               name="region"
               required>

        <br><br>

        <label for="population">Population:</label>
        <input type="number"
               id="population"
               name="population"
               min="1"
               required>

        <br><br>

        <input type="submit" value="Add State">

    </form>

    <br>

    <a href="index.jsp">Return to Home</a>

</body>
</html>