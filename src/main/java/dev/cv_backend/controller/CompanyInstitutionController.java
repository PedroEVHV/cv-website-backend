package dev.cv_backend.controller;

import dev.cv_backend.enity.CompanyInstitution;
import dev.cv_backend.repository.CompanyInstitutionRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/company-institution")
@CrossOrigin(origins = "http://localhost:4200")
public class CompanyInstitutionController {

    private final CompanyInstitutionRepository repository;

    public CompanyInstitutionController(CompanyInstitutionRepository repository) {
        this.repository = repository;
    }

    @GetMapping("")
    public List<CompanyInstitution> getAll() {
        return repository.findAll();
    }

}
