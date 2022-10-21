package com.justine.javaProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justine.javaProject.models.userCart;
import com.justine.javaProject.repositories.userCartRepository;

@Service
public class userCartService {


@Autowired
private userCartRepository cartRepo;

public userCartService(userCartRepository cartRepo) {
    this.cartRepo = cartRepo;
}

public List<userCart> allCarts(){
    return cartRepo.findAll();
    
}
public userCart createCartItem(userCart cart) {
    return cartRepo.save(cart);
}
public userCart findCartItem(Long id) {
    Optional<userCart> optionalCart = cartRepo.findAllById(id);
    if(optionalCart.isPresent()) {
        return optionalCart.get();
    } else {
        return null;
    }
}

public userCart updateCart(userCart cart) {
    return cartRepo.save(cart);
}
public void deleteCartItem(Long id) {
    Optional<userCart> optionalSale = cartRepo.findById(id);
    if(optionalSale.isPresent()) {
        cartRepo.deleteById(id);
    }
}

public userCartRepository getCartRepo() {
    return cartRepo;
}

public void setCartRepo(userCartRepository cartRepo) {
    this.cartRepo = cartRepo;
}
}