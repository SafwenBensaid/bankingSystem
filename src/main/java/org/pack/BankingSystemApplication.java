package org.pack;

import java.util.Date;

import org.pack.dao.ClientRepository;
import org.pack.dao.CompteRepository;
import org.pack.dao.OperationRepository;
import org.pack.entities.*;
import org.pack.metier.BankingMetierInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.domain.Page;

@SpringBootApplication
public class BankingSystemApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(BankingSystemApplication.class, args);
	}

	@Autowired
	private ClientRepository clientRepository;
	@Autowired
	private CompteRepository compteRepository;
	@Autowired
	private OperationRepository operationRepository;
	@Autowired
	private BankingMetierInterface bankingMetierInterface;

	@Override
	public void run(String... args) throws Exception {
		Client c1 = clientRepository.save(
				new Client("omar", "said", 012345611, "05-01-1987", "professeur", "Bizerte", 58642987, "said@gmail.com"));
		Client c2 = clientRepository.save(
				new Client("ahmed", "ali", 012314611, "02-12-1990", "avocat", "Sousse", 22541778, "ahmed@gmail.com"));

		Compte cp1 = compteRepository.save(new CompteCourant("c1", new Date(), 10000.00, c1, 1000.00));
		Compte cp2 = compteRepository.save(new CompteEpargne("c2", new Date(), 7000.00, c2, 3000.00));

		operationRepository.save(new Versement(new Date(), 7500.00, cp1));
		operationRepository.save(new Retrait(new Date(), 1200.00, cp2));

		bankingMetierInterface.verser("c1", 1000);
		bankingMetierInterface.retirer("c2", 1000);
		bankingMetierInterface.virer("c1", "c2", 2000);

		System.out.println("***********************************************");
		Page<Operation> p = bankingMetierInterface.listerOperation("c1", 0, 10);
		System.out.println("*************************" + p.getContent() + "**********************");
		for (Operation o : p) {
			System.out.println(o.getCompte().getCodeCompte() + "       " + o.getMontant() + "       "
					+ o.getDateOperation() + "       " + o.getCodeOperation() + "       " + o.getClass().getSimpleName());
		}
	}
}