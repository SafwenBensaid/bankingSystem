package org.pack.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("CE")
public class CompteEpargne extends Compte {
 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private Double taux;

public CompteEpargne() {
	super();
	// TODO Auto-generated constructor stub
}

public CompteEpargne(String codeCompte, Date dateCeation, Double solde, Client client, Double taux) {
	super(codeCompte, dateCeation, solde, client);
	this.taux = taux;
}

public Double getTaux() {
	return taux;
}

public void setTaux(Double taux) {
	this.taux = taux;
}
 
}
