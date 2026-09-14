<%@ page import="beans.StateBean" %>

<%
    // Get the State ID selected by the user
    String selectedId = request.getParameter("stateId");

    // Create the JavaBean
    StateBean stateBean = new StateBean();

    boolean stateFound = false;

    // Make sure a State ID was received
    if (selectedId != null) {

        try {
            int stateId = Integer.parseInt(selectedId);

            // Retrieve the selected state from the database
            stateFound = stateBean.getStateById(stateId);

        } catch (NumberFormatException e) {
            stateFound = false;
        }
    }
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>State Information</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <h1>Selected State Information</h1>
    

    <p>
        The table below displays the complete database record
        for the State ID selected from the dropdown menu.
    </p>

    <%
        if (stateFound) {
    %>

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
            <tr>
                <td><%= stateBean.getStateId() %></td>
                <td><%= stateBean.getStateName() %></td>
                <td><%= stateBean.getAbbreviation() %></td>
                <td><%= stateBean.getCapital() %></td>
                <td><%= stateBean.getRegion() %></td>
                <td><%= stateBean.getPopulation() %></td>
            </tr>
        </tbody>

    </table>

    <%
        } else {
    %>

    <p>No state record was found.</p>

    <%
        }
    %>

    <p>
        <a href="stateSelection.jsp">Select Another State</a>
    </p>

</body>

</html>