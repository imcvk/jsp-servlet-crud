<%@ page import="model.Subscriber" %>
<%@ page import="dao.SubscriberDAO" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%--
  Created by IntelliJ IDEA.
  User: imcvk
  Date: 17/01/23
  Time: 4:35 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>My Profile</title>
  <style>
      .center-div {
          display: flex;
          align-items: center;
          justify-content: center;

      }
  </style>
</head>
<body>
<%
  Subscriber subscriber = SubscriberDAO.getSubscriber(session.getAttribute("username").toString());
  String first_name = subscriber.getFirst_name();
  String last_name = subscriber.getLast_name();
  String date_of_birth = formatDateTo_dd_MM_yyyy(subscriber.getDate_of_birth());
  String date_of_joining = formatDateTo_dd_MM_yyyy(subscriber.getDate_of_joining());
  String address = subscriber.getAddress();
  String email = subscriber.getEmail();
  String gender = subscriber.getGender();
  String username = subscriber.getUsername();
  long phno = subscriber.getPhone_no();

%>
<%!
  public static String formatDateTo_dd_MM_yyyy(java.util.Date date) {
    String dateToBeFormatted = date.toString();
    DateFormat formatter = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");
    DateFormat formatTo = new SimpleDateFormat("MM-dd-YYYY");
    java.util.Date date1 = null;
    try {
      date1 = (java.util.Date) formatter.parse(dateToBeFormatted);
    } catch (ParseException e) {
      throw new RuntimeException(e);
    }
    String finalDate = formatTo.format(date1);
    return finalDate;
  }
%>
<div class="center-div">
  <form action="AddSubscriberServlet" method="post">
    <h1>User details</h1>
    <table>
      <tr>
        <td>
          <label for="fname">First name:</label></td>
        <td>
          <input name="fname" type="text" id="fname" value="<%=first_name%>" disabled>
        </td>
      </tr>
      <tr>
        <td>
          <label for="lname">Last name:</label>
        </td>
        <td>
          <input name="lname" type="text" id="lname" value="<%=last_name%>" disabled>
        </td>
      </tr>
      <tr>
        <td>
          <label for="dob">Date of birth:</label>
        </td>
        <td>
          <input type="text" name="dob" id="dob" value="<%=date_of_birth%>" disabled></td>
        </td>
      </tr>
      <tr>
        <td>
          <label for="doj">Date of joining</label>
        </td>
        <td>
          <input type="text" name="doj" id="doj" value="<%=date_of_joining%>" disabled>
        </td>
      </tr>
      <tr>
        <td>
          <label for="address">Address:</label>
        </td>
        <td>
          <input type="text" name="address" id="address" value="<%=address%>" disabled></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="email">Email:</label>
        </td>
        <td>
          <input name="email" type="email" id="email" value="<%=email%>" disabled>
        </td>
      </tr>
      <tr>
        <td>
          <label>Gender:</label>
        </td>
        <td>
          <%
            if (gender.equalsIgnoreCase("male")) {
          %>
          <input type="radio" id="male" name="gender" value="Male" checked disabled>
          <label for="male">Male</label><br>
          <%
          } else {
          %>
          <input type="radio" id="female" name="gender" value="Female" checked disabled>
          <label for="female">Female</label><br>
          <%}%>
        </td>
      </tr>
      <tr>
        <td>
          <label for="phno">Phone No:</label>
        </td>
        <td>
          <input name="phno" type="tel" id="phno" maxlength="10" value="<%=phno%>" disabled>
        </td>
      </tr>
      <tr>
        <td>
          <label for="username">Username:</label>
        </td>
        <td>
          <input name="username" type="text" id="username" value="<%=username%>" disabled>
        </td>
      </tr>
    </table>
  </form>
</div>
<label>Need to update details?<a href="updateSubscriber.jsp">click here..</a></label><br>
<a href="index.jsp">Homepage</a>
</body>
</html>
