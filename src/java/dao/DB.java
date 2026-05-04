package dao;
import java.util.*;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import model.*;

public class DB {
    private static SessionFactory sf;
    static {
        try { sf = new Configuration().configure().buildSessionFactory(); } catch(Exception e){ e.printStackTrace(); }
    }
    public static Session getSession() { return sf.openSession(); }

    public static List<Book> getBooks(String q) {
        try(Session s = getSession()) {
            if(q==null || q.isEmpty()) return s.createQuery("FROM Book", Book.class).list();
            return s.createQuery("FROM Book WHERE title LIKE :q OR author LIKE :q", Book.class).setParameter("q", "%"+q+"%").list();
        } catch(Exception e){ return new ArrayList<>(); }
    }
    public static Book getBook(int id) {
        try(Session s = getSession()) { return s.get(Book.class, id); } catch(Exception e){ return null; }
    }
    public static void saveBook(String t, String a, double p, String d, String img) {
        try(Session s = getSession()) {
            Transaction tx = s.beginTransaction();
            Book b = new Book(); b.setTitle(t); b.setAuthor(a); b.setPrice(p); b.setDescription(d); b.setImageUrl(img);
            s.save(b); tx.commit();
        } catch(Exception e){ e.printStackTrace(); }
    }
    public static void delBook(int id) {
        try(Session s = getSession()) {
            Transaction tx = s.beginTransaction();
            Book b = s.get(Book.class, id); if(b!=null) s.delete(b);
            tx.commit();
        } catch(Exception e){ e.printStackTrace(); }
    }
    public static void updateBook(int id, String t, String a, double p, String d, String img) {
        try(Session s = getSession()) {
            Transaction tx = s.beginTransaction();
            Book b = s.get(Book.class, id);
            if(b!=null) {
                b.setTitle(t); b.setAuthor(a); b.setPrice(p); b.setDescription(d); 
                if(img != null && !img.isEmpty()) b.setImageUrl(img);
            }
            tx.commit();
        } catch(Exception e){ e.printStackTrace(); }
    }
    public static User login(String u, String p) {
        try(Session s = getSession()) {
            return s.createQuery("FROM User WHERE username=:u AND password=:p", User.class)
                    .setParameter("u", u).setParameter("p", p).uniqueResult();
        } catch(Exception e){ return null; }
    }
    public static boolean register(String u, String e, String p) {
        try(Session s = getSession()) {
            Transaction tx = s.beginTransaction();
            if(s.createQuery("FROM User WHERE username=:u", User.class).setParameter("u", u).uniqueResult() != null) return false;
            boolean isAdmin = s.createQuery("SELECT count(*) FROM User", Long.class).uniqueResult() == 0;
            s.save(new User(u, e, p, isAdmin)); tx.commit(); return true;
        } catch(Exception ex){ return false; }
    }
    public static void saveOrder(String u, String items, double total) {
        try(Session s = getSession()) {
            Transaction tx = s.beginTransaction();
            s.save(new Order(u, items, total, "Pending")); tx.commit();
        } catch(Exception e){ e.printStackTrace(); }
    }
    public static List<Order> getOrders(String u) {
        try(Session s = getSession()) {
            if(u == null) return s.createQuery("FROM Order ORDER BY orderDate DESC", Order.class).list();
            return s.createQuery("FROM Order WHERE username=:u ORDER BY orderDate DESC", Order.class).setParameter("u", u).list();
        } catch(Exception e){ return new ArrayList<>(); }
    }
    public static void updateOrderStatus(int id, String status) {
        try(Session s = getSession()) {
            Transaction tx = s.beginTransaction();
            Order o = s.get(Order.class, id); if(o!=null) o.setStatus(status);
            tx.commit();
        } catch(Exception e){ e.printStackTrace(); }
    }
}
