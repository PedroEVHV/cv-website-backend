package dev.cv_backend.controller;

import dev.cv_backend.enity.Country;
import dev.cv_backend.enity.Experience;
import dev.cv_backend.repository.CountryRepository;
import dev.cv_backend.repository.ExperienceRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/country")
@CrossOrigin(origins = "http://localhost:4200")
public class CountryController {

    private final CountryRepository repository;

    public CountryController(CountryRepository repository) {
        this.repository = repository;
    }

    @GetMapping("")
    public List<Country> getAll() {
        return repository.findAll();
    }

}
