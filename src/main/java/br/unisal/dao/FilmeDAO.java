package br.unisal.dao;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.unisal.interfaces.DAOInterface;
import br.unisal.model.Filme;
import br.unisal.model.Usuario;
import br.unisal.util.DbUtil;

public class FilmeDAO extends GenericDAO implements DAOInterface<Filme> {
	private static FilmeDAO INSTANCE;

	private FilmeDAO() {
	}

	public static FilmeDAO getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new FilmeDAO();
		}
		return INSTANCE;
	}

	public void delete(Long id) throws ClassNotFoundException, SQLException, IOException {
		String sql = "delete from filme where id = ?";

		PreparedStatement ps = null;
		try {
			ps = getConnectionPool().prepareStatement(sql);
			ps.setLong(1, id);
			ps.execute();
		} finally {
			DbUtil.getInstance().closeQuietly(ps);
		}
	}

	public void update(Filme t, Long id) throws ClassNotFoundException, SQLException, IOException {
		String sql = "update filme set nome = ?, genero = ?, lancamento = ?, informacoes = ?, img = ?  where id = ?";
		PreparedStatement ps = null;
		try {
			System.out.println("ID DO FILME - " + t.getNome());
			ps = getConnectionPool().prepareStatement(sql);
			ps.setLong(6, id);

			ps.setString(1, t.getNome());
			ps.setString(2, t.getGenero());
			ps.setString(3, t.getLancamento());
			ps.setString(4, t.getInformacoes());
			ps.setString(5, t.getImg());

			ps.execute();
		} finally {
			DbUtil.getInstance().closeQuietly(ps);
		}
	}

	public void insert(Filme t) throws ClassNotFoundException, SQLException, IOException {
		String sql = "insert into filme (nome, genero, lancamento, informacoes, img, uuid) values (?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = getConnectionPool().prepareStatement(sql);
			
			ps.setString(1, t.getNome());
			ps.setString(2, t.getGenero());
			ps.setString(3, t.getLancamento());
			ps.setString(4, t.getInformacoes());
			ps.setString(5, t.getImg());
			ps.setString(6, t.getUuid());
			
			ps.execute();
			
		} finally {
			DbUtil.getInstance().closeQuietly(ps);
		}
	}

	public List<Filme> findAll() throws ClassNotFoundException, SQLException, IOException {
		String sql = "select id, nome, genero, lancamento, informacoes, img, uuid from filme";
		List<Filme> filmes = new ArrayList<>();
		
		List<Object[]> objects = executaSqlSemParametro(getConnectionPool(), sql);
		//System.out.println(objects);
		if (objects != null) {
			for (Object[] os : objects) {
				filmes.add(castObjectToModel(os));
			}
		}
		System.out.println(filmes);
		return filmes;
	}

	public Filme findById(Long id) throws ClassNotFoundException, SQLException, IOException {
		String sql = "select id, nome, uuid, img from filme where id = ?";
		Filme filme = null;
 
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = getConnectionPool().prepareStatement(sql);
			ps.setLong(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				filme = new Filme();
				filme.setId(rs.getLong(1));
				filme.setNome(rs.getString(2));
				filme.setGenero(rs.getString(3));
				filme.setLancamento(rs.getString(4));
				filme.setInformacoes(rs.getString(5));
				filme.setImg(rs.getString(6));
				filme.setUuid(rs.getString(7));
			}
		} finally {
			DbUtil.getInstance().closeQuietly(ps, rs);
		}

		return filme;
	}
	
	public boolean checkImg(String img, Long id) throws ClassNotFoundException, SQLException, IOException 
    {	String sql = "select uuid from filme where img=? and id = ?";
    	 Filme filme = null;
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		 DbUtil.getInstance().closeQuietly(ps, rs);
     	try {
     		ps = getConnectionPool().prepareStatement(sql);
	        ps.setString(1, img);
	        ps.setLong(2, id);
	        rs = ps.executeQuery();
	        
	        while (rs.next()) {
				filme = new Filme();
				filme.setUuid(rs.getString(1));
			}
		} catch(Exception erro) {
			System.out.println("Erro ocorrido: n" + erro);
		} finally {
			DbUtil.getInstance().closeQuietly(ps, rs);
		}
		if (filme != null) {
			return true;
		} else {
			return false;
		}                 
	}

	private Filme castObjectToModel(Object[] obj) {
		Filme filme = new Filme();
		filme.setId((Long) obj[0]);
		filme.setNome((String) obj[1]);
		filme.setGenero((String) obj[2]);
		filme.setLancamento((String) obj[3]);
		filme.setInformacoes((String) obj[4]);
		filme.setImg((String) obj[5]);
		filme.setUuid((String) obj[6]);
		return filme;
	}

	@Override
	public void update(Filme t) throws ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		
	}
}
