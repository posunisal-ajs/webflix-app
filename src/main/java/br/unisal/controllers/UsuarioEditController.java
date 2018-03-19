package br.unisal.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
	
	private static final UsuarioDAO USUARIO_DAO = UsuarioDAO.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		Usuario usuario = new Usuario(
			req.getParameter("nome"),
			req.getParameter("email"),
			req.getParameter("login"), 
			req.getParameter("senha")
		);
		String senha = req.getParameter("senhaAtual");
		String senhaConfirmar = req.getParameter("senhaNova");
		
		boolean ctrlSenha = false;
		boolean ctrlEditSenha = false;
		boolean ctrlEmail = false;
		List<Usuario> usuarios = new ArrayList<>();
		req.setAttribute("error", null);
		try {
			if (req.getParameter("email") != "") {
				boolean vEmail = USUARIO_DAO.checkEmail(req.getParameter("email"), Long.parseLong(req.getParameter("id")));
				if (!vEmail) {
					ctrlEmail = true;
				} else {
					req.setAttribute("error", "E-mail já existente na base de dados.");
				}
			}
			if (senha != null && senha != "") {
				if (senhaConfirmar != "" && senhaConfirmar.equals(req.getParameter("senha"))) {
					boolean vPass = USUARIO_DAO.checkPassword(senha, Long.parseLong(req.getParameter("id")));
					System.out.println("VPASS = " + vPass);
					if (vPass) {
						ctrlSenha = true;
						ctrlEditSenha = true;
						req.setAttribute("error", null);
					} else {
						req.setAttribute("error", "Senha atual incorreta.");
					}
				} else {
					req.setAttribute("error", "As senhas não coincidem.");
				}
			} else if ((senhaConfirmar != "" || req.getParameter("senha") != "") && senha == "") {
				req.setAttribute("error", "Para alterar a senha é necessário digitar a senha atual.");
			} 
			else {
				ctrlSenha = true;
			}
			if (ctrlSenha && ctrlEmail) {
				USUARIO_DAO.update(usuario, Long.parseLong(req.getParameter("id")), ctrlEditSenha);
			}
			usuarios = USUARIO_DAO.findAll();
		
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString());
		}
		
		req.setAttribute("usuarios", usuarios);
		req.getRequestDispatcher(Constantes.raizPages + "inicio.jsp").forward(req, resp);
	}

}
