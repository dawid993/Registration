package pl.benq.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.benq.model.Account;

public interface AccountRepository extends JpaRepository<Account, Long> 
{

}
