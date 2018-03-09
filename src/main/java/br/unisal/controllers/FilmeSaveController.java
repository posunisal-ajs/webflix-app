package br.unisal.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.unisal.dao.FilmeDAO;
import br.unisal.model.Filme;
import br.unisal.util.Constantes;

@WebServlet(name = "FilmeInsertController", description = "Controlador para inserir filmes", urlPatterns = "/salvarFilme")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,maxFileSize = 1024*1024*10,maxRequestSize = 1024*1024*50)
public class FilmeSaveController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2380365497770693025L;
	
	private static final FilmeDAO FILME_DAO = FilmeDAO.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pathToUpload = getServletContext().getRealPath("/upload");
		
		Filme filme = new Filme(
			req.getParameter("nome"),
			req.getParameter("genero"),
			req.getParameter("lancamento"), 
			req.getParameter("informacoes"), 
			req.getParameter("imgFilme")
		);

		List<Filme> filmes = new ArrayList<>();
		
		try {
			FILME_DAO.insert(filme);
			
			filmes = FILME_DAO.findAll();
		
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString());
		}
        
        //String path = getServletContext().getRealPath("/WEB-INF/upload");
        //System.out.println(path);
        
        //creating the save directory if it doesn't exist
        File uploadDirectory = new File(pathToUpload);
        if(!uploadDirectory.exists()){
            uploadDirectory.mkdirs();
        }
         
        //Iterating the parts received from 'multipart/form-data' request
        for(Part part : req.getParts()){
            //extracting the file name
            String fileName = null;
            String contentDisposition = part.getHeader("content-disposition");
            String[] strgs = contentDisposition.split(";");
            for(String strng : strgs) {
                if(strng.trim().startsWith("filename")){
                    fileName = strng.substring(strng.indexOf("=")+2, strng.length()-1);
                }
            }
            //System.out.println(fileName);
            if (fileName != null) {
            	pathToUpload = pathToUpload+File.separator+fileName;
            	part.write(pathToUpload);
            	break;
            }
        }
				
		req.setAttribute("filmes", filmes);
		req.getRequestDispatcher(Constantes.raizPages + "filme.jsp").forward(req, resp);
	}

}
