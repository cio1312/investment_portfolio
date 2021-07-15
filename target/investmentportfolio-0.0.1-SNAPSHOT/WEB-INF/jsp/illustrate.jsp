<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
body {
 background-color : #484845;
     margin: auto;
  width: 50%;
}
a{color: red;}
.form1{
  position: absolute;
  top: 8px;
  right: 400px;
  font-size: 18px;
  
}

.label1{
 position:absolute;
  top:20px;
   left:433px;
      margin: auto;
  width: 10%;

   color: white;
}
.label2{
 position:absolute;
  top:20px;
   left:700px;
      margin: auto;
  width: 10%;
   color: white;
}
.label3{
 position:absolute;
  top:85px;
   left:433px;
      margin: auto;
  width: 10%;
   color: white;
}

.label4{
 position:absolute;
  top:85px;
   left:700px;
      margin: auto;
  width: 10%;
   color: white;
}

.form2{
 position:absolute;
   top:140px;
   left:500px;
}

.form3{
position: absolute;
right:    100px;
bottom:   0;
}

table, th, td {
  border: 1px solid black;
}

</style>

<meta charset="ISO-8859-1">
<title>Customer Investment Portfolio – Illustration Details</title>
</head>
<body>

<form action="login" class="form1">
<label Id=”agentID”>${agentid}:</label>
<a href="http://localhost:8080/login">Logout</a>
</form>

<div>

<div class="label1">
<label >Customer Name:</label>
<label  Id="customerName">${customer.firstname}</label>
</div>

<div class="label2">
<label >Premium Paying Term:</label>
<label  Id="premiumPayingTerm">${customer.payingterm}</label>
</div>

<div class="label3">
<label  >ProductName:</label>
<label  Id="productName">${customer.productname}</label><br />
</div>

<div  class="label4">
<label >Investment Amount:</label>
<label  Id="investmentAmount">${customer.investmentamount}</label><br />
</div>

</div>

<table class="form2">
<tr>
<th>proposal year</th> 
<th>year product fund value</th>
</tr>
   <c:forEach items="${table}" var="data" varStatus="status">
    <tr>
    <label Id="proposalYear${status.count}"><td>${status.count}</td></label>
    <label Id="fundValue${status.count}"><td>${data}</td></label>
    </tr>
    </c:forEach>
</table>

<form action="Home" class="form3">
<input name="policynumber" Id="policynumber" type="hidden" value="${customer.policynumber}"/>
<button Id="btnBack" type="submit" >Back</button>
</form>

</body>
</html>