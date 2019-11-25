package controller;

import java.util.Optional;
import javax.jws.WebParam.Mode;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import reservationSpring.model.Client;
import reservationSpring.model.ClientEI;
import reservationSpring.model.ClientMoral;
import reservationSpring.model.ClientPhysique;
import reservationSpring.model.Titre;
import reservationSpring.repository.ClientRepository;

@Controller
@RequestMapping("/client")
public class ClientController {
	
	@Autowired
	private ClientRepository clientRepository;
	
	@GetMapping("/listClients")
	public String listClients (Model model) {
		model.addAttribute("clients", clientRepository.findAll());
		return "client/listClients";
	}
	
	@GetMapping("/deleteClients")
	public String deleteClients(@RequestParam(name="id", required = true) Long id) {
		clientRepository.deleteById(id);
		return "redirect:/client/listClients";
	}

	private String goEdit(Client client, Model model) {
		model.addAttribute("client", client);
		model.addAttribute("titres",Titre.values());
//		model.addAttribute("salles", salleRepository.findAll());
		return "client/editClients";
	}

	@GetMapping("/editClients")
	public String editClients(@RequestParam(name="id", required = true) Long id, Model model) {
		Optional<Client> opt = clientRepository.findById(id);
		Client c = null;
		if(opt.isPresent()) {
			c = opt.get();
		}else {
			c = new ClientPhysique();
		}
		model.addAttribute("client", c);
		return goEdit(c, model);
	}

	public String save(Client client, BindingResult br, Model model) {
		if(br.hasErrors()) {
			return goEdit(client, model);
		}
//		if(personne.getSalle()!=null && personne.getSalle().getId()==null) {
//		personne.setSalle(null);
//	}
		clientRepository.save(client);
		return "redirect:/client/listClients";
	}
	
	@PostMapping("/saveClientEI")
	public String saveClientEI(@Valid @ModelAttribute("client") ClientEI clientEI, BindingResult br, Model model) {
		return save(clientEI, br, model);
	}
	
	@PostMapping("/saveClientMoral")
	public String saveClientMoral(@Valid @ModelAttribute("client") ClientMoral clientMoral, BindingResult br, Model model) {
		return save(clientMoral, br, model);
	}
	
	@PostMapping("/saveClientPhysique")
	public String saveClientPhysique(@Valid @ModelAttribute("client") ClientPhysique clientPhysique, BindingResult br, Model model) {
		return save(clientPhysique, br, model);
	}

	@GetMapping("/addClientEI")
	public String addClientEI(Model model) {
		return goEdit(new ClientEI(), model);
	}
	
	@GetMapping("/addClientMoral")
	public String addClientMoral(Model model) {
		return goEdit(new ClientMoral(), model);
	}
	
	@GetMapping("/addClientPhysique")
	public String addClientPhysique(Model model) {
		return goEdit(new ClientPhysique(), model);
	}
}
