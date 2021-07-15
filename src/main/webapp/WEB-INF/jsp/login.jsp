<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

.lab{
  color: rgb(0,0,255);
}
.login{
 background-color : lightblue;
  color: white;
  position: absolute;
    top: 52%;
    left:50%;
 
}

form {
 padding: 190px 90px 10px 200px;
}
</style>

<meta charset="ISO-8859-1">
<title>Investment Portfolio - Login</title>
</head>
<body >

<form action="checklogin">
<label class="lab">Error Message: </label>
<div id=”error” class="lab">${status}</div><br /><br /><br />
<label>Agent Id: </label>
<input type="text" name="agentID" id=”agentID” /><br /><br /><br /><br />
<label>Password: </label>
<input type="text" name="password" id=”password” /><br /><br /><br />
<input type="submit" id=”btnLogin” value=login class="login"/>
</form>

</body>
</html>