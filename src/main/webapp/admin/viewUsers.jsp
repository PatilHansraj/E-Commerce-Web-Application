<%@ page import="java.sql.*, com.project.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header1.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>View Users | Admin</title>

<style>

body{
margin:0;
font-family:Arial, sans-serif;
background:linear-gradient(135deg,#ff9966,#ff5e62);
min-height:100vh;
}

/* Page container */

.page{
display:flex;
justify-content:center;
margin-top:80px;
}

/* Card */

.container{
background:white;
width:700px;
padding:30px 25px;
border-radius:18px;
box-shadow:0 15px 35px rgba(0,0,0,0.3);
}

/* Title */

h2{
text-align:center;
color:#2e7d32;
margin-bottom:25px;
}

/* Table */

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

table th,table td{
padding:12px 15px;
text-align:center;
border-bottom:1px solid #ddd;
}

table th{
background:#2e7d32;
color:white;
}

table tr:hover{
background:#f1f1f1;
}

/* Button */

.back{
display:inline-block;
margin-top:20px;
padding:10px 18px;
text-decoration:none;
background:#ff9800;
color:white;
border-radius:30px;
font-weight:bold;
}

.back:hover{
background:#e68a00;
}

.center{
text-align:center;
}

</style>
</head>

<body>

<div class="page">

<div class="container">

<h2>Registered Users</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
</tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
con = DBConnection.getConnection();
ps = con.prepareStatement("SELECT id,name,email FROM users WHERE role='user'");
rs = ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
</tr>

<%
}

}catch(Exception e){
out.println("<p style='color:red'>Error:"+e.getMessage()+"</p>");
}
finally{
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
}
%>

</table>

<div class="center">
<a href="dashboard.jsp" class="back">Back to Dashboard</a>
</div>

</div>

</div>

<%@ include file="footer1.jsp" %>

</body>
</html>