/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.contactus.dao;

import com.contactus.entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class ContactsDao {

    private Connection connection = null;

    public ContactsDao(Connection connection) {
        this.connection = connection;
    }

    public boolean storeContact(Contact contact) {
        String fullName = contact.getFullName();
        String email = contact.getEmail();
        String message = contact.getMessage();

        String query = "INSERT INTO contacts(name,email,message) VALUES(?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, message);
            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.getMessage();
        }
        return false;
    }

    public ArrayList<Contact> getContacts() {
        ArrayList<Contact> contacts = new ArrayList<>();
        String query = "Select * from contacts";
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setFullName(rs.getString("name"));
                contact.setEmail(rs.getString("email"));
                contact.setMessage(rs.getString("message"));
                contact.setRequestTime(rs.getString("request_time"));
                contact.setArchive(rs.getBoolean("archieve"));
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return contacts;
    }

    public boolean updateArchiveStatus(String email, boolean isArchive) {
        String query = "UPDATE contacts SET archieve=? WHERE email=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setBoolean(1, isArchive);
            preparedStatement.setString(2, email);
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.getMessage();
        }
        return false;
    }
}
