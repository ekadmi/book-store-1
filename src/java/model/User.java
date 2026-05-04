package model;
import javax.persistence.*;

@Entity
@Table(name="users")
public class User {
    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String username, email, password;
    private boolean admin;

    public User() {}
    public User(String u, String e, String p, boolean a) { username=u; email=e; password=p; admin=a; }

    public int getId(){return id;}
    public String getUsername(){return username;}
    public String getEmail(){return email;}
    public String getPassword(){return password;}
    public boolean isAdmin(){return admin;}
}
