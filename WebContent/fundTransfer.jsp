<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Transaction</title>
</head>

<body>
<form action="updatedData.jsp" method="post" onsubmit="return vaidateData();">
<!-- <h2 align="center">Online Transaction</h2> -->
<table align="center">
<%
Connection conn =null ;
ResultSet rs = null ;
%>
<tr>
<td>From Acc no.</td>
<td><input type="text" name="fromacc"></td>
</tr>
<tr>
<td>To Acc no.</td>
<td><input type="text" name="toacc"></td>
</tr><tr>
<td>Enter Amount</td>
<td><input type="text" name="amt"></td>
</tr>

<tr><td></td><td><input type = "submit" value="Transfer"></td></tr>

</table>

</form>


</body>
</html>