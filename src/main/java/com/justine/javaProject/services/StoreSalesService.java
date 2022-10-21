package com.justine.javaProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justine.javaProject.models.StoreSales;
import com.justine.javaProject.repositories.StoreSalesRepository;

@Service
public class StoreSalesService {
    @Autowired
    private StoreSalesRepository salesRepo;
    
        public StoreSalesService(StoreSalesRepository salesRepo) {
            this.salesRepo = salesRepo;
        }

        public List<StoreSales> allSales(){
            return salesRepo.findAll();
            
        }
        public StoreSales createSale(StoreSales sale) {
            return salesRepo.save(sale);
        }
        public StoreSales findSale(Long id) {
            Optional<StoreSales> optionalStore = salesRepo.findById(id);
            if(optionalStore.isPresent()) {
                return optionalStore.get();
            } else {
                return null;
            }
        }
        
        public StoreSales updateSale(StoreSales sale) {
            return salesRepo.save(sale);
        }
        public void deleteSale(Long id) {
            Optional<StoreSales> optionalSale = salesRepo.findById(id);
            if(optionalSale.isPresent()) {
                salesRepo.deleteById(id);
            }
        }

        public StoreSalesRepository getSalesRepo() {
            return salesRepo;
        }

        public void setSalesRepo(StoreSalesRepository salesRepo) {
            this.salesRepo = salesRepo;
        }

    }

