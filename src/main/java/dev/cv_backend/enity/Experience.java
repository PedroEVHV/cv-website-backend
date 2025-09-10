package dev.cv_backend.enity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "experience")
public class Experience {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "job_title")
    private String jobTitle;
    @ManyToOne(fetch = FetchType.EAGER) @JoinColumn(name = "company_id", referencedColumnName = "id") private CompanyInstitution company;
    @ManyToOne(fetch = FetchType.EAGER) @JoinColumn(name = "country_id", referencedColumnName = "id") private Country country;
    @Column(name = "start_d")
    private LocalDate startDate;
    @Column(name = "end_d")
    private LocalDate endDate;
    @Column(name = "content_description")
    private String description;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public CompanyInstitution getCompany() { return company; }
    public void setCompany(CompanyInstitution company) { this.company = company; }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Country getCountry() { return country; }
    public void setCountry(Country country) { this.country = country; }
}
