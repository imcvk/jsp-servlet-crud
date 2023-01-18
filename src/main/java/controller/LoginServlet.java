package controller;

import dao.SubscriberDAO;
import model.Subscriber;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession(true);
        RequestDispatcher dispatcher = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Subscriber subscriber = new Subscriber();
        subscriber.setSubscriberId(username);
        subscriber.setPassword(password);
        String authentication = SubscriberDAO.validateUser(subscriber);
        if (authentication.equals("true")) {
            httpSession.setAttribute("username", username);
            httpSession.setAttribute("password", password);
            httpSession.setAttribute("subscriber", subscriber);
            dispatcher = request.getRequestDispatcher("welcomePage.jsp");
            dispatcher.forward(request, response);
        } else {
            httpSession.setAttribute("loginError", authentication);
            dispatcher = request.getRequestDispatcher("errorPage.jsp");
            dispatcher.forward(request, response);
        }
    }
}
