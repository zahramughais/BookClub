package com.zahra.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zahra.bookclub.models.Book;
import com.zahra.bookclub.models.LoginUser;
import com.zahra.bookclub.models.User;
import com.zahra.bookclub.services.BookService;
import com.zahra.bookclub.services.UserService;

@Controller
public class MainController {

	@Autowired
	UserService userService;
	
	@Autowired
	BookService bookService;
	
	//index
	@RequestMapping("/")
	public String index(@ModelAttribute("newUser") User newUser,
			@ModelAttribute("newLogin") LoginUser newLogin) {
		return "index.jsp";
	}
	
	//home
	@RequestMapping("/books")
	public String home(HttpSession session,Model model) {
    	Long user_id = (Long) session.getAttribute("user_id");
    	if (user_id != null) {
    		User user = userService.findUser(user_id);
    		session.setAttribute("user", user); 
    	}
    	List<Book> books = bookService.allBooks();
    	model.addAttribute("books", books);
		return "books.jsp";
	}
	
	//login, registration, logout 
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result,
			Model model, HttpSession session) {
        userService.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
		return "redirect:/books";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result,
		Model model, HttpSession session) {
		User user = userService.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("user_id", user.getId());
		return "redirect:/books";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	//add book
	
	@RequestMapping("/books/new")
	public String newBook(@ModelAttribute("book") Book book) {
		return "newbook.jsp";
	}
	
	@RequestMapping(value="/books/new", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "newbook.jsp";
		} else {			
			bookService.createBook(book);
			return "redirect:/books";
		}
	}
	
	// show book 
	@RequestMapping("/books/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		return "showbook.jsp";
	}
	
	// edit book
	@RequestMapping("/books/{id}/edit")
	public String editBook(@PathVariable("id") Long id,Model model) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		return "editbook.jsp";
	}
	
	@RequestMapping(value="/books/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "editbook.jsp";
		} else {			
			bookService.updateBook(book);
			return "redirect:/books";
		}
	}
	
}

