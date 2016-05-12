package edu.itis.webapp.dao.entities;


import org.hibernate.annotations.Proxy;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "ORDERS")
@Proxy(lazy = false)
public class Order implements GenericEntity{

	@Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "customerId")
    private Long customerId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customerId", referencedColumnName = "id", insertable = false, updatable = false)
    private User customer;

    @Column(name = "salesPersonId")
    private Long salesPersonId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "salesPersonId", referencedColumnName = "id", insertable = false, updatable = false)
    private User salesPerson;

    @NotEmpty(message = "заполните поле")
    @Column(name = "product")
    private String product;

    @NotNull(message = "заполните поле")
    @Min(value = 1, message = "должно быть положительным числом")
    @Column(name = "price")
	private Integer price;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public Long getSalesPersonId() {
        return salesPersonId;
    }

    public void setSalesPersonId(Long salesPersonId) {
        this.salesPersonId = salesPersonId;
    }

    public User getSalesPerson() {
        return salesPerson;
    }

    public void setSalesPerson(User salesPerson) {
        this.salesPerson = salesPerson;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
}
