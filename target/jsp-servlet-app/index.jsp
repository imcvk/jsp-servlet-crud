<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Home Page</title>
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
          height: 100%;
      }
  </style>
</head>
<body>

<div class="center-div">
  <form>
    <table>
      <tr>
        <%if (session.getAttribute("subscriber")==null) {%>
        <td>
          <a href="login.jsp"><h2>Login</h2></a>
        </td>
        <%
        } else {
        %>
        <td>
          <a href="profile.jsp"><h2>My Profile</h2></a>
        </td>
        <%}%>
      </tr>
      <tr>
        <td>
          <a href="addSubscriberPage.jsp"><h2>Add subscriber</h2></a>
        </td>
      </tr>
      <tr>
        <%if (!(session.getAttribute("subscriber")==null)) {%>
        <td>
          <a href="logout.jsp"><h2>Logout</h2></a>
        </td>
        <%
          }
        %>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
