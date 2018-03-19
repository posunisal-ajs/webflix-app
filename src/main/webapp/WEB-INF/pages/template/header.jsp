<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-cache, no-store">
<meta http-equiv="Pragma" content="no-cache, no-store">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/vendor/bootstrap/css/bootstrap-4.min.css" media="screen, print" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.2.0/css/swiper.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/vendor/froala/css/froala_blocks.css" media="screen, print" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/layout.css?b=123123" media="screen, print" /> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/base.css" media="screen, print" />

<!-- FAVICON -->
<link rel="icon" href="<%=request.getContextPath()%>/static/img/webflixicon.png" sizes="32x32">

<title>Webflix Unisal</title>
</head>
<body>
	<header class="h-menu-color">
	    <div class="container">
	      <nav class="navbar navbar-expand-md">
	        <!-- <a class="navbar-brand" href="index.html"></a> -->  
			<form action="filmes" method="post" class="w75">
				<button class="btn-clean-h1 dropdown-item" type="submit"><img class="img-logo-topo" src="<%=request.getContextPath()%>/static/img/webflix.png"/></button> 
			</form>
	        <a class="navbar-toggler">
	          <!-- <span class="navbar-toggler-icon"></span> -->
	          <input id="actMenu" type="checkbox" data-toggle="collapse" data-target="#navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
	          <label class="lbl-menu" for="actMenu" >
	            <span class="nav-btn-inner">
	              <span class="menu-icon menu-icon-first"></span> 
	              <span class="menu-icon menu-icon-second"></span> 
	              <span class="menu-icon menu-icon-third"></span></span>
	          </label>
	        </a>
	
	        <div class="collapse navbar-collapse" id="navbarNav1">
	           <!-- para esconder usar "d-none" -->
	          <ul class="navbar-nav justify-content-end d-lg-flex ml-md-auto navbar-mobile">
	          	<li>
	           		
	                 <form action="filmes" method="post">
						<button class="btn-clean-ico dropdown-item fa-icon--m" type="submit"><i class="fa fa-film fa-icon-size"></i></button> 
					</form>
	                
	                
	            </li>
	                
	            <li class="nav-item">
	              <div class="btn-group">
	                <a class="nav-link dropdown-toggle user-menu-tooltip nav-icon-mob" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                  <i class="fa fa-user-circle icon-header-size" aria-hidden="true"></i>
	                </a>
	                <div class="dropdown-menu">
	                    <!-- <div class="pl-4 pr-4 pb-1"><a href="login.html" class="btn btn-personalised-full">Entrar</a></div>-->
	                    <form action="listaFilmes" method="post">
						    <input class="btn-clean-drop dropdown-item" type="submit" value="Lista de filmes" /> 
						</form>
						<form action="listaUsuarios" method="post">
						    <input class="btn-clean-drop dropdown-item" type="submit" value="Lista de usuários" /> 
						</form>
				        <form action="logout" method="post">
						    <input class="btn-clean-drop dropdown-item" type="submit" value="Sair" /> 
						</form>
	                </div>
	              </div>
	            </li>
	            <!-- <li class="nav-item"> -->
	              <!-- <a class="nav-link" href="">Home <span class="sr-only">(current)</span></a> -->
	            <!--   <a class="nav-link" href="minhas-inscricoes.html">Minhas inscrições<span class="sr-only">(current)</span></a>
	            </li> -->
	           
	            <li class="nav-item">
	              <a class="nav-link">
	              	
	              	<%-- <%
				        if (request.getAttribute("email") != null) {%>
				        Olá, <%= request.getAttribute("email")%>
				        <%}
				     %> --%>
	              </a>
	            </li>
	
	          </ul>
	          
	        </div>
	      </nav>
	    </div>
	</header>	
	<br/>
	<br/>