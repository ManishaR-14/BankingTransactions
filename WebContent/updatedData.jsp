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
<form action="fundTransfer.jsp" method="post">
<table>
<%
Connection conn =null ;
ResultSet rs = null ;
String fromacc = request.getParameter("fromacc");
String toacc = request.getParameter("toacc");
String amt = request.getParameter("amt");
%>
<tr>
<td>Name</td>
<td>Account number</td>
<td>Balance</td>
</tr>

<%
try{  
Class.forName("com.mysql.jdbc.Driver");  
 conn=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/transaction","root","Mysqlinstaller@45");   
String sql = "update Bankinfo set balance=balance-"+Integer.parseInt(amt)+" where accountnumber = '"+fromacc+"' " ;
PreparedStatement ps=conn.prepareStatement(sql) ; 
ps.execute();
//Here decrease the balance  of fromaccount 
String sql1 = "update Bankinfo set balance=balance+"+Integer.parseInt(amt)+" where accountnumber = '"+toacc+"'" ;
PreparedStatement ps1=conn.prepareStatement(sql1) ; 
ps1.execute();
//Here increase the balance of toaccount

}
catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("index.jsp");
%>

</table>

</form>
</body>
</html>

