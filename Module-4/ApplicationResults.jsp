<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application Results</title>
</head>

<body>

    <h1>Job Application Results</h1>

    <p>
        The table below displays the information submitted
        through the job application form.
    </p>

<%--The following Scriplet retrieves the information submitted from JobApplication.jsp --%>
    <%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String position = request.getParameter("position");
    String experience = request.getParameter("experience");
    String employmentType = request.getParameter("employmentType");
    String comments = request.getParameter("comments");
    
    String[] skills = request.getParameterValues("skills");

    String skillsList = "";

    if (skills != null) {
        for (String skill : skills) {
            skillsList += skill + " ";
        }
    }
    %>

<h2>Application Information</h2>

<p>
    The following table provides a summary of the information
    submitted by the job applicant.
</p>

<!-- Showing the submmitted job application data in table format -->

<table border="1">

    <tr>
        <th>Field</th>
        <th>Description</th>
        <th>Submitted Information</th>
    </tr>

    <tr>
        <td>First Name</td>
        <td>Applicant's first name</td>
        <td><%= firstName %></td>
    </tr>

    <tr>
        <td>Last Name</td>
        <td>Applicant's last name</td>
        <td><%= lastName %></td>
    </tr>

    <tr>
        <td>Email</td>
        <td>Applicant's email address</td>
        <td><%= email %></td>
    </tr>

    <tr>
        <td>Phone</td>
        <td>Applicant's phone number</td>
        <td><%= phone %></td>
    </tr>

    <tr>
        <td>Position</td>
        <td>Position the applicant is applying for</td>
        <td><%= position %></td>
    </tr>

    <tr>
        <td>Years of Experience</td>
        <td>Number of years of professional experience</td>
        <td><%= experience %></td>
    </tr>

    <tr>
        <td>Employment Type</td>
        <td>Applicant's preferred employment type</td>
        <td><%= employmentType %></td>
    </tr>

    <tr>
        <td>Skills</td>
        <td>Technical skills selected by the applicant</td>
        <td><%= skillsList %></td>
    </tr>

    <tr>
        <td>Additional Comments</td>
        <td>Additional information provided by the applicant</td>
        <td><%= comments %></td>
    </tr>

</table>

    <%--
   This code does not include  Dependency Injection but since a comment was requested with this Dependency Injection 
   is a programming concept where an object dependencies are provided to it 
    rather than created by the object itself
    --%>

</body>
</html>