package com.datapackage.dao;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.SQLException;

	import com.datapackage.model.Reservation;

	public class ReservationDAO {
	    private String jdbcURL = "jdbc:mysql://localhost:3306/car_booking"; // Update DB URL
	    private String jdbcUsername = "root"; // Update username
	    private String jdbcPassword = "Imandi1234@#$"; // Update password

	    private static final String INSERT_RESERVATION_SQL = "INSERT INTO reservations (name, email, contact, from_location, to_location, date) VALUES (?, ?, ?, ?, ?, ?)";

	    public ReservationDAO() {
	    }

	    // Get Database Connection
	    protected Connection getConnection() {
	        Connection connection = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	        return connection;
	    }

	    // Insert Reservation into Database
	    public boolean insertReservation(Reservation reservation) {
	        boolean rowInserted = false;
	        try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RESERVATION_SQL)) {

	            preparedStatement.setString(1, reservation.getName());
	            preparedStatement.setString(2, reservation.getEmail());
	            preparedStatement.setString(3, reservation.getContact());
	            preparedStatement.setString(4, reservation.getFromLocation());
	            preparedStatement.setString(5, reservation.getToLocation());
	            preparedStatement.setString(6, reservation.getDate());

	            rowInserted = preparedStatement.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return rowInserted;
	    }

}
