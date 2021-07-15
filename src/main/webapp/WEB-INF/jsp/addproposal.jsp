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
  right:400px;
  font-size: 18px; 
}

.labela{
 position:absolute;
  top:25px;
   left:433px;
      margin: auto;
  width: 10%;

   color: red;
}

.label1{
 position:absolute;
  top:45px;
   left:433px;
      margin: auto;
  width: 10%;

   color: white;
}

.label2{
 position:absolute;
  top:45px;
   left:700px;
      margin: auto;
  width: 10%;
   color: white;
}
.label3{
 position:absolute;
  top:95px;
   left:433px;
      margin: auto;
  width: 10%;
   color: white;
}

.label4{
 position:absolute;
  top:95px;
   left:700px;
      margin: auto;
  width: 10%;
   color: white;
}

.labelb{
 position:absolute;
  top:150px;
   left:433px;
      margin: auto;
  width: 10%;

   color: red;
}

.label5{
 position:absolute;
  top:200px;
   left:433px;
      margin: auto;
  width: 10%;

   color: white;
}
.label6{
 position:absolute;
  top:200px;
   left:700px;
      margin: auto;
  width: 10%;
   color: white;
}
.label7{
 position:absolute;
  top:260px;
   left:433px;
      margin: auto;
  width: 10%;
   color: white;
}

.label8{
 position:absolute;
  top:260px;
   left:700px;
      margin: auto;
  width: 10%;
   color: white;
}

.label9{
 position:absolute;
  top:340px;
   left:700px;
      margin: auto;
  width: 10%;
   color: white;
}

.label10{
 position:absolute;
  top:340px;
   left:433px;
      margin: auto;
  width: 10%;
   color: white;
}


.form3{ position:absolute;
  top:398px;
   left:540px;
      margin: auto;
  width: 10%;
  }
  

  .form4{
   position:absolute;
   top:430px;
   left:433px;
   margin: auto;
   width: 10%;
   color: red;
  }
</style>

<meta charset="ISO-8859-1">
<title>Customer Investment Portfolio – Add Proposal</title>
</head>
<body>

<form action="login" class="form1">
<label Id=”agentID”>${agentid}:</label>
<a href="http://localhost:8080/login">Logout</a>
</form>

<form action="savenewproposal">

<label class="labela">Production Section:</label>
<div class="label1">
<label>Product Name:</label>
<select Id="productName" name="productname" required>
<option value=""></option>
<option value="product1">product 1</option>
<option value="product2">product 2</option>
</select>
</div>
<div class="label2">
<label>Investment Amount:</label>
<input Id="investmentAmount" type="number" name="investmentamount" max=100000 min=99 required/><br />
</div>
<div class="label3">
<label>Creation date:</label>
<input Id="creationDate" type="text" name="creationdate" pattern="\d{1,2}/\d{1,2}/\d{4}" required /><br />
</div>
<div class="label4">
<label>Effective date:</label>
<input Id="effectiveDate" type="text" name="effectivedate" pattern="\d{1,2}/\d{1,2}/\d{4}" required/><br />
</div>

<label class="labelb">Client Details:</label>
<div class="label5">
<label>Title:</label>
<select Id="title" name="title" required>
<option value="" ></option>
<option value="Mr.">Mr.</option>
<option value="Mrs.">Mrs.</option>
</select>
</div>
<div class="label6">
<label>First Name:</label>
<input Id="firstName" type="text" name="firstname" required/><br />
</div>
<div class="label7">
<label>Last Name:</label>
<input Id="lastName" type="text" name="lastname" required/><br />
</div>
<div class="label8">
<label>DOB:</label>
<input Id="dob" type="text" name="dob" pattern="\d{1,2}/\d{1,2}/\d{4}" required/><br />
</div>
<div class="label9">
<label>Gender:</label>
<select Id="gender" name="gender" required>
<option value="" ></option>
<option value="male">Male</option>
<option value="female">Female</option>
</select>
</div>
<div class="label10">
<label>Retirement age:</label>
<input Id="pra" type="number" name="retirementage"   min="55" max="65" required/><br /><br />
<button Id="btnAddProposal" type="submit">Add Proposal</button><br />
</form>
</div>

<form action="Home" class="form3">
<button Id ="btnBack" type="submit" name="back" >Back</button>
</form>

<div class="form4">
<label>Error Message: </label>
<div id=”error” class="lab">${status}</div><br />
</div>

</body>
</html>