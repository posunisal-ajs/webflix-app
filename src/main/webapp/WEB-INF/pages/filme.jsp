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
            <h2 class="pb-4">Salvar filme</h2>
            
           <%-- <img src="<%=request.getContextPath()%>/static/img/pinterest-portfolio-image-4-4.jpg"/> --%>
            <form class="form-group col-12 col-xs-12 col-md-12 col-lg-12 align-itens-center justify-content-center d-flex" action="salvarFilme" method="post" enctype="multipart/form-data">
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
                       <img id="img-1" class="img-page" src="#" alt="" />
                       <input type="hidden" name="imgFilme" id="imgFilme" value="">
          				</div>
	               </div>
					<button type="submit" value="Upload" class="btn btn-success pull-right mt-4">Salvar</button>
				</div>
				<br/>
    		</form>
		    <div class="clearfix"></div>
            <div class="row">
              <div class="col pt-4">
                <h2 class="pb-4">Lista de filmes</h2>
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
							<td class="fwdImg" data-item="${f.id}"><img class="img-table fwdImageTable" data-item="${f.id}" src="<%=request.getContextPath()%>/upload/${f.img}" /></td>
							<td>
								<form action="editarFilme" class="d-inline-block">
									<input type="hidden" value="${f.id}"/>
									<button type="submit" class="btn btn-icon icon-1"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
								</form>
								<form action="deletarFilme" class="d-inline-block">
									<input type="hidden" value="${f.id}"/>
									<button type="submit" class="btn btn-icon icon-2"><i class="fa fa-trash-o" ></i></button>
								</form>
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

<!-- Modal -->
<div class="modal fade" id="modalDetalhes" tabindex="-1" role="dialog" aria-labelledby="modalDetalhes" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Detalhes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="fwdTituloFilme"></div>
      	<div class="fwdGeneroFilme"></div>
      	<div class="fwdLancamentoFilme"></div>
      	<div class="fwdInformacoesFilme"></div>
      	<div class="fwdImgFilme"><img class="img-table fwdImagemDetalhe"/></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
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

  var readURL = function (input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          
          reader.onload = function (e) {
              $('#img-1').attr('src', e.target.result);
          }
          
          reader.readAsDataURL(input.files[0]);
          window.imgName = input.files[0].name;
      }

  }

  $("#file").change(function(ret) {
      readURL(this);
      //console.log(window.imgName);
      $("#imgFilme").val(window.imgName);
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
        /* console.log(img); */
      });
  });
  
</script>


