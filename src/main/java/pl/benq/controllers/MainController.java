package pl.benq.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.benq.model.Account;

@Controller
public class MainController {

	@RequestMapping("/")
	public String main()
	{
		return "mainPage";
	}
	
}
