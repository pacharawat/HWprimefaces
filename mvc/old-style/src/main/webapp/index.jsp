<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Old Style</title>
    </head>
    <body>
        <%
            String q = request.getParameter("q");
            q = q == null ? "" : q;
            String query = "%" + q.toLowerCase() + "%";

            String searchBy = request.getParameter("search_by");
        %>    
        <h1>Employees</h1>
        <form method="post" action="index.jsp">
            <input id="query" type="text" name="q" value="<%= q.replace("%", "")%>"/>
            <select name="search_by">
                <option value="name" <%= "name".equals(searchBy) ? "selected" : ""%>>name</option>
                <option value="email" <%= "email".equals(searchBy) ? "selected" : ""%>>email</option>
                <option value="phone" <%= "phone".equals(searchBy) ? "selected" : ""%>>phone</option>
                <option value="salary" <%= "salary".equals(searchBy) ? "selected" : ""%>>salary</option>
            </select>
            <button type="submit">Search</button>
            <button type="submit" onclick="document.getElementById('query').value = '';">clear</button>
        </form>
        <table>
            <thead>
                <tr>
                    <td>no.</td>
                    <td>employee id</td>
                    <td>first name</td>
                    <td>last name</td>
                    <td>email</td>
                    <td>phone number</td>
                    <td>salary</td>
                    <td>show data</td>
                </tr>
            </thead>
            <tbody>
                <%
                    Class.forName("oracle.jdbc.OracleDriver");

                    Connection connection = null;
                    PreparedStatement statement = null;
                    ResultSet resultSet = null;
                    try {
                        connection = DriverManager.getConnection(
                                "jdbc:oracle:thin:@localhost:1521:cpe4235",
                                "HR",
                                "HR"
                        );

                        if (!q.isEmpty()) {
                            if ("name".equals(searchBy)) {
                                statement = connection.prepareStatement("SELECT * FROM Employees WHERE LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?");
                                statement.setString(1, query);
                                statement.setString(2, query);
                            } else if ("email".equals(searchBy)) {
                                statement = connection.prepareStatement("SELECT * FROM Employees WHERE LOWER(email) LIKE ?");
                                statement.setString(1, query);
                            } else if ("phone".equals(searchBy)) {
                                statement = connection.prepareStatement("SELECT * FROM Employees WHERE LOWER(phone_number) LIKE ?");
                                statement.setString(1, query);
                            } else if ("salary".equals(searchBy)) {
                                statement = connection.prepareStatement("SELECT * FROM Employees WHERE LOWER(salary) LIKE ?");
                                statement.setString(1, query);
                            }
                        } else {
                            statement = connection.prepareStatement("SELECT * FROM Employees");
                        }

                        resultSet = statement.executeQuery();

                        int counter = 1;
                        while (resultSet.next()) {
                %>
                <tr <%= "id=\"row:" + resultSet.getInt("employee_id") + "\""%>>
                    <td><%= counter++%></td>
                    <td><%= resultSet.getInt("employee_id")%></td>
                    <td><%= resultSet.getString("first_name")%></td>
                    <td><%= resultSet.getString("last_name")%></td>
                    <td><%= resultSet.getString("email")%></td>
                    <td><%= resultSet.getString("phone_number")%></td>
                    <td><%= resultSet.getDouble("salary")%></td>
                    <td>
                        <a href="#" onclick="showData(<%= resultSet.getInt("employee_id")%>);
                                return false;">show data</a>
                    </td>
                <tr/>
                <%
                        }
                    } finally {
                        if (resultSet != null) {
                            resultSet.close();
                        }

                        if (statement != null) {
                            statement.close();
                        }

                        if (connection != null) {
                            connection.close();
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
    <script>
        function showData(id) {
            var tr = document.getElementById("row:" + id);
            var nodes = tr.childNodes;
            var data = [];
            for (var i = 0; i < nodes.length; i++) {
                var node = nodes[i];
                if (node.nodeType === 1 && node.innerText !== 'show data') {
                    data.push(node.innerText);
                }
            }

            alert(data.join(', '));
        }
    </script>
    <style>
        table{
            border-collapse: collapse;
            margin-top: 20px;
        }

        td, th{
            padding: 10px;
        }

        td{
            border : solid 1px #eee;
        }

        thead > tr{
            background-color: #fafafa;
        }

        form input{
            padding: 3px 10px;
            border : solid 1px #ddd;
        }
    </style>
</html>
