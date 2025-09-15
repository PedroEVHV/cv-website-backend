package dev.cv_backend.enity;

import jakarta.persistence.*;

@Entity
@Table(name = "education")

public class Education {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "course_title")
    private String courseTitle;

    @ManyToOne(fetch = FetchType.EAGER) @JoinColumn(name = "institution_id", referencedColumnName = "id") private CompanyInstitution institution;
    @ManyToOne(fetch = FetchType.EAGER) @JoinColumn(name = "country_id", referencedColumnName = "id")private Country country;
    @Column(name = "start_d")
    private int startDate;
    @Column(name = "end_d")
    private int endDate;
    @Column(name = "content_description")
    private String description;


    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getCourseTitle() { return courseTitle; }
    public void setCourseTitle(String degree) { this.courseTitle = degree; }

    public CompanyInstitution getInstitution() { return institution; }
    public void setInstitution(CompanyInstitution institution) { this.institution = institution; }

    public int getStartDate() { return startDate; }
    public void setStartDate(int startDate) { this.startDate = startDate; }

    public int getEndDate() { return endDate; }
    public void setEndDate(int endDate) { this.endDate = endDate; }

    public Country getCountry() { return country; }
    public void setCountry(Country country) { this.country = country; }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
