<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../pages/template/header.jsp" />
<div class="w-site">       
	<div class="msg-loading">
		<div class="mensagem">
			<span class="glyphicon glyphicon-time"></span> Processando...
		</div>
	</div>
	<section>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-xs-12 col-md-12 col-lg-12 text-center">
          <div>
            <!-- <h2 class="pb-4">Salvar filme</h2> -->
            
           <%-- <img src="<%=request.getContextPath()%>/static/img/pinterest-portfolio-image-4-4.jpg"/> --%>
            <!-- <form class="form-group col-12 col-xs-12 col-md-12 col-lg-12 align-itens-center justify-content-center d-flex" action="salvarFilme" method="post" enctype="multipart/form-data">
    		    <div class="form-group col-12 col-xs-12 col-md-8 col-lg-6">
	                <div class="form-group">
	                  <input type="text" placeholder="Nome" name="nome" class="form-control" required="required"/>
	                </div>
	                <div class="form-group">
	                  <input type="text" placeholder="Genero" name="genero" class="form-control" required="required"/>
	                </div>
	                <div class="form-group">
	                  <input type="text" placeholder="Lançamento" name="lancamento" class="form-control" required="required"/>
	                </div>
	                <div class="form-group">
	                  <textarea  placeholder="Informações" name="informacoes" class="form-control" required="required"></textarea>
	                </div>
	                <div class="form-group">
	                	<div class='input-wrapper'>
          					<label for='file'>
          					    Selecionar imagem
          					  </label>
                       <input type="file" name="file" id="file" size="60" />
                       <img id="img-1-add" class="img-page" src="#" alt="" />
                       <input type="hidden" name="imgFilme" id="imgFilme" value="">
          				</div>
	               </div>
					<button type="submit" value="Upload" class="btn btn-success pull-right mt-4">Salvar</button>
				</div>
				<br/>
    		</form> -->
		    <div class="clearfix"></div>
            <div class="row">
              <div class="col pt-4">
                <h2 class="pb-4">Lista de filmes</h2>
                <button class="btn btn-success pull-right mb-4" data-target="#modalAdd" data-toggle="modal">Adicionar <i class="fa fa-plus ml-1" ></i></button>
                <table class="table table-car-mob">
                  <thead class="thead-default">
                    <tr>
                      <th class="w10">#</th>
                      <th class="w30">Filme</th>
                      <th class="w15">Gênero</th>
                      <th class="w25">Imagem</th>
                       <th class="w30">Ações</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="f" items="${filmes}">
						<tr id="filme_${f.id}" class="fwdDetalhe" data-item="${f.id}">
							<td class="fwdId" data-item="${f.id}">${f.id}</td>
							<td class="fwdNome" data-item="${f.id}">${f.nome}</td>
							<td class="fwdGenero" data-item="${f.id}">${f.genero}</td>
							<td class="fwdLancamento d-none" data-item="${f.id}">${f.lancamento}</td>
							<td class="fwdInformacoes d-none" data-item="${f.id}">${f.informacoes}</td>
							<td class="fwdImg" data-item="${f.id}">
								<span class="fwdImgName d-none" data-item="${f.id}">${f.img}</span>	
								<img class="img-table fwdImageTable" data-item="${f.id}" src="<%=request.getContextPath()%>/upload/${f.img}" /></td>
							<td>
								<div class="d-inline-block">
									<button type="submit" class="btn btn-icon icon-1 actOpenEditar" data-item="${f.id}" data-target="#modalEdit" data-toggle="modal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
								</div>
								<div class="d-inline-block">
									<button class="btn btn-icon icon-2 actOpenDetalhes" data-item="${f.id}" data-target="#modalDelete" data-toggle="modal"><i class="fa fa-trash-o" ></i></button>
								</div>
								<button class="btn btn-icon icon-2 actOpenDetalhes" data-item="${f.id}" data-target="#modalDetalhes" data-toggle="modal"><i class="fa fa-plus" ></i></button>
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
 <!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button> -->

