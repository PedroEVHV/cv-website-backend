package dev.cv_backend.controller;

import dev.cv_backend.enity.Education;
import dev.cv_backend.repository.EducationRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/education")
@CrossOrigin(origins = "http://localhost:4200")
public class EducationController {

    private final EducationRepository repository;

    public EducationController(EducationRepository repository) {
        this.repository = repository;
    }

    @GetMapping("")
    public List<Education> getAll() {
        return repository.findAll();
    }

}
