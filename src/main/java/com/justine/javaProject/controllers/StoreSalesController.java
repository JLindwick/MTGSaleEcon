package com.justine.javaProject.controllers;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.justine.javaProject.models.StoreSales;
import com.justine.javaProject.models.User;
import com.justine.javaProject.models.userCart;
import com.justine.javaProject.services.StoreSalesService;
import com.justine.javaProject.services.UserService;
import com.justine.javaProject.services.userCartService;

@Controller
public class StoreSalesController {
    @Autowired
    private UserService userServ;
    
    @Autowired
    private StoreSalesService saleServ;
    
    @Autowired
    private userCartService cartServ;
    @GetMapping("/buy")
    public String buy(Model model,HttpSession session) {
        if(session.getAttribute("userId") != null) {
            return "ViewProduct.jsp";
        }
        return "redirect:/";
    }
    
    @GetMapping("/sell")
    public String sell(Model model,HttpSession session) {
        return "SellProduct.jsp";
    }
    
    @GetMapping("/view")
    public String search(Model model) {
        return "ViewCard.jsp";
    }
    @PostMapping("/addToStore")
    public String addToStore(Double cardPrice, String cardCondition, String cardName) {
        System.out.println(cardPrice);
        System.out.println(cardCondition);
        System.out.println(cardName);
        StoreSales sales = new StoreSales();
        sales.setCardCondition(cardCondition);
        sales.setCardPrice(cardPrice);
        sales.setCardName(cardName);
        saleServ.createSale(sales);
        return "redirect:/viewProduct";
    }
    @GetMapping("/viewProduct")
    public String getProductsList(HttpSession session,Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if(userId != null) {
            User myUser = userServ.findById(userId);
            model.addAttribute(myUser);
        }
        List<StoreSales> sale = saleServ.allSales();

        if(sale != null) {
        model.addAttribute("allSales",sale);
        return "ViewProduct.jsp";
        } else {
            return "redirect:/";
        }
       
    }
    @GetMapping("/viewCart")
    public String getCart(HttpSession session,Model model) {
        Long userId = (Long) session.getAttribute("userId");
        List<userCart> cart = cartServ.allCarts();
        Double price = 0.0;
        ArrayList<userCart> allCarts = new ArrayList<userCart>();
        
        for(int i=0;i<cart.size();i++) {
            if(cart.get(i).getUser().getId() == userId) {
                allCarts.add(cart.get(i));
                price += cart.get(i).getCardPrice();
            }
            System.out.println(cart.get(i));
        }
        System.out.println(allCarts.size());
        model.addAttribute("cart",allCarts);
        model.addAttribute("total",price);
        return "BuyProduct.jsp";
    }
    @PostMapping("/search")
    public String search(@Valid @ModelAttribute("search") String cardName, 
            BindingResult result, Model model, HttpSession session) throws IOException {

        if(cardName.contains(" ")) {
            cardName = cardName.replaceAll(" ", "%20");
        }
        if(cardName.contains("'")){
            cardName = cardName.replaceAll("'", "%27");
        }
        if(cardName.contains(",")) {
            cardName = cardName.replaceAll(",", "%44");
        }
        
        String myURL = "https://api.scryfall.com/cards/named?fuzzy=" + cardName;
        URL url = new URL(myURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.connect();
        int responsecode = conn.getResponseCode();
        if(responsecode != 200)
            throw new RuntimeException();
            else
            {
                //Next part of the functionality
            }
        Scanner sc = new Scanner(url.openStream());
        String inline = "";
        while(sc.hasNext())
        {
            inline+=sc.nextLine();
        }
        
        sc.close();
        try {
            JSONObject obj = new JSONObject(inline);
            model.addAttribute("card",obj);
            String images = obj.getString("image_uris");
            JSONObject newObj = new JSONObject(images);
            model.addAttribute("image",newObj.get("normal"));
            String legalities = obj.getString("legalities");
            JSONObject legal = new JSONObject(legalities);
            System.out.println(legal);
            
            model.addAttribute("legal",legal);

        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if(session.getAttribute("userId")!=null) {
        Long userId = (Long) session.getAttribute("userId");
        User user = userServ.findById(userId);
        model.addAttribute("user",user);
            if(result.hasErrors()) {
                model.addAttribute("newLogin", new User());
                System.out.println(result.getAllErrors());
            }
            return "ViewCard.jsp";
        } else {
            return "redirect:/";
        }
        
        
    }
}
