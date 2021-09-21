/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.contactus.dao;


import com.contactus.entity.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author ASUS
 */
public class AdminDao {

    private Connection connection = null;

    public AdminDao(Connection connection) {
        this.connection = connection;
    }

    public boolean checkAdminInDatabase(Admin admin) {
        String loginId = admin.getLoginId();
        String password = admin.getPassword();
        String query = "SELECT * FROM admin WHERE login_id=? and password=?";
        try {
            PreparedStatement preparedStatement = connection.prepareCall(query);
            preparedStatement.setString(1, loginId);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return false;
    }
}
