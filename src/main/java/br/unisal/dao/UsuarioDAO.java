package br.unisal.dao;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.unisal.interfaces.DAOInterface;
import br.unisal.model.Usuario;
import br.unisal.util.DbUtil;

public class UsuarioDAO extends GenericDAO implements DAOInterface<Usuario> {
	private static UsuarioDAO INSTANCE;

	public static UsuarioDAO getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new UsuarioDAO();
		}
		return INSTANCE;
	}

	public void delete(Long id) throws ClassNotFoundException, SQLException, IOException {
		String sql = "delete from usuario where id = ?";

		PreparedStatement ps = null;
		try {
			ps = getConnectionPool().prepareStatement(sql);
			ps.setLong(1, id);
			ps.execute();
		} finally {
			DbUtil.getInstance().closeQuietly(ps);
		}
	}

	public void update(Usuario t, Long id) throws ClassNotFoundException, SQLException, IOException {
		String sql = "update usuario set nome = ?, email = ?, login = ?, senha = ? from usuario where id = ?";
		PreparedStatement ps = null;
		try {
			ps = getConnectionPool().prepareStatement(sql);
			ps.setLong(5, id);

			ps.setString(1, t.getNome());
			ps.setString(2, t.getEmail());
			ps.setString(3, t.getLogin());
			ps.setString(4, t.getSenha());

			ps.execute();
		} finally {
			DbUtil.getInstance().closeQuietly(ps);
		}
	}

	public void insert(Usuario t) throws ClassNotFoundException, SQLException, IOException {
		String sql = "insert into usuario (nome, email, login, senha, uuid) values (?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = getConnectionPool().prepareStatement(sql);
			
			ps.setString(1, t.getNome());
			ps.setString(2, t.getEmail());
			ps.setString(3, t.getLogin());
			ps.setString(4, t.getSenha());
			ps.setString(5, t.getUuid());
			
			ps.execute();
			
		} finally {
			DbUtil.getInstance().closeQuietly(ps);
		}
	}

	public List<Usuario> findAll() throws ClassNotFoundException, SQLException, IOException {
		String sql = "select id, nome, email, login, senha, uuid from usuario";
		List<Usuario> usuarios = new ArrayList<>();

		List<Object[]> objects = executaSqlSemParametro(getConnectionPool(), sql);
		if (objects != null) {
			for (Object[] os : objects) {
				usuarios.add(castObjectToModel(os));
			}
		}

		return usuarios;
	}

	public Usuario findById(Long id) throws ClassNotFoundException, SQLException, IOException {
		String sql = "select id, nome, email, login, senha, uuid from usuario where id = ?";
		Usuario usuario = null;

		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = getConnectionPool().prepareStatement(sql);
			ps.setLong(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getLong(1));
				usuario.setNome(rs.getString(2));
				usuario.setEmail(rs.getString(3));
				usuario.setLogin(rs.getString(4));
				usuario.setSenha(rs.getString(5));
				usuario.setUuid(rs.getString(6));
			}
		} finally { 
			DbUtil.getInstance().closeQuietly(ps, rs);
		}

		return usuario;
	}
	
	public boolean checkUser(String email, String pass) throws ClassNotFoundException, SQLException, IOException 
    {	String sql = "select id, nome from usuario where email=? and senha=?";
    	 Usuario usuario = null;
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		 DbUtil.getInstance().closeQuietly(ps, rs);
     	try {
     		ps = getConnectionPool().prepareStatement(sql);
	        ps.setString(1, email);
	        ps.setString(2, pass);
	        rs = ps.executeQuery();
	        
	        while (rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getLong(1));
				usuario.setNome(rs.getString(2));
			}
		} catch(Exception erro) {
			System.out.println("Erro ocorrido: n" + erro);
		} finally {
			DbUtil.getInstance().closeQuietly(ps, rs);
		}
		if (usuario != null) {
			return true;
		} else {
			return false;
		}                 
	 }   

	private Usuario castObjectToModel(Object[] obj) {
		Usuario usuario = new Usuario();
		usuario.setId((Long) obj[0]);
		usuario.setNome((String) obj[1]);
		usuario.setEmail((String) obj[2]);
		usuario.setLogin((String) obj[3]);
		usuario.setSenha((String) obj[4]);
		usuario.setUuid((String) obj[5]);
		return usuario;
	}

	@Override
	public void update(Usuario t) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		
	}
}
