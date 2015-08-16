package pl.benq.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.benq.model.Account;
import pl.benq.repositories.AccountRepository;

@Service
@Transactional
public class AccountServiceImp implements AccountService
{
	@Autowired
	private AccountRepository accountRepository;
	
	@Override
	public boolean isAccountNameAvaiable(String accountName) {
		int countedAccount = accountRepository.countByAccountName(accountName);
		if(countedAccount !=0)
			return false;
		return true;
	}

	@Override
	public Account insert(Account account) {
		return accountRepository.save(account);		
	}
	
}
