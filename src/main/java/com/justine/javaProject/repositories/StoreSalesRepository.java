package com.justine.javaProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.justine.javaProject.models.StoreSales;

@Repository
public interface StoreSalesRepository extends CrudRepository<StoreSales, Long> {
    
    List<StoreSales> findAll();
    List<StoreSales> findById(long id);
    
}

