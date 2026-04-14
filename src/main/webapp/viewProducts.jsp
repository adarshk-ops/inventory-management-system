<%@ page import="java.sql.*" %>
<%@ page import="inventory.DBConnection" %>

<html>
<head>
<style>
body {
    font-family: Arial;
    background-color: #f4f6f8;
    text-align: center;
}

h2 {
    margin-top: 20px;
}

table {
    margin: auto;
    border-collapse: collapse;
    width: 70%;
    background: white;
    box-shadow: 0px 0px 10px gray;
}

th {
    background-color: #333;
    color: white;
}

td, th {
    padding: 12px;
}

tr:hover {
    background-color: #ddd;
}

a {
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    color: red;
}

form {
    margin-top: 30px;
}

input {
    padding: 8px;
    margin: 5px;
}

input[type="submit"] {
    background-color: green;
    color: white;
    border: none;
    cursor: pointer;
}
</style>
    <title>View Products</title>
</head>

<body>


<h3 style="color:red;">&#9888; Low Stock Products (Qty < 5)</h3>

<%
    try {
        Connection con2 = DBConnection.getConnection();
        Statement st2 = con2.createStatement();
        ResultSet rs2 = st2.executeQuery("SELECT * FROM product WHERE quantity < 5");

        boolean foundLow = false;

        while (rs2.next()) {
            foundLow = true;
%>

<p style="color:red;">
    &#9888; <%= rs2.getString("name") %> (Qty: <%= rs2.getInt("quantity") %>)
</p>

<%
        }

        if (!foundLow) {
%>
<p>No low stock items</p>
<%
        }

        rs2.close();
        st2.close();
        con2.close();

    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
<h2>Product List</h2>
<table border="1" cellpadding="10">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>Action</th>
</tr>

<%
    try {
        Connection con = DBConnection.getConnection();

        if (con == null) {
            out.println("<tr><td colspan='4'>❌ DB Connection Failed</td></tr>");
        } else {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM product");

            boolean hasData = false;

            while (rs.next()) {
                hasData = true;
%>

<tr style="<%= (rs.getInt("quantity") < 5) ? "background-color:#ffcccc;" : "" %>">
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getInt("quantity") %></td>
    <td><%= rs.getDouble("price") %></td>
    <td>
    <a href="updateProduct.jsp?id=<%= rs.getInt("id") %>">Update</a> |
    <a href="deleteProduct?id=<%= rs.getInt("id") %>">Delete</a>
</td>
</tr>

<%
            }

            if (!hasData) {
%>
<tr>
    <td colspan="4">No products found</td>
</tr>
<%
            }

            rs.close();
            st.close();
            con.close();
        }

    } catch (Exception e) {
        out.println("<tr><td colspan='5'>Error: " + e + "</td></tr>");
    }
%>

</table>
<br><br>

<h3>Add Product</h3>

<form action="addProduct" method="post">
    Name: <input type="text" name="name" required>
    Quantity: <input type="number" name="quantity" required>
    Price: <input type="number" name="price" required>

    <input type="submit" value="Add">
</form>
<br><br>



</body>
</html>