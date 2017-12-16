package org.pack.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("CC")
public class CompteCourant extends Compte {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Double decouvert;

	public Double getDecouvert() {
		return decouvert;
	}

	public void setDecouvert(Double decouvert) {
		this.decouvert = decouvert;
	}
	
	public CompteCourant() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CompteCourant(String codeCompte, Date dateCeation, Double solde, Client client, Double decouvert) {
		super(codeCompte, dateCeation, solde, client);
		this.decouvert = decouvert;
	}
	
}
