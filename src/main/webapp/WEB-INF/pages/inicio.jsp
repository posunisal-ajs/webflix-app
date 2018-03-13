<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../pages/template/header.jsp" />

<div class="w-site">       
	<section>
	    <div class="container">
	      <div class="row justify-content-center">
	        <div class="col-12 col-xs-12 col-md-12 col-lg-12 text-center">
	          <div>
	          	<h2 class="pb-4">Salvar usuário</h2>
	            <form class="form-group col-12 col-xs-12 col-md-12 col-lg-12 align-itens-center justify-content-center d-flex" action="salvarUsuario" method="post">
					<div class="form-group col-12 col-xs-12 col-md-12 col-lg-8">
						<div class="form-group">
							<input type="text" placeholder="nome" name="nome" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<input type="text" placeholder="email" name="email" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<input type="text" placeholder="login" name="login" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<input type="password" placeholder="senha" name="senha" class="form-control" required="required"/>
						</div>
						<button type="submit" class="btn btn-success pull-right mt-4">Salvar</button>
					</div>
					<br/>
				</form>
			    <div class="clearfix"></div>
	            <div class="row">
	              <div class="col pt-4">
	                <h2 class="pb-4">Lista de usuários</h2>
	                <table class="table table-striped table-car-mob">
	                  <thead class="thead-default">
	                    <tr>
	                        <th>#</th>
							<th>Nome</th>
							<th>Email</th>
							<th>Login</th>
							<th>Senha</th>
							<th>UUID</th>
	                    </tr>
	                  </thead>
	                  <tbody>
	                    <c:forEach var="u" items="${usuarios}">
							<tr id="usuario_${u.id}">
								<td>${u.id}</td>
								<td>${u.nome}</td>
								<td>${u.email}</td>
								<td>${u.login}</td>
								<td>${u.senha}</td>
								<td>${u.uuid}</td>
							</tr>
						</c:forEach>
	                  </tbody>
	                </table> 
	              </div>
	            </div>
	          </div>
	        </div>            
	      </div> 
	    </div>   
	</section>
</div>

<c:import url="../pages/template/footer.jsp" />
