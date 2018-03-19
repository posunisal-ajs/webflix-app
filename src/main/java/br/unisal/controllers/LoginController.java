package br.unisal.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.unisal.dao.FilmeDAO;
import br.unisal.dao.UsuarioDAO;
import br.unisal.model.Filme;
import br.unisal.util.Constantes;

@WebServlet(name = "LoginController", description = "Controlador para efetivar o login", urlPatterns = "/login")
public class LoginController extends HttpServlet {

	/**
	 * 
	 */
	private static final UsuarioDAO USUARIO_DAO = UsuarioDAO.getInstance();
	private static final FilmeDAO FILME_DAO = FilmeDAO.getInstance();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
/*		System.out.println("EMAIL: "+email);
		System.out.println("SENHA: "+pass);*/
		
		List<Filme> filmes = new ArrayList<>();
		boolean resultado = false;
		try {
			resultado = USUARIO_DAO.checkUser(email, pass);
			if (resultado) {
				filmes = FILME_DAO.findAll();
				req.setAttribute("filmes", filmes);
				req.setAttribute("email", email);
				req.getRequestDispatcher(Constantes.raizPages + "filme-inicio.jsp").forward(req, resp);
			} else {
				//System.out.println("ENTROU ERRO");
				out.println("<span class='error-login'>Email ou senha incorretos! Revise seus dados.</span>");
	           RequestDispatcher rs = req.getRequestDispatcher("");
	           rs.include(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//passa o parametro e recebe a resposta
		
	}

}
