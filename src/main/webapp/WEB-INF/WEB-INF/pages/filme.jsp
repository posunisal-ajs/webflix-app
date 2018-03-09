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
                      <th class="w20">#</th>
                      <th class="w30">Filme</th>
                      <th class="w20">Imagem</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="u" items="${filmes}">
						<tr id="filme_${u.id}">
							<td>${u.id}</td>
							<td>${u.nome}</td>
							<td><img class="img-table" src="<%=request.getContextPath()%>/upload/${u.uuid}" />
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
<%-- 	<center>
	    <h1>File Upload</h1>
	    <form method="post" action="salvarFilme"
	        enctype="multipart/form-data">
	        <input type="text" placeholder="nome" name="nome" class="form-control" required="required"/>
	        Select file to upload: <input type="file" name="file" size="60" /><br />
	        <br /> <input type="submit" value="Upload" />
	    </form>
	</center> --%>
	</section>
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
</script>


