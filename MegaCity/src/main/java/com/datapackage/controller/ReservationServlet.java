package com.datapackage.controller;

import java.io.IOException;


import com.datapackage.dao.ReservationDAO;
import com.datapackage.model.Reservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;

    public void init() {
        reservationDAO = new ReservationDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String fromLocation = request.getParameter("fromLocation");
        String toLocation = request.getParameter("toLocation");
        String date = request.getParameter("date");

        // Create Reservation object
        Reservation reservation = new Reservation(name, email, contact, fromLocation, toLocation, date);

        // Insert into DB
        boolean success = reservationDAO.insertReservation(reservation);

        if (success) {
            request.setAttribute("message", "Reservation successful!");
        } else {
            request.setAttribute("message", "Reservation failed. Try again.");
        }
        request.getRequestDispatcher("reservation.jsp").forward(request, response);
    }
}
