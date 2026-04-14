package inventory;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO product(name, quantity, price) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setInt(2, quantity);
            ps.setDouble(3, price);

            int rows = ps.executeUpdate();

            if (rows > 0) {
            	response.sendRedirect("viewProducts.jsp");
            } else {
                response.getWriter().println("❌ Failed to add product");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            response.getWriter().println("Error: " + e);
        }
    }
}