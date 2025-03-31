package com.dthunn.security.controller;

import com.dthunn.security.model.Cards;
import com.dthunn.security.repository.CardsRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class CardsController {

    private final CardsRepository cardsRepository;

    @GetMapping("/myCards")
    public List<Cards> getCardDetails(@RequestParam long id) {
        List<Cards> cards = cardsRepository.findByCustomerId(id);
        if (cards != null) {
            return cards;
        } else {
            return null;
        }
    }

}
