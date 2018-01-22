<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Ecommerce | Home</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">E-commerce</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="dashboard">Dashboard</a></li>
					<li><a href="new-product">New Product</a></li>
					<li><a href="all-products">All Products</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to E-commerce Site of Products</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>My Tasks</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								
								<!-- <th>Id</th> -->
								<th>Product Name</th>
								<th>Product Category</th>
								<th>Product Price</th>
								<th>Product Profit(%)</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${products}">
								<tr>
									<%-- <td>${task.id}</td> --%>
									<td>${product.name}</td>
									<td>${product.category}</td>
									<td>${product.price}</td>
									<td>${product.profit}</td>
									<td><a href="update-product?id=${product.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;
									<a href="delete-product?id=${product.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_Dashboard'}">
			<div class="container text-center" id="tasksDiv">
				<h3>Top 10 Products</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								
								<!-- <th>Id</th> -->
								<th>Product Name</th>
								<th>Product Price</th>
								<th>Product Profit(%)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${products}">
								<tr>
									<td>${product.name}</td>
									<td>${product.price}</td>
									<td>${product.profit}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Products</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-product">
					<input type="hidden" name="id" value="${product.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Product Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${product.name}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Product Category</label>
						<div class="col-md-7">
							<select class="form-control"  name="category" >
							
					       		<option  <c:if test="${product.category=='RAM'}" >selected</c:if>value="RAM">RAM</option>

					           <option  <c:if test="${product.category=='MOTHERBOARD'}" >selected</c:if> value="MOTHERBOARD">MOTHERBOARD</option>
					           <option <c:if test="${product.category=='GRAPHICS CARD'}" >selected</c:if> value="GRAPHICS CARD">GRAPHICS CARD</option>
					           
              				</select>
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">Product Price</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="price" value="${product.price}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Product Profit(%)</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="profit" value="${product.profit}"/>
						</div>				
					</div>
					
					<!-- <div class="form-group">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true"/>
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished" value="false" checked/>
							<div class="col-sm-1">No</div>
						</div>				
					</div>	 -->	
					<div class="form-group">
						<input type="submit" id="save" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>		
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
    
    
</body>
</html>