<%@ page import="java.sql.*,com.project.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header1.jsp" %>

<%
String pid = request.getParameter("id");
int id = 0;

if(pid != null){
    id = Integer.parseInt(pid);
}else{
    out.println("<h3 style='color:red;text-align:center;'>Product ID Missing</h3>");
    return;
}

Connection con = DBConnection.getConnection();

PreparedStatement ps =
    con.prepareStatement("SELECT * FROM products WHERE id=?");
ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

if(!rs.next()){
    out.println("<h3 style='color:red;text-align:center;'>Product Not Found</h3>");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Product | Admin</title>

<style>
*{
box-sizing:border-box;
}

body{
margin:0;
padding:0;
font-family:Arial;
background:linear-gradient(135deg,#f9f047,#0fd850);
min-height:100vh;

display:flex;
flex-direction:column;   /* column layout */
align-items:center;


}

.card{
background:white;
width:420px;
padding:30px 28px;
border-radius:16px;
box-shadow:0 15px 30px rgba(0,0,0,0.3);
margin-top:120px;   /* navbar ke niche space */
}

h2{
text-align:center;
color:#2e7d32;
margin-bottom:25px;
}

label{
display:block;
font-weight:bold;
margin:10px 0 5px;
font-size:14px;
}

input{
width:100%;
padding:12px 14px;
margin-bottom:12px;
border-radius:8px;
border:1px solid #ccc;
font-size:14px;
}

input:focus{
outline:none;
border-color:#2e7d32;
}

button{
width:100%;
padding:13px;
margin-top:15px;
background:#2e7d32;
border:none;
color:white;
font-size:16px;
font-weight:bold;
border-radius:30px;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#66bb6a;
transform:scale(1.03);
}

.back{
display:block;
margin-top:18px;
text-align:center;
text-decoration:none;
color:#2e7d32;
font-weight:bold;
}

.back:hover{
text-decoration:underline;
}
</style>

</head>

<body>

<div class="card">

<h2>Edit Product</h2>

<form action="../UpdateProductServlet" method="post">

<input type="hidden" name="id" value="<%= id %>">

<label>Product Name</label>
<input type="text" name="name" value="<%= rs.getString("name") %>" required>

<label>Description</label>
<input type="text" name="desc" value="<%= rs.getString("description") %>" required>

<label>Price</label>
<input type="number" name="price" value="<%= rs.getDouble("price") %>" required>

<button type="submit">Update Product</button>

</form>

<a href="manageProducts.jsp" class="back">Back to Manage Products</a>

</div>

<%@ include file="footer1.jsp" %>

</body>
</html>