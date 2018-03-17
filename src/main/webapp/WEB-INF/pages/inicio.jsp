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
	          	<!-- <h2 class="pb-4">Salvar usuário</h2>
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
				</form> -->
			    <div class="clearfix"></div>
	            <div class="row">
	              <div class="col pt-4">
	                <h2 class="pb-4">Lista de usuários</h2>
	                <button class="btn btn-success pull-right mb-4" data-target="#modalAdd" data-toggle="modal">Adicionar <i class="fa fa-plus ml-1" ></i></button>
	                <table class="table table-striped table-car-mob">
	                  <thead class="thead-default">
	                    <tr>
	                        <th>#</th>
							<th>Nome</th>
							<th>Email</th>
							<th>Ações</th>
	                    </tr>
	                  </thead>
	                  <tbody>
	                    <c:forEach var="u" items="${usuarios}">
							<tr id="usuario_${u.id}">
								<td class="fwdId" data-item="${u.id}">${u.id}</td>
								<td class="fwdNome" data-item="${u.id}">${u.nome}</td>
								<td class="fwdEmail" data-item="${u.id}">${u.email}</td>
								<td class="fwdLogin d-none" data-item="${u.id}">${u.login}</td>
								<td class="fwdSenha d-none" data-item="${u.id}">${u.senha}</td>
								<td class="fwdUuid d-none" data-item="${u.id}">${u.uuid}</td>
								<td>
									<div class="d-inline-block">
										<button type="submit" class="btn btn-icon icon-1 actOpenEditar" data-item="${u.id}" data-target="#modalEdit" data-toggle="modal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
									</div>
									<div class="d-inline-block">
										<button class="btn btn-icon icon-2 actOpenDetalhes" data-item="${u.id}" data-target="#modalDelete" data-toggle="modal"><i class="fa fa-trash-o" ></i></button>
									</div>
									<button class="btn btn-icon icon-2 actOpenDetalhes" data-item="${u.id}" data-target="#modalDetalhes" data-toggle="modal"><i class="fa fa-plus" ></i></button>
								</td>
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

<!-- Modal Adicionar -->
<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="modalAdd" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="div--modal__adicionar"><h5 class="modal-title">Adicionar usuário</h5></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="salvarUsuario" method="post" class="d-inline-block">
	      <div class="modal-body modal-body-bg">
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
	      </div>
	      <div class="modal-footer">
				<input type="hidden" name="id" class="fwdId" value=""/>
				<button type="submit" class="btn btn-success">Salvar</button>
	        	<button type="button" class="btn btn-blue-nav" data-dismiss="modal">Cancelar</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<!-- Modal List -->
<div class="modal fade" id="modalDetalhes" tabindex="-1" role="dialog" aria-labelledby="modalDetalhes" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="div--modal__detalhes"><h5 class="modal-title">Detalhes</h5></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body modal-body-bg">
      	<div class="fwdNome div--modal__titulo"></div>
      	<div class="div--modal__genero"><strong>Email:</strong> <span class="fwdEmailUsuario"></span></div>
      	<div class="div--modal__lancamento"><strong>Login:</strong> <span class="fwdLoginUsuario"></div>
      	<div class="div--modal__informacoes"><strong>UUID:</strong> <span class="fwdUuidUsuario"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-blue-nav" data-dismiss="modal">Fechar</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>

<!-- Modal Deletar -->
<div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="modalDelete" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="div--modal__excluir"><h5 class="modal-title">Deseja realmente excluir?</h5></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body modal-body-bg">
      	<div class="fwdNomeUsuario div--modal__titulo"></div>
      </div>
      <div class="modal-footer">
		<form action="deletarUsuario" method="post" class="d-inline-block">
			<input type="hidden" name="id" class="fwdId" value=""/>
			<button type="submit" class="btn btn-danger">Excluir</button>
		</form>
        <button type="button" class="btn btn-blue-nav" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Editar -->
<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="modalEdit" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="div--modal__editar"><h5 class="modal-title">Editar usuário</h5></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="editarUsuario" method="post" class="d-inline-block">
	      <div class="modal-body modal-body-bg">
	      	<div class="form-group">
               <input type="text" placeholder="Nome" name="nome" class="form-control fwdNomeEdit" required="required"/>
             </div>
             <div class="form-group">
               <input type="text" placeholder="Email" name="email" class="form-control fwdEmailEdit" required="required"/>
             </div>
             <div class="form-group">
               <input type="text" placeholder="Login" name="login" class="form-control fwdLoginEdit" required="required"/>
             </div>
             <div class="form-group">
               <input type="password" placeholder="Senha" name="senha" class="form-control fwdSenhaEdit" required="required"/>
             </div>
	      </div>
	      <div class="modal-footer">
				<input type="hidden" name="id" class="fwdId" value=""/>
				<button type="submit" class="btn btn-success">Alterar</button>
	        	<button type="button" class="btn btn-blue-nav" data-dismiss="modal">Cancelar</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<c:import url="../pages/template/footer.jsp" />

<script>
	$(document).ready(function(){
		//Mostrando os itens do pedido em minhas inscrições
	      $(this).on("click", ".actOpenDetalhes[data-item]", function(e) {
	        var idItem = $(this).data("item");
	        var nome = $(".fwdNome[data-item='" + idItem + "']").text();
	        var email = $(".fwdEmail[data-item='" + idItem + "']").text();
	        var login = $(".fwdLogin[data-item='" + idItem + "']").text();
	        var senha = $(".fwdSenha[data-item='" + idItem + "']").text();
	        var uuid  = $(".fwdUuid[data-item='" + idItem + "']").text();
	        $(".fwdNomeUsuario").text(nome);
	        $(".fwdEmailUsuario").text(email);
	        $(".fwdLoginUsuario").text(login);
	        $(".fwdUuidUsuario").text(uuid);
	        $(".fwdId").val(idItem);
	        
	        /* console.log(img); */
	      });
	
      	$(this).on("click", ".actOpenEditar[data-item]", function(e) {
          var idItem = $(this).data("item");
          var nome  = $(".fwdNome[data-item='" + idItem + "']").text();
          var email = $(".fwdEmail[data-item='" + idItem + "']").text();
          var login = $(".fwdLogin[data-item='" + idItem + "']").text();
          var senha = $(".fwdSenha[data-item='" + idItem + "']").text();
          $(".fwdNomeEdit").val(nome);
          $(".fwdEmailEdit").val(email);
          $(".fwdLoginEdit").val(login);
          $(".fwdSenhaEdit").val(senha);
          $(".fwdId").val(idItem);
        });
  });

</script>
