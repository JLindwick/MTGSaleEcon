package com.justine.javaProject.controllers;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.justine.javaProject.models.LoginUser;
import com.justine.javaProject.models.User;
import com.justine.javaProject.services.UserService;



@Controller
public class HomeController {
    @Autowired
    private UserService userServ;
   @GetMapping("/")
   public String index(Model model) {
       model.addAttribute("newUser", new User());
       model.addAttribute("newLogin", new LoginUser());
       return "index.jsp";
   }
   
   @PostMapping("/register")
   public String register(@Valid @ModelAttribute("newUser") User newUser, 
           BindingResult result, Model model, HttpSession session) {
       System.out.println(newUser);
       User user = userServ.register(newUser, result);
       
       if(result.hasErrors()) {
           model.addAttribute("newLogin", new User());
           System.out.println(result.getAllErrors());
                     return "redirect:/welcome";
       }
       session.setAttribute("userId", user.getId());
       return "redirect:/welcome";
   }
   
   @PostMapping("/login")
   public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
           BindingResult result, Model model, HttpSession session) {
       User user = userServ.login(newLogin,result);

       if(result.hasErrors()) {
           model.addAttribute("newUser", new User());
                     return "index.jsp";
       }
       session.setAttribute("userId", user.getId());
      
       return "redirect:/welcome";
   }
   @GetMapping("/goBack")
   public String goBack() {
	   return "redirect:/welcome";
   }
   @GetMapping("/welcome")
   public String welcome(HttpSession session, Model model) {
   	if(session.getAttribute("userId") == null ) {
   		return "redirect:/logout";
   	}
   	Long userId = (Long) session.getAttribute("userId");	
   	model.addAttribute("user", userServ.findById(userId));
   	return "redirect:/";
   }
   @GetMapping("/logout")
   public String logout(HttpSession session) {
   	session.invalidate();
   	return "redirect:/";
   }
}
