package DatabaseWrapper;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by CIA on 26/09/2017.
 */
public class DatabaseConnection {

    private final String URL = "jdbc:mysql://localhost:3306/";
    private final String DB_NAME = "chatsystem";
    private final String USER = "root";
    private final String PASS = "";
    private Connection connection = null;

    public DatabaseConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.connection = DriverManager.getConnection(
                    this.URL + this.DB_NAME,
                    this.USER,
                    this.PASS);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public synchronized void createUserAccount(String username, String password){
        String sql = "INSERT INTO `users` (`username`, `password`) " + "VALUES (?, ?)";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public synchronized boolean passwordCorrect(String username, String password){
        String sql = "SELECT username, password FROM users WHERE username = ? AND password= ?";
        boolean correct = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            correct = resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return correct;
    }



}
