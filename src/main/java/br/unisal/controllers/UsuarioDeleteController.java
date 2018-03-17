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

@WebServlet(name = "UsuarioDeleteController", description = "Controlador para excluir usuarios", urlPatterns = "/deletarUsuario")

public class UsuarioDeleteController extends HttpServlet{

	/**
	 * @author João Paulo
	 */
	
	private static final UsuarioDAO USUARIO_DAO = UsuarioDAO.getInstance();

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(req.getParameter("id"));
		List<Usuario> usuarios = new ArrayList<>();	
		try {
			usuarios = USUARIO_DAO.findAll();
			USUARIO_DAO.delete(Long.parseLong(req.getParameter("id")));
		
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString());
		}
				
		req.setAttribute("usuarios", usuarios);
		req.getRequestDispatcher(Constantes.raizPages + "inicio.jsp").forward(req, resp);
	}
}