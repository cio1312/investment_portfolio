package org.com.cio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface customerdao extends JpaRepository<Customer,Integer>{

	Customer findByPolicynumber(String policynumber);
	
	List<Customer> findAll();

	@Query("FROM Customer WHERE policynumber= ?1  AND firstname LIKE ?2%  AND lastname LIKE ?3%")
    List<Customer> findByCustomeridAndFirstnameAndLastname(String policynumber, String firstname,String lastname);

}