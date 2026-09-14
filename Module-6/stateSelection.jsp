<%@ page import="java.util.List" %>
<%@ page import="beans.StateBean" %>

<%
    // Create the JavaBean
    StateBean stateBean = new StateBean();

    // Get all state IDs from the database
    List<Integer> stateIds = stateBean.getStateIds();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select a State</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <h1>State Information Database</h1>

    <p>
        Select a State ID from the dropdown menu below
        to view information about that state.
    </p>

    <form action="stateResults.jsp" method="get">

        <label for="stateId">Select State ID:</label>

        <select name="stateId" id="stateId">

            <%
                for (Integer id : stateIds) {
            %>

            <option value="<%= id %>"><%= id %></option>

            <%
                }
            %>

        </select>

        <input type="submit" value="View State">

    </form>

</body>
</html>