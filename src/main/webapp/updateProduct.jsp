<%@ page import="java.sql.*" %>
<%@ page import="inventory.DBConnection" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM product WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<html>
<body>

<h2>Update Product</h2>

<form action="updateProduct" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br><br>
    Quantity: <input type="number" name="quantity" value="<%= rs.getInt("quantity") %>"><br><br>
    Price: <input type="number" name="price" value="<%= rs.getDouble("price") %>"><br><br>

    <input type="submit" value="Update">
</form>

</body>
</html>