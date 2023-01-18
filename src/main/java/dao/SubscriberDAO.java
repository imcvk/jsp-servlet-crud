package dao;

import dbconnection.DBConnection;
import model.Subscriber;

import java.sql.*;

public class SubscriberDAO {
    private static Connection connection;
    private static final String INSERTER = "INSERT INTO subscriber (subscriberid,fname,lname,email,phno,address,gender,username,password,dob,doj) " +
            "VALUES(?,?,?,?,?,?,?,?,?,?,?)";

    public static int insert(Subscriber s) {
        int i = 0;
        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERTER);
            preparedStatement.setString(1, s.getSubscriberId());
            preparedStatement.setString(2, s.getFirst_name());
            preparedStatement.setString(3, s.getLast_name());
            preparedStatement.setString(4, s.getEmail());
            preparedStatement.setLong(5, s.getPhone_no());
            preparedStatement.setString(6, s.getAddress());
            preparedStatement.setString(7, s.getGender());
            preparedStatement.setString(8, s.getUsername());
            preparedStatement.setString(9, s.getPassword());
            preparedStatement.setDate(10, new java.sql.Date(s.getDate_of_birth().getTime()));
            preparedStatement.setDate(11, new java.sql.Date(s.getDate_of_joining().getTime()));
            i = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return i;
    }

    private static final String VALIDATEUSER = "SELECT subscriberid,password FROM subscriber S WHERE S.SUBSCRIBERID=?";

    public static String validateUser(Subscriber s) {
        String valid_user = "false";
        try {
            connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(VALIDATEUSER);
            statement.setString(1, s.getSubscriberId());
            ResultSet resultSet = statement.executeQuery();
            if (resultSet != null) {
                while (resultSet.next()) {
                    String sid = resultSet.getString("subscriberid");
                    String pass = resultSet.getString("password");
                    if (sid.equals(s.getSubscriberId()) && pass.equals(s.getPassword())) {
                        valid_user = "true";
                    } else {
                        valid_user = "Incorrect username or password";
                    }
                }
            } else {
                valid_user = "User Does not exist";
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return valid_user;
    }

    private static final String GETUSER = "SELECT * FROM subscriber S WHERE S.SUBSCRIBERID=?";

    public static Subscriber getSubscriber(String subscriberid) {
        Subscriber s = null;
        try {
            connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(GETUSER);
            statement.setString(1, subscriberid);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet != null) {
                while (resultSet.next()) {

                    String first_name = resultSet.getString("fname");
                    String last_name = resultSet.getString("lname");
                    String address = resultSet.getString("address");
                    String email = resultSet.getString("email");
                    String gender = resultSet.getString("gender");
                    String username = resultSet.getString("username");
                    long phone_no = Long.parseLong(resultSet.getString("phno"));
                    java.util.Date date_of_birth = new java.util.Date(resultSet.getDate("dob").getTime());
                    java.util.Date date_of_joining = new java.util.Date(resultSet.getDate("doj").getTime());
                    String subscriber_id = resultSet.getString("subscriberid");
                    s = new Subscriber();
                    s.setFirst_name(first_name);
                    s.setLast_name(last_name);
                    s.setAddress(address);
                    s.setEmail(email);
                    s.setGender(gender);
                    s.setUsername(username);
                    s.setPhone_no(phone_no);
                    s.setSubscriberId(subscriber_id);
                    s.setDate_of_birth(date_of_birth);
                    s.setDate_of_joining(date_of_joining);
                    s.setPassword(s.getPassword());
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return s;
    }

    private static final String updater = "update subscriber s set fname = ?,lname = ?,address = ?,email = ?,gender = ?,phno=? where s.subscriberid=?";

    public static String update(Subscriber s) {
        String msg = null;
        try {

            connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(updater);
            statement.setString(1, s.getFirst_name());
            statement.setString(2, s.getLast_name());
            statement.setString(3, s.getAddress());
            statement.setString(4, s.getEmail());
            statement.setString(5, s.getGender());
            statement.setLong(6, s.getPhone_no());
            statement.setString(7, s.getSubscriberId());
            int i = statement.executeUpdate();
            if (i == 1) {
                msg = "Profile updated successfully";
            } else {
                msg = "Update failed";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
}
