package br.unisal.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisal.dao.FilmeDAO;
import br.unisal.model.Filme;
import br.unisal.util.Constantes;

@WebServlet(name = "FilmeListController", description = "Controlador para listar filmes", urlPatterns = "/listaFilmes")
public class FilmeListController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2380365497770693025L;

	private static final FilmeDAO FILME_DAO = FilmeDAO.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Filme> filmes = new ArrayList<>();
		
		try {			
			filmes = FILME_DAO.findAll();
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString());
		}

		req.setAttribute("filmes", filmes);
		req.getRequestDispatcher(Constantes.raizPages + "filme.jsp").forward(req, resp);
	}

}
