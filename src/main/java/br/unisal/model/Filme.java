package br.unisal.model;

import br.unisal.util.GsonSingleton;
import br.unisal.util.Util;

public class Filme {

	private Long id;
	private String nome;
	private String genero;
	private String lancamento;
	private String informacoes;
	private String img;
	private String uuid;

	public Filme() {
		this.uuid = Util.UUIDGenerate();
	}

	/**
	 * @param nome
	 * @param img
	 */
	public Filme(String nome, String genero, String lancamento, String informacoes, String img) {
		super();
		this.nome = nome;
		this.genero = genero;
		this.lancamento = lancamento;
		this.informacoes = informacoes;
		this.img = img;
		this.uuid = Util.UUIDGenerate();
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome
	 *            the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	/**
	 * @return the genero
	 */
	public String getGenero() {
		return genero;
	}

	/**
	 * @param genero
	 *            the genero to set
	 */
	public void setGenero(String genero) {
		this.genero = genero;
	}

	/**
	 * @return the no
	 */
	public String getLancamento() {
		return lancamento;
	}

	/**
	 * @param nome
	 *            the nome to set
	 */
	public void setLancamento(String lancamento) {
		this.lancamento = lancamento;
	}
	/**
	 * @return the nome
	 */
	public String getInformacoes() {
		return informacoes;
	}

	/**
	 * @param nome
	 *            the nome to set
	 */
	public void setInformacoes(String informacoes) {
		this.informacoes = informacoes;
	}

	/**
	 * @return the img
	 */
	public String getImg() {
		return img;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setImg(String img) {
		this.img = img;
	}

	/**
	 * @return the uuid
	 */
	public String getUuid() {
		return uuid;
	}
	
	/**
	 * @param uuid the uuid to set
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return GsonSingleton.getInstance().toJson(this);
	}

}
