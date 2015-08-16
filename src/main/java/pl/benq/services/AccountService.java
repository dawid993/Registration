package pl.benq.services;

import pl.benq.model.Account;

public interface AccountService {
	public boolean isAccountNameAvaiable(String accountName);
	public Account insert(Account account);
}
