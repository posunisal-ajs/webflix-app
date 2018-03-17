<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="WEB-INF/pages/template/header-deslogado.jsp" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UNISAL - Desenvolvimento de Sistemas Web e Mobile</title>
        <style type="text/css">
            @import url(https://fonts.googleapis.com/css?family=Roboto:300);

            .login-page {
                width: 400px;
                padding: 8% 0 0;
                margin: auto;
            }
            .form {
                padding: 45px;

                
            }
            .form input {

            }
            .form button {
                font-family: "Roboto", sans-serif;
                text-transform: uppercase;
                outline: 0;
                width: 100%;
                border: 0;
                padding: 15px;
                color: #FFFFFF;
                font-size: 14px;
                -webkit-transition: all 0.3 ease;
                transition: all 0.3 ease;
                cursor: pointer;
            }
            
            .form .message {
                margin: 15px 0 0;
                color: #b3b3b3;
                font-size: 12px;
            }
            .form .message a {
                color: #4CAF50;
                text-decoration: none;
            }
            .form .register-form {
                display: none;
            }
            .container {
                position: relative;
                z-index: 1;
                max-width: 600px;
                margin: 0 auto;
            }
            .container:before, .container:after {
                content: "";
                display: block;
                clear: both;
            }
            .container .info {
                margin: 50px auto;
                text-align: center;
            }
            .container .info h1 {
                margin: 0 0 15px;
                padding: 0;
                font-size: 36px;
                font-weight: 300;
                color: #1a1a1a;
            }
            .container .info span {
                color: #4d4d4d;
                font-size: 12px;
            }
            .container .info span a {
                color: #000000;
                text-decoration: none;
            }
            .container .info span .fa {
                color: #EF3B3A;
            }
            body {
                background: #eee; /* fallback for old browsers */
                background: -webkit-linear-gradient(right, #eee, #eee);
                background: -moz-linear-gradient(right, #eee, #eee);
                background: -o-linear-gradient(right, #eee, #eee);
                background: linear-gradient(to left, #eee, #eee);
                font-family: "Roboto", sans-serif;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;      
            }
            .w-site {
            	padding-bottom: 0px !important;
            	min-height: 87%;
            }
            
            .box-login {
                background-color: #FFF;
			    padding-bottom: 25px;
			    border-radius: 10px;
			    border: 1px solid #F5F5F5;
            }
            body { 
			      background: url('static/img/bg-login.jpg') no-repeat center center fixed; 
				  -webkit-background-size: cover;
				  -moz-background-size: cover;
				  -o-background-size: cover;
				  background-size: cover;
			}
            
        </style>
    </head>
    <body class="bg">
        <div class="w-site">      
			<section>
			    <div class="container">
			      <div class="row justify-content-center">
			        <div class="col-12 col-xs-12 col-md-12 col-lg-12 text-center box-login">        	
			            <div class="form">
			            	<img class="login-logo" src="<%=request.getContextPath()%>/static/img/webflix.png"/>
			                <form action="login" method="post">
			                	<div class="form-group">
									<input type="text" placeholder="Digite um email" name="email" class="form-control"/ required>
								</div>
								<div class="form-group">
									<input type="password" placeholder="Digite uma senha" name="pass" class="form-control"/ required>
								</div>
								<button type="submit" class="btn btn__blue--nav pull-right mt-4 mb-4">ENTRAR</button>
							</form>
			            </div>
			          </div>
			         </div>
			        </div>
			 </section>    
        </div>
    </body>
    <c:import url="WEB-INF/pages/template/footer.jsp" />
</html>