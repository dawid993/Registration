package pl.benq.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.benq.model.Account;
import pl.benq.services.AccountService;

@Controller
public class RegisterController {

	@Autowired
	private AccountService accountService;
	
	@RequestMapping("/registration")
	public String registration(Model model)
	{
		model.addAttribute("account", new Account());
		return "registrationForm";
	}
	
	@RequestMapping("/avaiable/{name}")
	public @ResponseBody boolean isAccountNameAvaiable(@PathVariable("name")String accountName)
	{
		return accountService.isAccountNameAvaiable(accountName);
	}
	
	@RequestMapping("/register")
	public String register(@ModelAttribute("account") Account account)
	{
		if(!accountService.isAccountNameAvaiable(account.getAccountName()))
			return "registrationError";
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
		String plainPassword = account.getPassword();
		account.setPassword(encoder.encode(plainPassword));
		account.setEnabled(1);
		
		accountService.insert(account);		
		return "mainPage";
	}
}
