package com.datapackage.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.datapackage.model.Contact;

public class ContactDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/car_booking";
    private String jdbcUsername = "root";  // Change if needed
    private String jdbcPassword = "Imandi1234@#$";      // Change if needed
    private Connection jdbcConnection;

    // Establish connection
    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    // Close connection
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    // Insert Contact
    public boolean insertContact(Contact contact) throws SQLException {
        String sql = "INSERT INTO ContactUs (name, email, message) VALUES (?, ?, ?)";
        connect();
        
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, contact.getName());
        statement.setString(2, contact.getEmail());
        statement.setString(3, contact.getMessage());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        
        return rowInserted;
    }

    // Retrieve All Contacts
    public List<Contact> listAllContacts() throws SQLException {
        List<Contact> contactList = new ArrayList<>();
        String sql = "SELECT * FROM ContactUs ORDER BY submitted_at DESC";
        
        connect();
        
        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String message = resultSet.getString("message");
            String submittedAt = resultSet.getString("submitted_at");

            Contact contact = new Contact(id, name, email, message, submittedAt);
            contactList.add(contact);
        }

        resultSet.close();
        statement.close();
        disconnect();
        
        return contactList;
    }

    // Delete Contact by ID
    public boolean deleteContact(int id) throws SQLException {
        String sql = "DELETE FROM ContactUs WHERE id = ?";
        
        connect();
        
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);
        
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        
        return rowDeleted;
    }
}
