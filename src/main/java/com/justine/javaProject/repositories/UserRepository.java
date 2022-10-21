package com.justine.javaProject.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.justine.javaProject.models.User;
   
	@Repository
	public interface UserRepository extends CrudRepository<User, Long> {
	    
	    Optional<User> findByEmail(String email);
	    
	}


