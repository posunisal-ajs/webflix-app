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
            <!-- Swiper -->
              <h2 class="pb-4">Filmes em destaque</h2>
              <form action="listaFilmes" method="post">
              	<button class="btn btn-success pull-right mb-4" data-target="#modalAdd" data-toggle="modal">Gerenciar filmes <i class="fa fa-film ml-1" ></i></button>
              </form>
			  <div class="swiper-container bg-gray">
			    <div class="swiper-wrapper">
			    	<c:forEach var="f" items="${filmes}">
						<div class="swiper-slide bg-gray">
							<div class="title-swiper"><h3>${f.nome}</h3></div>
							<a class="actOpenDetalhes a__img--banner" data-item="${f.id}" data-target="#modalDetalhes" data-toggle="modal"><img class="img-swiper" data-item="${f.id}" src="<%=request.getContextPath()%>/upload/${f.img}" /></a>
						</div>
				  	</c:forEach>
			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			     <div class="swiper-button-next"></div>
    			 <div class="swiper-button-prev"></div>
			    
			  </div>
          </div>
        </div>            
      </div> 
    </div>
	</section>
	<section class="fdb-block">
		<div class="container">
			<div class="row justify-content-center">
				<c:forEach var="f" items="${filmes}">
		   			<div class="col-12 col-sm-10 col-md-6 m-0 mt-4 col-lg-4 text-center pt-4 pt-lg-0">
				       <div class="bg-gray pb-3 pt-4 pl-4 pr-4 br">
				      	 <div class="fwdId d-none" data-item="${f.id}">${f.id}</div>
				         <div class="fwdNome" data-item="${f.id}"><h3><strong>${f.nome}</strong></h3></div>
				         <div class="mb-2 div-box-height fwdNome" data-item="${f.id}"><img class="img-box-filmes" data-item="${f.id}" src="<%=request.getContextPath()%>/upload/${f.img}" /></div>
				         <div class="fwdGenero" data-item="${f.id}">${f.genero}</div>
						 <div class="fwdLancamento d-none" data-item="${f.id}">${f.lancamento}</div>
						 <div class="fwdInformacoes d-none" data-item="${f.id}">${f.informacoes}</div>
						 <span class="fwdImgName d-none" data-item="${f.id}">${f.img}</span>	
						 <img class="fwdImageTable d-none" data-item="${f.id}" src="<%=request.getContextPath()%>/upload/${f.img}" />
						
				         <p class="text-h4"></p>
				         <p class="text-h3 mt-1"><strong></strong><span class="text-h3"></span></p>
				         <hr>
				         <p class="text-center pt-1"><button class="btn btn-personalised actOpenDetalhes" data-item="${f.id}" data-target="#modalDetalhes" data-toggle="modal">Detalhes<i class="fa fa-plus ml-2"></i></button></p>
				       </div>
				     </div>
				</c:forEach>
	      	</div>
	    </div>
	</section>
</div>
 <!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button> -->

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

<!-- Modal Error -->
<div class="modal fade" id="modalError" tabindex="-1" role="dialog" aria-labelledby="modalError" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="div--modal__excluir"><h5 class="modal-title">Erro ao processar a requisição.</h5></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
            <div>
            	<span class="error-gen">
	     	 <%
		        if (request.getAttribute("error") != null) {%>
		        <%= request.getAttribute("error")%>
		        <%}
		     %>
            	</span>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
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
        
        console.log(idItem); 
      });
  });
  
  var swiper = new Swiper('.swiper-container', {
    pagination: {
      el: '.swiper-pagination',
      dynamicBullets: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
  
</script>

<%
   if (request.getAttribute("error") != null) {%>
   <button class="btn btn-icon icon-2 d-none fwdErrorOpen" data-item="${u.id}" data-target="#modalError" data-toggle="modal"><i class="fa fa-plus" ></i></button>
   <script>
		$(document).ready(function(){
			$(".fwdErrorOpen").trigger("click");
		});
   </script>
   
   <%}
%>


