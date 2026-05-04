package model;
import javax.persistence.*;

@Entity
@Table(name="books")
public class Book {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id; 
    private String title, author, description, imageUrl; 
    private double price;

    public Book() {}
    public Book(int id, String t, String a, double p, String d, String i) { this.id=id; title=t; author=a; price=p; description=d; imageUrl=i; }
    
    public int getId(){return id;} public void setId(int id){this.id=id;}
    public String getTitle(){return title;} public void setTitle(String t){title=t;}
    public String getAuthor(){return author;} public void setAuthor(String a){author=a;}
    public double getPrice(){return price;} public void setPrice(double p){price=p;}
    public String getDescription(){return description;} public void setDescription(String d){description=d;}
    public String getImageUrl(){return imageUrl;} public void setImageUrl(String i){imageUrl=i;}
}
