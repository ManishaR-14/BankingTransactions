<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>  
var request;  
function sendInfo()  
{  
	//aler("hii");

var url="fundTransfer.jsp";  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('hello').innerHTML=val;  
}  
}  
  
</script>  

<script type="text/javascript">
function vaidateData(){
	
	if(document.forms[0].fromacc.value==''){
		alert("Please Enter From Account No .");
		return false ;
	}
	if(document.forms[0].toacc.value==''){
		alert("Please Enter To Account No .");
		return false ;
	}
	if(document.forms[0].amt.value==''){
		alert("Please Enter the Amount");
		return false ;
	}
	
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Transaction</title>
</head>
<body>
<form >
<h3 align="center">Online Transaction</h3>
<table border = "1" align="center">
<%
Connection conn =null ;
ResultSet rs = null ;
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
 //Here transactios is database,root is username,Mysqlinstaller@45 is password
Statement stmt=conn.createStatement();  
 rs=stmt.executeQuery("select name name, accountnumber accountnumber ,sum(balance) balance from Bankinfo group by name");  
while(rs.next()) 
{
%>
<tr>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("accountnumber") %></td>
<td><%=rs.getString("balance") %></td>
</tr>
<%
}
}
catch(Exception e){
	e.printStackTrace();
}
%>

</table>
<table align="center">
<tr><td></td><td><input type = "button" value="Fund Transfer" onclick ="sendInfo();"></td></tr>
</table>
</form>
<span id="hello"> </span>

</body>
</html>
