package controller;
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.DB;
import model.*;

@javax.servlet.annotation.MultipartConfig
public class AppServlet extends HttpServlet {
    protected void service(HttpServletRequest r, HttpServletResponse res) throws ServletException, IOException {
        String act = r.getParameter("act");
        HttpSession s = r.getSession();
        User user = (User) s.getAttribute("user");
        
        if("add".equals(act) && user != null && user.isAdmin()) {
            Part filePart = r.getPart("imgFile");
            String fileName = filePart.getSubmittedFileName();
            if(fileName != null && !fileName.isEmpty()) {
                String path = getServletContext().getRealPath("") + "assets" + java.io.File.separator + "img";
                new java.io.File(path).mkdirs();
                filePart.write(path + java.io.File.separator + fileName);
                DB.saveBook(r.getParameter("t"), r.getParameter("a"), Double.parseDouble(r.getParameter("p")), r.getParameter("d"), "assets/img/" + fileName);
            }
            res.sendRedirect("app?act=admin"); return;
        } else if("update".equals(act) && user != null && user.isAdmin()) {
            Part filePart = r.getPart("imgFile");
            String imgUrl = null;
            if(filePart != null && filePart.getSize() > 0) {
                String fileName = filePart.getSubmittedFileName();
                String path = getServletContext().getRealPath("") + "assets" + java.io.File.separator + "img";
                new java.io.File(path).mkdirs();
                filePart.write(path + java.io.File.separator + fileName);
                imgUrl = "assets/img/" + fileName;
            }
            DB.updateBook(Integer.parseInt(r.getParameter("id")), r.getParameter("t"), r.getParameter("a"), Double.parseDouble(r.getParameter("p")), r.getParameter("d"), imgUrl);
            res.sendRedirect("app?act=admin"); return;
        } else if("del".equals(act) && user != null && user.isAdmin()) {
            DB.delBook(Integer.parseInt(r.getParameter("id")));
            res.sendRedirect("app?act=admin"); return;
        } else if("cart".equals(act)) {
            List<CartItem> cart = (List<CartItem>)s.getAttribute("cart");
            if(cart==null) s.setAttribute("cart", cart=new ArrayList<>());
            int id = Integer.parseInt(r.getParameter("id"));
            boolean found = false;
            for(CartItem item : cart) {
                if(item.getBook().getId() == id) { item.setQuantity(item.getQuantity() + 1); found = true; break; }
            }
            if(!found) {
                Book b = DB.getBook(id);
                if(b!=null) cart.add(new CartItem(b, 1));
            }
            res.sendRedirect("app?act=viewCart"); return;
        } else if("inc".equals(act)) {
            List<CartItem> cart = (List<CartItem>)s.getAttribute("cart");
            int id = Integer.parseInt(r.getParameter("id"));
            if(cart!=null) for(CartItem item : cart) if(item.getBook().getId() == id) item.setQuantity(item.getQuantity() + 1);
            res.sendRedirect("app?act=viewCart"); return;
        } else if("dec".equals(act)) {
            List<CartItem> cart = (List<CartItem>)s.getAttribute("cart");
            int id = Integer.parseInt(r.getParameter("id"));
            if(cart!=null) {
                Iterator<CartItem> it = cart.iterator();
                while(it.hasNext()) {
                    CartItem item = it.next();
                    if(item.getBook().getId() == id) {
                        item.setQuantity(item.getQuantity() - 1);
                        if(item.getQuantity() <= 0) it.remove();
                    }
                }
            }
            res.sendRedirect("app?act=viewCart"); return;
        } else if("viewCart".equals(act)) {
            r.getRequestDispatcher("cart.jsp").forward(r, res); return;
        } else if("checkout".equals(act) && user != null) {
            List<CartItem> cart = (List<CartItem>)s.getAttribute("cart");
            if(cart!=null && !cart.isEmpty()) {
                double total = 0; String items = "";
                for(CartItem item : cart) { total += item.getTotalPrice(); items += item.getBook().getTitle() + " x" + item.getQuantity() + ", "; }
                DB.saveOrder(user.getUsername(), items, total);
                s.removeAttribute("cart");
            }
            res.sendRedirect("app?act=orders"); return;
        } else if("acceptOrder".equals(act) && user != null && user.isAdmin()) {
            DB.updateOrderStatus(Integer.parseInt(r.getParameter("id")), "Accepted");
            res.sendRedirect("app?act=admin"); return;
        } else if("admin".equals(act) && user != null && user.isAdmin()) {
            r.setAttribute("books", DB.getBooks(null));
            r.getRequestDispatcher("admin.jsp").forward(r, res); return;
        } else if("editBook".equals(act) && user != null && user.isAdmin()) {
            r.setAttribute("editBook", DB.getBook(Integer.parseInt(r.getParameter("id"))));
            r.setAttribute("books", DB.getBooks(null));
            r.getRequestDispatcher("admin.jsp").forward(r, res); return;
        } else if("adminOrders".equals(act) && user != null && user.isAdmin()) {
            r.setAttribute("orders", DB.getOrders(null));
            r.getRequestDispatcher("admin_orders.jsp").forward(r, res); return;
        } else if("reg".equals(act)) {
            Boolean regRes = DB.register(r.getParameter("user"), r.getParameter("email"), r.getParameter("pwd"));
            if(Boolean.TRUE.equals(regRes)) {
                r.setAttribute("msg", "Registration Successful. Please Login.");
                r.getRequestDispatcher("login.jsp").forward(r, res); return;
            } else if(Boolean.FALSE.equals(regRes)) {
                r.setAttribute("err", "Username taken.");
                r.getRequestDispatcher("register.jsp").forward(r, res); return;
            } else {
                r.setAttribute("err", "Registration failed due to database error. Please try again later.");
                r.getRequestDispatcher("register.jsp").forward(r, res); return;
            }
        } else if("login".equals(act)) {
            User u = DB.login(r.getParameter("user"), r.getParameter("pwd"));
            if(u != null) s.setAttribute("user", u);
            else { r.setAttribute("err", "Invalid credentials"); r.getRequestDispatcher("login.jsp").forward(r, res); return; }
        } else if("logout".equals(act)) {
            s.invalidate();
        } else if("details".equals(act)) {
            r.setAttribute("b", DB.getBook(Integer.parseInt(r.getParameter("id"))));
            r.getRequestDispatcher("details.jsp").forward(r, res); return;
        } else if("orders".equals(act) && user != null) {
            r.setAttribute("orders", DB.getOrders(user.getUsername()));
            r.getRequestDispatcher("orders.jsp").forward(r, res); return;
        }
        
        r.setAttribute("books", DB.getBooks(r.getParameter("q")));
        r.getRequestDispatcher("index.jsp").forward(r, res);
    }
}