<!-- Modal Adicionar -->
<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="modalAdd" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="div--modal__adicionar"><h5 class="modal-title">Adicionar filme</h5></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="salvarFilme" method="post" enctype="multipart/form-data" class="d-inline-block">
	      <div class="modal-body modal-body-bg">
	      	<div class="form-group">
               <input type="text" placeholder="Nome" name="nome" class="form-control" required="required"/>
             </div>
             <div class="form-group">
               <input type="text" placeholder="Genero" name="genero" class="form-control" required="required"/>
             </div>
             <div class="form-group">
               <input type="text" placeholder="Lançamento" name="lancamento" class="form-control" required="required"/>
             </div>
             <div class="form-group">
               <textarea  placeholder="Informações" name="informacoes" rows="4" class="form-control" required="required"></textarea>
             </div>
             <div class="form-group">
	             <div class='input-wrapper'>
	             	<div class="w100 text-center">
		             	<label for='file'>
		      				Selecionar imagem de capa
		      			</label>
	      			</div>
	      			<div class="w100 text-center">
		               <input type="file" name="file" id="file" size="60" />
                       <img id="img-1-add" class="img-page" src="#" alt="" />
                       <input type="hidden" name="imgFilme" id="imgFilme" value="">
	                </div>
	      		</div>
	        </div>
	      </div>
	      <div class="modal-footer">
				<input type="hidden" name="id" class="fwdIdFilme" value=""/>
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
      	<div class="fwdTituloFilme div--modal__titulo"></div>
      	<div class="fwdImgFilme div--modal__imgFilme"><img class="img--modal__imgFilme fwdImagemDetalhe"/></div>
      	<div class="div--modal__genero"><strong>Gênero:</strong> <span class="fwdGeneroFilme"></span></div>
      	<div class="div--modal__lancamento"><strong>Data de lançamento:</strong> <span class="fwdLancamentoFilme"></div>
      	<div class="div--modal__informacoes"><strong>Informações:</strong> <span class="fwdInformacoesFilme"></div>
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
      	<div class="fwdTituloFilme div--modal__titulo"></div>
      	<div class="fwdImgFilme div--modal__imgFilme"><img class="img--modal__imgFilme fwdImagemDetalhe"/></div>
      </div>
      <div class="modal-footer">
		<form action="deletarFilme" method="post" enctype="multipart/form-data" class="d-inline-block">
			<input type="hidden" name="id" class="fwdIdFilme" value=""/>
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
        <div class="div--modal__editar"><h5 class="modal-title">Editar filme</h5></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="editarFilme" method="post" enctype="multipart/form-data" class="d-inline-block">
	      <div class="modal-body modal-body-bg">
	      	<div class="form-group">
               <input type="text" placeholder="Nome" name="nome" class="form-control fwdTituloEdit" required="required"/>
             </div>
             <div class="form-group">
               <input type="text" placeholder="Genero" name="genero" class="form-control fwdGeneroEdit" required="required"/>
             </div>
             <div class="form-group">
               <input type="text" placeholder="Lançamento" name="lancamento" class="form-control fwdLancamentoEdit" required="required"/>
             </div>
             <div class="form-group">
               <textarea  placeholder="Informações" name="informacoes" rows="4" class="form-control fwdInformacoesEdit" required="required"></textarea>
             </div>
             <div class="form-group">
	             <div class='input-wrapper'>
	             	<div class="w100 text-center">
		             	<label for='fileEdit'>
		      				Selecionar imagem de capa
		      			</label>
	      			</div>
	      			<div class="w100 text-center">
		                <input type="file" name="fileEdit" id="fileEdit" size="60" />
		                <img id="img-1-edit" class="img-page" src="#" alt="" />
		                <input type="hidden" name="imgFilmeEdit" id="imgFilmeEdit" value="">
	                </div>
	      		</div>
	        </div>
	      </div>
	      <div class="modal-footer">
				<input type="hidden" name="id" class="fwdIdFilme" value=""/>
				<button type="submit" class="btn btn-success">Alterar</button>
	        	<button type="button" class="btn btn-blue-nav" data-dismiss="modal">Cancelar</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<c:import url="../pages/template/footer.jsp" />

<script> 
  // var $input    = document.getElementById('input-file'),
  // $fileName = document.getElementById('file-name');
  
  // $input.addEventListener('change', function(){
  //  $fileName.textContent = this.value;
  // });

  var readURL = function (input, type) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          console.log(type);
          reader.onload = function (e) {
              $('#img-1-' + type).attr('src', e.target.result);
          }
          
          reader.readAsDataURL(input.files[0]);
          window.imgName = input.files[0].name;
      }
  }

  $("#file").change(function(ret) {
      readURL(this, "add");
      //console.log(window.imgName);
      $("#imgFilme").val(window.imgName);
  });
  
  $("#fileEdit").change(function(ret) {
      readURL(this, "edit");
      $("#imgFilmeEdit").val(window.imgName);
  });
  
  $(document).ready(function(){
	//Mostrando os itens do pedido em minhas inscrições
      $(this).on("click", ".actOpenDetalhes[data-item]", function(e) {
        var idItem = $(this).data("item");
        var nome = $(".fwdNome[data-item='" + idItem + "']").text();
        var genero = $(".fwdGenero[data-item='" + idItem + "']").text();
        var lancamento = $(".fwdLancamento[data-item='" + idItem + "']").text();
        var informacoes = $(".fwdInformacoes[data-item='" + idItem + "']").text();
        var img = $(".fwdImageTable[data-item='" + idItem + "']").attr('src');
        $(".fwdTituloFilme").text(nome);
        $(".fwdGeneroFilme").text(genero);
        $(".fwdLancamentoFilme").text(lancamento);
        $(".fwdInformacoesFilme").text(informacoes);
        $(".fwdImagemDetalhe").attr('src', img);
        $(".fwdIdFilme").val(idItem);
        
        /* console.log(img); */
      });
	
      	$(this).on("click", ".actOpenEditar[data-item]", function(e) {
          var idItem = $(this).data("item");
          var imgName = $(".fwdImgName[data-item='" + idItem + "']").text();
          var nome = $(".fwdNome[data-item='" + idItem + "']").text();
          var genero = $(".fwdGenero[data-item='" + idItem + "']").text();
          var lancamento = $(".fwdLancamento[data-item='" + idItem + "']").text();
          var informacoes = $(".fwdInformacoes[data-item='" + idItem + "']").text();
          var img = $(".fwdImageTable[data-item='" + idItem + "']").attr('src');
          $(".fwdTituloEdit").val(nome);
          $(".fwdGeneroEdit").val(genero);
          $(".fwdLancamentoEdit").val(lancamento);
          $(".fwdInformacoesEdit").val(informacoes);
          $("#img-1-edit").attr('src', img);
          $("#imgFilmeEdit").val(imgName);
          $(".fwdIdFilme").val(idItem);
        });
  });
  
  $('button[name="remove_levels"]').on('click', function(e) {
	  var $form = $(this).closest('form');
	  e.preventDefault();
	  $('#confirm').modal({
	      backdrop: 'static',
	      keyboard: false
	    })
	    .one('click', '#delete', function(e) {
	      $form.trigger('submit');
	    });
	});
  
</script>


