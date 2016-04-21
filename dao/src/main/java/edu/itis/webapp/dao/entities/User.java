package edu.itis.webapp.dao.entities;


import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "USERS")
public class User implements GenericEntity {

    @Id
    @Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long id;

	@NotEmpty(message = "заполните поле")
    @Column(name = "firstname")
	public String firstname;

	@NotEmpty(message = "заполните поле")
    @Column(name = "lastname")
	public String lastname;

    @NotNull(message = "заполните поле")
	@Min(value = 18, message = "должен быть совершеннолетним")
    @Column(name = "age")
	public Integer age;
	
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Override
	public Long getId() {
		return id;
	}

	@Override
	public void setId(Long id) {
		this.id = id;
	}

	@Override
    public String toString() {
		return (this.id + " " + this.firstname + " " + this.lastname + " " + this.age);
		
	}

}
