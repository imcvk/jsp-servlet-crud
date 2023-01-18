package controller;

import dao.SubscriberDAO;
import model.Subscriber;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AllSubscriberServlet", value = "/AllSubscriberServlet")
public class AllSubscriberServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Subscriber> subscribers = SubscriberDAO.getAllSubscriber();
        HttpSession httpSession = request.getSession();
        RequestDispatcher dispatcher = null;
        if (!subscribers.isEmpty()) {
            httpSession.setAttribute("subscriberList", subscribers);
            dispatcher = request.getRequestDispatcher("allSubsciber.jsp");

        } else {
            httpSession.setAttribute("loginError", "No Subscriber Added");
            dispatcher = request.getRequestDispatcher("errorPage.jsp");
        }
        dispatcher.forward(request, response);
    }
}
