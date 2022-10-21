package com.justine.javaProject.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="sales")
public class StoreSales {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;


@NotEmpty(message="Card name is required!")
@Size(min=1, max=30, message="Card Name must be between 1 and 30 characters")
private String cardName;

@NotEmpty(message="Card condition is required!")
@Size(min=3, max=30, message="Condition description must be between 3 and 30 characters")
private String cardCondition;

@Min(value = 0, message = "The value must be positive")
private Double cardPrice;

@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date updatedAt;
@Column(updatable = false)
@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date createdAt;

@OneToMany(mappedBy="sales", fetch = FetchType.LAZY)
private List<StoreSales> sales;


@PrePersist
protected void onCreate() {
   this.createdAt = new Date();
   this.updatedAt = new Date();
}
@PreUpdate
protected void onUpdate() {
   this.updatedAt = new Date();
}
public StoreSales() {}
public Long getId() {
    return id;
}
public void setId(Long id) {
    this.id = id;
}
public String getCardName() {
    return cardName;
}
public void setCardName(String cardName) {
    this.cardName = cardName;
}
public String getCardCondition() {
    return cardCondition;
}
public void setCardCondition(String cardCondition) {
    this.cardCondition = cardCondition;
}
public Date getUpdatedAt() {
    return updatedAt;
}
public void setUpdatedAt(Date updatedAt) {
    this.updatedAt = updatedAt;
}
public Date getCreatedAt() {
    return createdAt;
}
public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
}
public Double getCardPrice() {
    return cardPrice;
}
public void setCardPrice(Double cardPrice) {
    this.cardPrice = cardPrice;
}
public List<StoreSales> getSales() {
    return sales;
}
public void setSales(List<StoreSales> sales) {
    this.sales = sales;
}




}