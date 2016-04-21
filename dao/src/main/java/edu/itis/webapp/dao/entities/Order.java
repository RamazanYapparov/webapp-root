package edu.itis.webapp.dao.entities;


import javax.persistence.*;

@Entity
@Table(name = "ORDERS")
public class Order implements GenericEntity{

	@Id
    @Column(name = "id")
    private Long id;

    @Column(name = "customerId")
    private Long customerId;

    @ManyToOne
    @JoinColumn(name = "customerId", referencedColumnName = "id", insertable = false, updatable = false)
    private User customer;

    @Column(name = "salesPersonId")
    private Long salesPersonId;

    @ManyToOne
    @JoinColumn(name = "salesPersonId", referencedColumnName = "id", insertable = false, updatable = false)
    private User salesPerson;

	@Column(name = "PRODUCT")
    private String product;

    @Column(name = "PRICE")
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
