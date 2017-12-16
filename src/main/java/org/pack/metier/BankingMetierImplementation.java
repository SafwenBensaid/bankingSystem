package org.pack.metier;

import java.util.Date;

import org.pack.dao.ClientRepository;
import org.pack.dao.CompteRepository;
import org.pack.dao.OperationRepository;
import org.pack.entities.Client;
import org.pack.entities.Compte;
import org.pack.entities.CompteCourant;
import org.pack.entities.CompteEpargne;
import org.pack.entities.Operation;
import org.pack.entities.Retrait;
import org.pack.entities.Versement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BankingMetierImplementation implements BankingMetierInterface {
	@Autowired
	private ClientRepository clientRepository;
	@Autowired
	private CompteRepository compteRepository;
	@Autowired
	private OperationRepository operationRepository;

	@Override
	public Client consulterClient(Long codeClient) {
		Client cl = clientRepository.findOne(codeClient);
		if (cl == null)
			throw new RuntimeException("Client introuvable: " + codeClient);
		return cl;
	}

	@Override
	public Compte consulterCompte(String codeCompte) {
		Compte cp = compteRepository.findOne(codeCompte);
		if (cp == null)
			throw new RuntimeException("Compte introuvable: " + codeCompte);
		return cp;
	}

	@Override
	public void verser(String codeCompte, double montant) {
		Compte cp = consulterCompte(codeCompte);
		cp.setSolde(cp.getSolde() + montant);
		compteRepository.save(cp);
		Versement v = new Versement(new Date(), montant, cp);
		operationRepository.save(v);
	}

	@Override
	public void retirer(String codeCompte, double montant) {
		Compte cp = consulterCompte(codeCompte);
		double facilitesDeCaisse = 0;
		if (cp instanceof CompteCourant)
			facilitesDeCaisse = ((CompteCourant) cp).getDecouvert();
		if (montant > cp.getSolde() + facilitesDeCaisse)
			throw new RuntimeException(
					"Solde insuffisant pour le compte " + codeCompte + "! Retrait impossible de: " + montant);
		cp.setSolde(cp.getSolde() - montant);
		compteRepository.save(cp);
		Retrait r = new Retrait(new Date(), montant, cp);
		operationRepository.save(r);
	}

	@Override
	public void virer(String codeCompteSource, String codeCompteCible, double montant) {
		if (codeCompteSource.equals(codeCompteCible))
			throw new RuntimeException("Impossible d'effectuer un virement sur le meme compte!");
		retirer(codeCompteSource, montant);
		verser(codeCompteCible, montant);

	}

	@Override
	public Page<Operation> listerOperation(String codeCompte, int page, int size) {
		return operationRepository.listerOperationsParCompte(codeCompte, new PageRequest(page, size));
	}

	@Override
	public Client ajouterClient(String nom, String prenom, int numCin, String dateNaissance, String profession,
			String adresse, Integer telephone, String email) {
		Client cl=clientRepository.save(new Client(nom, prenom, numCin, dateNaissance, profession, adresse, telephone, email));
		return cl;
	}

	@Override
	public void ajouterCompte(long codeClient, String typeCompte, String codeCompte, Date dateCeation, Double solde,
			Double decouvert, Double taux) {
		Client client=consulterClient(codeClient);
		if (typeCompte.equals("CompteCourant")) {
			compteRepository.save(new CompteCourant(codeCompte, dateCeation, solde, client, decouvert));
		} else if (typeCompte.equals("CompteEpargne")) {
			compteRepository.save(new CompteEpargne(codeCompte, dateCeation, solde, client, taux));
		}
	}

}
