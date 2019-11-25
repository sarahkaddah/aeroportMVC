package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import reservationSpring.model.ClientMoral;


@Controller
public class MenuController {

	@RequestMapping("/accueil")
	public String menu(Model model) {
		model.addAttribute("client", "User");
		return "accueil/menu";
	}
}
