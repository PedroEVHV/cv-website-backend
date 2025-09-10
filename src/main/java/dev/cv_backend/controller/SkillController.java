package dev.cv_backend.controller;

import dev.cv_backend.enity.Skill;
import dev.cv_backend.repository.SkillRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/skill")
@CrossOrigin(origins = "http://localhost:4200")
public class SkillController {

    private final SkillRepository repository;

    public SkillController(SkillRepository repository) {
        this.repository = repository;
    }


    @GetMapping("")
    public List<Skill> getAll() {
        return repository.findAll();
    }

}