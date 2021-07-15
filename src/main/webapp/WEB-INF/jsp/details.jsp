<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  top:320px;
   left:700px;
      margin: auto;
  width: 10%;
   color: white;
}


.form2{  position:absolute;
   top:430px;
   left:433px;
   margin: auto;
   width: 10%;
   color: red;}
   
.form3{  position:absolute;
   top:490px;
   left:433px;
   margin: auto;
   width: 10%;
   color: red;}
</style>

<meta charset="ISO-8859-1">
<title>Customer Investment Portfolio – Customer Portfolio Details</title>
</head>
<body>

<form action="login" class="form1">
<label Id=”agentID”>${agentid}:</label>
<a href="http://localhost:8080/login">Logout</a>
</form>

<label class="labela">product section</label><br />

<div class="label1">
<label>ProductName:</label><br />
<label Id="productName">${customer.productname}</label><br />
</div>
<div class="label2">
<label>Investment Amount:</label><br />
<label Id="investmentAmount">${customer.investmentamount}</label><br />
</div>
<div class="label3">
<label>Creation Date:</label><br />
<label Id="creationDate">${customer.creationdate}</label><br />
</div>
<div class="label4">
<label>Effective Date:</label><br />
<label Id="effectiveDate">${customer.effectivedate}</label><br />
</div>
<label class="labelb">client details</label><br />

<div class="label5">
<label>Title:</label><br />
<label id="title">${customer.title}</label><br />
</div>
<div class="label6">
<label>First Name:</label><br />
<label Id="firstName">${customer.firstname}</label><br />
</div>
<div class="label7">
<label>LastName:</label><br />
<label Id="lastName">${customer.lastname}</label><br />
</div>
<div class="label8">
<label>DOB:</label><br />
<label Id="dob">${customer.dob}</label><br />
</div>
<div class="label9">
<label>Gender:</label><br />
<label Id="gender">${customer.gender}</label><br />
</div>

                   <form action="customerdetails" method="get" class="form2">
                   <input name="policynumber" Id="policynumber" type="hidden" value="${customer.policynumber}"/>
                   <input name="type" Id="type" type="hidden" value="illustrate"/> 
                   <input name="wpage" Id="page2" type="hidden" value="details"/> 
                   <button  type="submit" Id="btnIllustrate" >Illustrate</button> 
                   </form>

<form action="Home" class="form3">
<input name="policynumber" Id="policynumber" type="hidden" value="${customer.policynumber}"/>
<button Id="btnBack" type="submit" name="back">Back</button>
</form>

</body>
</html>