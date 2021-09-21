/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.contactus.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class ConnectionProvider {

    private static Connection con=null;
    final static String URL = "jdbc:postgresql://localhost:5432/contactUs";
    final static String NAME = "postgres";
    final static String PASSWORD = "root";

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection(URL, NAME, PASSWORD);
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return con;
    }

}
