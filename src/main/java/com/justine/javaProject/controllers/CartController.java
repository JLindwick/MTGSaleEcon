package com.justine.javaProject.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.justine.javaProject.models.StoreSales;
import com.justine.javaProject.models.User;
import com.justine.javaProject.models.userCart;
import com.justine.javaProject.services.StoreSalesService;
import com.justine.javaProject.services.UserService;
import com.justine.javaProject.services.userCartService;

@Controller
public class CartController {
    @Autowired
    private UserService userService;
    
    @Autowired
    private userCartService userCart;
    
    @Autowired
    private StoreSalesService salesServ;
    @GetMapping("/addToCart/{id}")
    public String addToCart(@PathVariable Long id,HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if(userId != null) {
        StoreSales item = salesServ.findSale(id);
        userCart cartItem = new userCart();
        User user = userService.findById(userId);
        cartItem.setUser(user);
        cartItem.setSales(item);
        cartItem.setCardName(item.getCardName());
        cartItem.setCardCondition(item.getCardCondition());
        cartItem.setCardPrice(item.getCardPrice());
        List<StoreSales> sale = salesServ.allSales();
        if(sale !=null) {
            System.out.println("test");
        model.addAttribute("allSales",sale);
        }
        userCart.createCartItem(cartItem);
        
        return "ViewProduct.jsp";
        } else {
            return "index.jsp";
        }
    }
    @GetMapping("/viewCart/{id}")
    public String viewCart(HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        userCart cartItem = userCart.findCartItem(userId);
        if(cartItem != null) {
            model.addAttribute("cart",cartItem);
            return "BuyProduct.jsp";
        } else {
            return "redirect:/";
        }
        
    }

}
