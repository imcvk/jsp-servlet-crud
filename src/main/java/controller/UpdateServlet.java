package controller;

import dao.SubscriberDAO;
import model.Subscriber;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        {
            Subscriber subscriber = null;
            HttpSession httpSession = request.getSession(false);
            RequestDispatcher dispatcher = null;
            String subscriber_id = request.getParameter("subscriberid");
            String first_name = request.getParameter("fname");
            String last_name = request.getParameter("lname");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            long phone_no = Long.parseLong(request.getParameter("phno"));
            subscriber = new Subscriber();
            subscriber.setSubscriberId(subscriber_id);
            subscriber.setGender(gender);
            subscriber.setFirst_name(first_name);
            subscriber.setLast_name(last_name);
            subscriber.setAddress(address);
            subscriber.setEmail(email);
            subscriber.setPhone_no(phone_no);
            String msg = SubscriberDAO.update(subscriber);
            httpSession.setAttribute("message", msg);
            response.sendRedirect("profile.jsp");

        }
    }
}

