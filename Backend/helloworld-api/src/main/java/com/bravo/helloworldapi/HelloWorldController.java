package com.bravo.helloworldapi;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
class HelloWorldController {

  @Value("${display-message}")
  private String profile;

  @GetMapping
  private ResponseEntity<String> sayHello(){
    return ResponseEntity.ok("Bienvenido a Bravo, " + profile);
  }
}
