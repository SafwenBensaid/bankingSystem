package org.pack.metier;

import java.util.Date;

import org.pack.entities.Client;
import org.pack.entities.Compte;
import org.pack.entities.Operation;
import org.springframework.data.domain.Page;

public interface BankingMetierInterface {
	
	public Client consulterClient(Long codeClient);
	
	public Compte consulterCompte(String codeCompte);

	public Client ajouterClient(String nom, String prenom, int numCin, String dateNaissance, String profession,
			String adresse, Integer telephone, String email);
	
	public void ajouterCompte(long codeClient, String typeCompte, String codeCompte, Date dateCeation, Double solde, Double decouvert, Double taux);

	public void verser(String codeCompte, double montant);

	public void retirer(String codeCompte, double montant);

	public void virer(String codeCompteSource, String codeCompteCible, double montant);

	public Page<Operation> listerOperation(String codeCompte, int numPage, int taillePage);

}
