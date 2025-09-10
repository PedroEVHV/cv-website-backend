package dev.cv_backend.repository;

import dev.cv_backend.enity.CompanyInstitution;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyInstitutionRepository extends JpaRepository<CompanyInstitution, Long> {
}
