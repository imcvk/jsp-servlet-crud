<%@ page import="model.Subscriber" %>
<%@ page import="dao.SubscriberDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %><%--
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
      table {
          font-family: arial, sans-serif;
          border-collapse: collapse;
      }

      td, th {
          border: 1px solid #dddddd;
          text-align: left;
          padding: 10px;
      }

      tr:nth-child(even) {
          background-color: #dddddd;
      }

      .center-div {
          display: flex;
          align-items: center;
          justify-content: center;
          width: 100%;
      }
  </style>
</head>
<body>
<%
  Subscriber subscriber = SubscriberDAO.getSubscriber(session.getAttribute("username").toString());
  String subscriberid = subscriber.getSubscriberId();
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
  <form action="UpdateServlet" method="post">
    <h1>Update User details</h1>
    <table>
      <tr>
        <td>
          <label for="fname">First name:</label></td>
        <td>
          <input name="fname" type="text" id="fname" value="<%=first_name%>">
        </td>
      </tr>
      <tr>
        <td>
          <label for="lname">Last name:</label>
        </td>
        <td>
          <input name="lname" type="text" id="lname" value="<%=last_name%>">
        </td>
      </tr>
      <tr>
        <td>
          <label for="dob">Date of birth:</label>
        </td>
        <td>
          <input type="text" name="dob" id="dob" value="<%=date_of_birth%>"></td>
        </td>
      </tr>
      <tr>
        <td>
          <label for="doj">Date of joining</label>
        </td>
        <td>
          <input type="text" name="doj" id="doj" value="<%=date_of_joining%>">
        </td>
      </tr>
      <tr>
        <td>
          <label for="address">Address:</label>
        </td>
        <td>
          <input type="text" name="address" id="address" value="<%=address%>"></input>
        </td>
      </tr>
      <tr>
        <td>
          <label for="email">Email:</label>
        </td>
        <td>
          <input name="email" type="email" id="email" value="<%=email%>">
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
          <input type="radio" id="male" name="gender" value="Male" checked>
          <label for="male">Male</label><br>
          <input type="radio" id="female" name="gender" value="Female">
          <label for="female">Female</label><br>
          <%
          } else {
          %>
          <input type="radio" id="male" name="gender" value="Male">
          <label for="male">Male</label><br>
          <input type="radio" id="female" name="gender" value="Female" checked>
          <label for="female">Female</label><br>
          <%}%>
        </td>
      </tr>
      <tr>
        <td>
          <label for="phno">Phone No:</label>
        </td>
        <td>
          <input name="phno" type="tel" maxlength="10" id="phno" value="<%=phno%>">
        </td>
      </tr>
      <tr>
        <td>
          <label for="username">Username:</label>
        </td>
        <td>
          <input name="username" type="text" id="username" value="<%=username%>" readOnly=”true”>
        </td>
      </tr>
      <tr>
        <td>
          <label for="subscriberid">subscriberid:</label>
        </td>
        <td>
          <input name="subscriberid" type="text" id="subscriberid" value="<%=subscriberid%>" readOnly=”true”>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <input type="submit" value="Submit">
          <input type="reset" value="Reset">
        </td>
      </tr>
    </table>
  </form>

</div>

</body>
</html>
