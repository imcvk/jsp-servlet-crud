<%--
  Created by IntelliJ IDEA.
  User: imcvk
  Date: 1/17/2023
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Add Subscriber</title>
  <style>
      table {
          font-family: arial, sans-serif;
          border-collapse: collapse;

      }

      td, th {
          border: 1px solid #dddddd;
          text-align: left;
          padding: 8px;
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

<div class="center-div">
  <form action="AddSubscriberServlet" method="post">
    <h1>Subscriber Registration Page</h1>
    <table>
      <tr>
        <td>
          <label for="fname">First name:</label></td>
        <td>
          <input name="fname" type="text" id="fname">
        </td>
      </tr>
      <tr>
        <td>
          <label for="lname">Last name:</label>
        </td>
        <td>
          <input name="lname" type="text" id="lname">
        </td>
      </tr>
      <tr>
        <td>
          <label for="dob">Date of birth:</label>
        </td>
        <td>
          <input type="date" name="dob" id="dob"></td>
        </td>
      </tr>
      <tr>
        <td>
          <label for="doj">Date of joining</label>
        </td>
        <td>
          <input type="date" name="doj" id="doj">
        </td>
      </tr>
      <tr>
        <td>
          <label for="address">Address:</label>
        </td>
        <td>
          <textarea name="address" type="" id="address"></textarea>
        </td>
      </tr>
      <tr>
        <td>
          <label for="email">Email:</label>
        </td>
        <td>
          <input name="email" type="email" id="email">
        </td>
      </tr>
      <tr>
        <td>
          <label>Gender:</label>
        </td>
        <td>
          <input type="radio" id="male" name="gender" value="Male">
          <label for="male">Male</label><br>
          <input type="radio" id="female" name="gender" value="Female">
          <label for="female">Female</label><br>
        </td>
      </tr>
      <tr>
        <td>
          <label for="phno">Phone No:</label>
        </td>
        <td>
          <input name="phno" type="tel" id="phno" maxlength="10">
        </td>
      </tr>
      <tr>
        <td>
          <label for="username">Username:</label>
        </td>
        <td>
          <input name="username" type="text" id="username">
        </td>
      </tr>
      <tr>
        <td>
          <label for="password">Password:</label>
        </td>
        <td>
          <input name="password" type="text" id="password">
        </td>
      </tr>
      <tr>
        <td>
          <label for="cpassword">Confirm Password:</label>
        </td>
        <td>
          <input name="cpassword" type="text" id="cpassword">
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
<a href="index.jsp">Homepage</a>
</body>
</html>
