package org.pack.web;

import java.util.Date;

import org.pack.entities.Client;
import org.pack.entities.Compte;
import org.pack.entities.Operation;
import org.pack.metier.BankingMetierInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BankingController {
	@Autowired
	private BankingMetierInterface bankingMetierInterface;

	@RequestMapping("/clients")
	public String clients() {
		return "clients";
	}

	@RequestMapping("/comptes")
	public String comptes() {
		return "comptes";
	}

	@RequestMapping("/operations")
	public String operations() {
		return "operations";
	}

	@RequestMapping("/consulterClient")
	public String consulterClient(Long codeClient, Model model) {
		model.addAttribute("codeClient", codeClient);
		try {
			if (codeClient==0) codeClient=(long) 1;
			Client cl = bankingMetierInterface.consulterClient(codeClient);
			model.addAttribute("client", cl);
		} catch (Exception exeptionClient) {
			model.addAttribute("exeptionClient", exeptionClient);
		}
		return "operations";
	}
	
	@RequestMapping("/consulterCompte")
	public String consulter(String codeCompte, Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "4") int size) {
		model.addAttribute("codeCompte", codeCompte);
		try {
			Compte cp = bankingMetierInterface.consulterCompte(codeCompte);
			Page<Operation> pageOperations = bankingMetierInterface.listerOperation(codeCompte, page, size);
			int[] pages = new int[pageOperations.getTotalPages()];
			model.addAttribute("pages", pages);
			model.addAttribute("compte", cp);
			model.addAttribute("listeOperations", pageOperations.getContent());
		} catch (Exception exeptionCompte) {
			model.addAttribute("exeptionCompte", exeptionCompte);
		}
		return "operations";
	}

	@RequestMapping(value = "/saveClient", method = RequestMethod.POST)
	public String saveClient(String nom, String prenom, int numCin, String dateNaissance, String profession,
			String adresse, Integer telephone, String email, Model model) {
		try {
			Client client=bankingMetierInterface.ajouterClient(nom, prenom, numCin, dateNaissance, profession, adresse, telephone,
					email);
			model.addAttribute("client", client);
		} catch (Exception exeptionClient) {
			model.addAttribute("exeptionClient", exeptionClient);
		}
		return "Comptes";
	}

	@RequestMapping(value = "/saveCompte", method = RequestMethod.POST)
	public String saveCompte(long codeClient, String typeCompte, String codeCompte, Double solde,
			Double decouvert, Double taux, Model model) {
		try {
			bankingMetierInterface.ajouterCompte(codeClient, typeCompte, codeCompte, new Date(), solde, decouvert, taux);
		} catch (Exception exeptionClient) {
			model.addAttribute("exeptionClient", exeptionClient);
		}
		return "operations";
	}
	@RequestMapping(value = "/saveOperation", method = RequestMethod.POST)
	public String saveOperation(String typeOperation, String codeCompte, double montant, String compteCible,
			Model model) {
		try {
			if (typeOperation.equals("VER")) {
				bankingMetierInterface.verser(codeCompte, montant);
			} else if (typeOperation.equals("RET")) {
				bankingMetierInterface.retirer(codeCompte, montant);
			} else if (typeOperation.equals("VIR")) {
				bankingMetierInterface.virer(codeCompte, compteCible, montant);
			}
			return "redirect:/consulterCompte?codeCompte=" + codeCompte;
		} catch (Exception exeptionOperation) {
			return "redirect:/consulterCompte?codeCompte=" + codeCompte + "&exeption=" + exeptionOperation.getMessage();
		}
	}
}
