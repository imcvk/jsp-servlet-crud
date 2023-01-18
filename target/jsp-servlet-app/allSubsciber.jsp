<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Subscriber" %>
<%@ page import="dao.SubscriberDAO" %><%--
  Created by IntelliJ IDEA.
  User: imcvk
  Date: 18/01/23
  Time: 5:19 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>All Subscriber</title>
  <style>
      table {
          font-family: arial, sans-serif;
          border-collapse: collapse;
          width: 100%;
      }

      td, th {
          border: 1px solid #dddddd;
          text-align: left;
          padding: 8px;
      }

      tr:nth-child(even) {
          background-color: #dddddd;
      }

      .center-div {
          display: flex;
          align-items: center;
          justify-content: center;

      }
  </style>
</head>
<body>
<div class="center-div">
  <table>
    <thead>
    <tr>
      <td><b>subscriberid</b></td>
      <td><b>fname</b></td>
      <td><b>lname</b></td>
      <td><b>email</b></td>
      <td><b>phno</b></td>
      <td><b>address</b></td>
      <td><b>gender</b></td>
      <td><b>username</b></td>
      <td><b>dob</b></td>
      <td><b>doj</b></td>
    </tr>
    </thead>
    <%
      ArrayList<Subscriber> subscribers = SubscriberDAO.getAllSubscriber();
      for (Subscriber s : subscribers) {
    %>
    <tr>
      <td><%=s.getSubscriberId()%>
      </td>
      <td><%=s.getFirst_name()%>
      </td>
      <td><%=s.getLast_name()%>
      </td>
      <td><%=s.getEmail()%>
      </td>
      <td><%=s.getPhone_no()%>
      </td>
      <td><%=s.getAddress()%>
      </td>
      <td><%=s.getGender()%>
      </td>
      <td><%=s.getUsername()%>
      </td>
      <td><%=s.getDate_of_birth()%>
      </td>
      <td><%=s.getDate_of_joining()%>
      </td>
    </tr>
    <%}%>
  </table>
</div>
<div>
  <h3><a href="profile.jsp">Profile</a></h3><br>
  <h3><a href="index.jsp">HomePage</a></h3><br>
</div>
</body>
</html>
