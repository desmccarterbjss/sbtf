package com.desdev;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloController {

    @RequestMapping("/")
    public String index() {
        return "Greetings from Spring Boot!";
    }
    
    @RequestMapping("/feature")
    public String subindex() {
        return "Enter Test Feature: <input type=text name=feature> <input type=submit>";
    }

}
