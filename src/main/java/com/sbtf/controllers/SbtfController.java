package com.sbtf.controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class SbtfController {

    @RequestMapping("/")
    public String index() {
        return "Greetings from Spring Boot!";
    }
    
    @RequestMapping("/runfeature")
    public String subindex() {
        return "Enter Test Feature: <input type=text name=feature> <input type=submit>";
    }

}