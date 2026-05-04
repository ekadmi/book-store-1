package model;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="orders")
public class Order {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String username;
    private String items;
    private double total;
    private String status;
    private Date orderDate;

    public Order() {}
    public Order(String u, String i, double t, String s) { username=u; items=i; total=t; status=s; orderDate=new Date(); }

    public int getId(){return id;}
    public String getUsername(){return username;}
    public String getItems(){return items;}
    public double getTotal(){return total;}
    public String getStatus(){return status;}
    public void setStatus(String s){status=s;}
    public Date getOrderDate(){return orderDate;}
}
