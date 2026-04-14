package inventory;

import java.sql.*;

public class DBConnection {

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/inventory_db",
                "root",
                "root@123"
            );

            System.out.println("✅ DB Connected!");
            return con;

        } catch (Exception e) {
            e.printStackTrace();   // 🔥 IMPORTANT
            return null;
        }
    }
}