package com.justine.javaProject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.justine.javaProject.models.userCart;

@Repository
public interface userCartRepository extends CrudRepository<userCart, Long> {
    
    List<userCart> findAll();
    Optional<userCart> findAllById(Long id);
}
