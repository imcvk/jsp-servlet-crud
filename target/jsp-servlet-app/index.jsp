<%--
  Created by IntelliJ IDEA.
  User: imcvk
  Date: 1/17/2023
  Time: 11:02 AM
  To change this template use File | Settings | File Templates.
--%>
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
                    <td>
                        <a href="assets/login.jsp"><h2>Login</h2></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="assets/addSubscriberPage.jsp"><h2>Add subscriber</h2></a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
