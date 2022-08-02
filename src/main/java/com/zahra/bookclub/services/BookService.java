package com.zahra.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zahra.bookclub.models.Book;
import com.zahra.bookclub.models.User;
import com.zahra.bookclub.repositories.BookRepository;

@Service
public class BookService {

	@Autowired
	BookRepository bookRepository;
	
	public List<Book> allBooks() {
        return bookRepository.findAll();
    }
	
    public Book createBook(Book b) {
        return bookRepository.save(b);
    }
    
    public Book findBook(Long id) {
        Optional<Book> optionalBook = bookRepository.findById(id);
        if(optionalBook.isPresent()) {
            return optionalBook.get();
        } else {
            return null;
        }
    }
	public Book updateBook(Book book) {
		return bookRepository.save(book);
	}
	
	public void deleteBook(Long id) {
		Book book = findBook(id);
		if (book !=null) {			
			bookRepository.deleteById(id);
		}
	}
	
	public void borrowBook(Book b, User u) {
		b.setBorrower(u);
	}
    
	public void returnBook(Book b) {
		b.setBorrower(null);
	}
}
