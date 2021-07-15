<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <link rel="stylesheet" type="text/css" href="css/style.css"/>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
body {
 background-color : #484845;
     margin: auto;
  width: 50%;
  border: 3px solid blue;
}
.form1{
  position: absolute;
  top: 8px;
  right:400px;
  font-size: 18px;
  
}

a{color: red;}

.form2{
 position:absolute;
   top:5;
   left:400px;
}

.label1{
 position:absolute;
  top:33;
   left:433px;
      margin: auto;
  width: 10%;
  background-color :blue;
  border: 3px solid blue;
   color: white;
}

.form3{
 position:absolute;
  top:57;
   left:400px;
      margin: auto;
  width: 48%;
  border: 3px solid blue;
}

.form4{
 position:absolute;
  top:250;
   left:400px;
      margin: auto;
  width: 48%;
  border: 3px solid blue;
}

table, th, td {
  border: 1px solid black;
}

</style>

<meta charset="ISO-8859-1">
<title>Customer Investment Portfolio – Home </title>
</head>
<body>

<form action="login" class="form1">
<label Id=”agentID”>${agentid}:</label>
<a href="http://localhost:8080/login">Logout</a>
</form>

<form action="customerinvestmentportfolio" class="form2">
<button Id=”btnAddProposal” type="submit" name="addproposal">Add Proposal</button><br />
</form>


<label class="label1">Policy Search:</label>
<form action="search" class="form3">
<br /><br />
<label>Policy Number:</label>
<input type="text" Id="policyNumber" name="policynumber" /><br /><br />
<label>First Name:</label>
<input type="text"  Id="firstName" name="firstname" /><br /><br />
<label>Last Name:</label>
<input type="text" Id="lastName" name="lastname" /><br /><br />
<button Id="btnSearch" type="submit">Search</button><br />
</form>

<div class="form4" id="form4">
<c:set var="database" value="${key}"/>
<c:if test="${database==0}">
<div Id=”noCustomers”>No Customers Found</div>
</c:if>
</div>

<c:set var="database" value="${key}"/>
<c:if test="${database!=0}">

<form action="customerdetails" class="form4">

<table>
  <tr>
    <th>Policy no</th>
    <th>First name</th>
      <th>last name</th>
    <th>DoB</th>
      <th>Gender</th>
      <th></th>
         <th></th>
  </tr>
    <c:forEach items="${customer}" var="person" varStatus="status">
      
  <tr>
  
    <td><label id="policyNumbe${status.count}">${person.policynumber}</label></td>
    <td><label id="firstName${status.count}">${person.firstname}</label></td>
     <td><label id="lastName${status.count}">${person.lastname}</label></td>
    <td><label id="dob${status.count}">${person.dob}</td>
     <td><label id="${person.gender}${status.count}">${person.gender}</label></td>
  
     <form action="customerdetails" method="get">
                   <input name="policynumber" Id="policynumber${status.count}" type="hidden" value="${person.policynumber}"/> 
                   <input name="wpage" Id="page1" type="hidden" value="home"/> 
                   <td><button Id="btnCustomerDetails${status.count}"  type="submit" name="type" value="details">Customer Portfolio Details</button></td>
     <td><button  type="submit" Id="btnIllustrate${status.count}"  name="type" value="illustrate">Illustrate</button></td> 
            </form>
     
  </tr>
  
  
  </c:forEach>
</table>

</form>
</c:if>
</body>
</html>