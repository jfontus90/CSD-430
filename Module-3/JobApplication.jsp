<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--Job Application Form
    This page collects job application information from the user.
    The submmited information is sent to ApplicationResults.jsp --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Application Form</title>
</head>

<body>

<h1>Job Application Form</h1>

<p>
    <!-- Job application form used to collect applicant information -->  
      
         </p>
    
<form action="ApplicationResults.jsp" method="post">

<label for="firstName">First Name:</label>
<input type="text" id="firstName" name="firstName">

<br><br>

<label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName">
    
    <br><br>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email">
    
    <label for="phone">Phone:</label>
<input type="text" id="phone" name="phone">

<br><br>

<label for="position">Position Applying For:</label>

<select id="position" name="position">
    <option value="Software Developer">Software Developer</option>
    <option value="Web Developer">Web Developer</option>
    <option value="Database Administrator">Database Administrator</option>
    <option value="IT Support Specialist">IT Support Specialist</option>
</select>

<br><br>

<label for="experience">Years of Experience:</label>
<input type="number" id="experience" name="experience" min="0">

<br><br>

<label>Employment Type:</label>

<input type="radio" id="fullTime" name="employmentType" value="Full-Time">
<label for="fullTime">Full-Time</label>

<input type="radio" id="partTime" name="employmentType" value="Part-Time">
<label for="partTime">Part-Time</label>

<br><br>

<label>Skills:</label>

<input type="checkbox" id="java" name="skills" value="Java">
<label for="java">Java</label>

<input type="checkbox" id="html" name="skills" value="HTML">
<label for="html">HTML</label>

<input type="checkbox" id="css" name="skills" value="CSS">
<label for="css">CSS</label>

<input type="checkbox" id="sql" name="skills" value="SQL">
<label for="sql">SQL</label>

<br><br>

<label for="comments">Additional Comments:</label>

<br>

<textarea id="comments" name="comments" rows="5" cols="40"></textarea>

<br><br>

<!-- Submits the sompleted form to application -->

<input type="submit" value="Submit Application">

<textarea id="comments" name="comments" rows="5" cols="40"></textarea>

<br><br>

<input type="submit" value="Submit Application">

</form>

</body>
</html>