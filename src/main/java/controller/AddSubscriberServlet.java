package controller;

import dao.SubscriberDAO;
import model.Subscriber;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@WebServlet(name = "AddSubscriberServlet", value = "/AddSubscriberServlet")
public class AddSubscriberServlet extends HttpServlet {
    PrintWriter printWriter;
    private Subscriber subscriber;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        RequestDispatcher dispatcher = null;
        String first_name = request.getParameter("fname");
        String last_name = request.getParameter("lname");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("cpassword");
        long phone_no = Long.parseLong(request.getParameter("phno"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date_of_birth, date_of_joining;
        String subscriber_id = generateSubscriberId(10, first_name, last_name);
        try {
            date_of_birth = sdf.parse(request.getParameter("dob"));
            date_of_joining = sdf.parse(request.getParameter("doj"));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        if (password.equals(confirm_password)) {
            subscriber = new Subscriber(subscriber_id, first_name, last_name, date_of_birth, date_of_joining, address, email, gender, phone_no, username, password);
            int i = SubscriberDAO.insert(subscriber);
            if (i != 1) {
                httpSession.setAttribute("", "Registration failed");
            } else {
                httpSession.setAttribute("message", "User created,Please not down your subscriber id" + subscriber_id + "" +
                        "and login again");
                response.sendRedirect("login.jsp");
            }
        } else {
            httpSession.setAttribute("message", "Password and Confirm Password does not match");
            dispatcher = request.getRequestDispatcher("errorPage.jsp");
            dispatcher.forward(request, response);
        }
    }

    public static String generateSubscriberId(int n, String string1, String string2) {
        Random rand = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < n; i++) {
            int randomIndex = rand.nextInt(2);
            if (randomIndex == 0) {
                sb.append(string1.charAt(rand.nextInt(string1.length())));
            } else {
                sb.append(string2.charAt(rand.nextInt(string2.length())));
            }
        }
        return sb.toString();
    }
}
