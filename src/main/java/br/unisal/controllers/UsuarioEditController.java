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
import br.unisal.dao.UsuarioDAO;
import br.unisal.model.Usuario;
import br.unisal.util.Constantes;

@WebServlet(name = "UsuarioEditController", description = "Controlador para inserir filmes", urlPatterns = "/editarUsuario")

public class UsuarioEditController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * @author Alex R Ribeiro
	 */
	
	private static final UsuarioDAO USUARIO_DAO = UsuarioDAO.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		Usuario usuario = new Usuario(
			req.getParameter("nome"),
			req.getParameter("email"),
			req.getParameter("login"), 
			req.getParameter("senha")
		);

		List<Usuario> usuarios = new ArrayList<>();
		
		try {
			USUARIO_DAO.update(usuario, Long.parseLong(req.getParameter("id")));
			
			usuarios = USUARIO_DAO.findAll();
		
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString());
		}
				
		req.setAttribute("usuarios", usuarios);
		req.getRequestDispatcher(Constantes.raizPages + "usuario.jsp").forward(req, resp);
	}

}
