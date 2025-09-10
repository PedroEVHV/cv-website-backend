package dev.cv_backend.controller;

import dev.cv_backend.enity.Experience;
import dev.cv_backend.repository.ExperienceRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/experience")
@CrossOrigin(origins = "http://localhost:4200")
public class ExperienceController {

    private final ExperienceRepository repository;

    public ExperienceController(ExperienceRepository repository) {
        this.repository = repository;
    }

    @GetMapping("")
    public List<Experience> getAll() {
        return repository.findAll();
    }

}
