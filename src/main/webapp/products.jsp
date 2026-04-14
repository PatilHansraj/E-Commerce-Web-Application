<%@ page import="java.sql.*, com.project.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="common/header.jsp" %>

<style>

/* AMAZON STYLE SEARCH BAR */

.search-bar-container{
width:100%;
background:#131921;
padding:12px 0;
display:flex;
justify-content:center;
}

.search-box{
width:70%;
display:flex;
}

.search-box select{
padding:10px;
border:none;
background:#f3f3f3;
border-radius:4px 0 0 4px;
}

.search-box input{
flex:1;
padding:10px;
border:none;
outline:none;
font-size:15px;
}

.search-box button{
background:#febd69;
border:none;
padding:10px 18px;
cursor:pointer;
border-radius:0 4px 4px 0;
font-weight:bold;
}

/* HERO SLIDER */

.hero-slider{
width:100%;
height:350px;
position:relative;
overflow:hidden;
margin-top:10px;
}

.slide{
width:100%;
height:350px;
position:absolute;
opacity:0;
transition:1s;
}

.slide img{
width:100%;
height:100%;
object-fit:cover;
}

.slide.active{
opacity:1;
}

.arrow{
position:absolute;
top:50%;
transform:translateY(-50%);
font-size:40px;
color:white;
background:rgba(0,0,0,0.3);
padding:8px 14px;
cursor:pointer;
border-radius:5px;
}

.arrow.left{
left:20px;
}

.arrow.right{
right:20px;
}

/* PRODUCTS */

.products-container{
width:90%;
margin:25px auto;
display:grid;
grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
gap:20px;
}

.product-card{
background:white;
padding:15px;
border-radius:8px;
box-shadow:0 2px 6px rgba(0,0,0,0.2);
text-align:center;
position:relative;
transition:0.3s;
}

.product-card:hover{
transform:translateY(-4px);
}

.product-card img{
width:100%;
height:180px;
object-fit:cover;
border-radius:6px;
}

/* Favourite icon */

.fav-icon{
position:absolute;
top:10px;
left:10px;
font-size:20px;
background:white;
padding:6px 9px;
border-radius:50%;
cursor:pointer;
color:#bbb;
transition:0.3s;
box-shadow:0 2px 5px rgba(0,0,0,0.3);
}

.fav-icon.active{
color:red;
}

/* Buttons */

.btn-container{
display:flex;
gap:6px;
}

button{
width:100%;
padding:6px;
margin-top:8px;
border:none;
border-radius:5px;
cursor:pointer;
font-size:13px;
font-weight:bold;
}

.add-btn{
background:orange;
color:white;
}

.buy-btn{
background:green;
color:white;
}

/* Category Navbar */

.category-bar{
width:90%;
margin:40px auto;
background:white;
padding:15px;
border-radius:10px;
box-shadow:0 3px 8px rgba(0,0,0,0.15);
display:flex;
flex-wrap:wrap;
justify-content:center;
gap:15px;
}

.category-bar a{
text-decoration:none;
background:#f2f2f2;
padding:8px 14px;
border-radius:20px;
font-size:14px;
color:#333;
transition:0.3s;
}

.category-bar a:hover{
background:#ff6600;
color:white;
transform:scale(1.05);
}

</style>


<!-- AMAZON STYLE SEARCH BAR -->

<div class="search-bar-container">

<form class="search-box" action="search.jsp" method="get">

<select name="category">
<option value="">All</option>
<option value="electronics">Electronics</option>
<option value="clothes">Clothes</option>
<option value="women">Women Dress</option>
<option value="kitchen">Kitchen</option>
</select>

<input type="text" name="keyword" placeholder="Search products...">

<button type="submit">🔍</button>

</form>

</div>


<!-- AMAZON STYLE BANNER -->

<div class="hero-slider">

<div class="slide active">
<img src="https://tse2.mm.bing.net/th/id/OIP.t9-WVRTYjV6UAVSNSvC4lgHaCe?pid=Api&P=0&h=180">
</div>

<div class="slide">
<img src="https://tse2.mm.bing.net/th/id/OIP.5chqUpdHdBe0jSxCHxYkKAHaEJ?pid=Api&P=0&h=180">
</div>

<div class="slide">
<img src="https://tse4.mm.bing.net/th/id/OIP.TY0bT8hy4lb5TPH3glltRgHaEK?pid=Api&P=0&h=180">
</div>

<div class="arrow left" onclick="prevSlide()">❮</div>
<div class="arrow right" onclick="nextSlide()">❯</div>

</div>


<h2 style="text-align:center;margin-top:20px;">Our Products</h2>


<div class="category-bar">

<a href="#">Electronics</a>
<a href="#">Clothes</a>
<a href="#">Women Dress</a>
<a href="#">Jeans</a>
<a href="#">Sneakers</a>
<a href="#">Jacket</a>
<a href="#">T-Shirt</a>
<a href="#">Cookware Set</a>
<a href="#">Electric Kettle</a>
<a href="#">Mixer Grinder</a>
<a href="#">Non-Stick Pan</a>
<a href="#">Dinner Set</a>
<a href="#">More...</a>

</div>


<div class="products-container">

<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try{
con=DBConnection.getConnection();
ps=con.prepareStatement("SELECT * FROM products");
rs=ps.executeQuery();

while(rs.next()){
%>

<div class="product-card">

<div class="fav-icon" onclick="toggleFav(this)">❤</div>

<img src="images/<%= rs.getString("image")%>">

<h3><%= rs.getString("name") %></h3>

<p><%= rs.getString("description") %></p>

<h3>₹ <%= rs.getDouble("price") %></h3>

<div class="btn-container">

<form action="CartServlet" method="post" style="width:50%;">
<input type="hidden" name="productId" value="<%= rs.getInt("id") %>">
<button type="submit" name="action" value="add" class="add-btn">
Add to Cart
</button>
</form>

<form action="payment.jsp" method="get" style="width:50%;">
<input type="hidden" name="total" value="<%= rs.getDouble("price") %>">
<button type="submit" class="buy-btn">
Buy Now
</button>
</form>

</div>

</div>

<%
}
}catch(Exception e){
out.println("<p style='color:red;text-align:center;'>Error loading products</p>");
e.printStackTrace();
}finally{
if(rs!=null)rs.close();
if(ps!=null)ps.close();
if(con!=null)con.close();
}
%>

</div>


<script>

function toggleFav(icon){
icon.classList.toggle("active");
}

let slides=document.querySelectorAll(".slide");
let index=0;

function showSlide(i){
slides.forEach(s=>s.classList.remove("active"));
slides[i].classList.add("active");
}

function nextSlide(){
index++;
if(index>=slides.length) index=0;
showSlide(index);
}

function prevSlide(){
index--;
if(index<0) index=slides.length-1;
showSlide(index);
}

setInterval(nextSlide,4000);

</script>

<%@ include file="common/footer.jsp" %>