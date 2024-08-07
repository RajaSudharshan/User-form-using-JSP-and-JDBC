<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
    String name = request.getParameter("name");
    String ageStr = request.getParameter("age");
    
    if (name == null || name.isEmpty() || ageStr == null || ageStr.isEmpty()) {
        out.println("<div class='container'><p>Error: Name and Age are required fields.</p></div>");
        return;
    }

    int age = Integer.parseInt(ageStr);

    // JDBC connection details
    String dbUrl = "jdbc:mysql://localhost:3306/userdb";
    String dbUser = "root"; // Replace with your MySQL username
    String dbPassword = "root"; // Replace with your MySQL password

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection
        connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Create SQL insert statement
        String sql = "INSERT INTO users (name, age) VALUES (?, ?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, name);
        preparedStatement.setInt(2, age);

        // Execute the insert statement
        int rowsAffected = preparedStatement.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submission Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        p {
            margin: 20px 0;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Submitted Information</h1>
        <p>Name: <%= name %></p>
        <p>Age: <%= age %></p>
        <p>Data successfully inserted into the database.</p>
    </div>
</body>
</html>
<% 
    } catch (ClassNotFoundException | SQLException e) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submission Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        h1 {
            color: #e74c3c;
        }
        p {
            margin: 20px 0;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Submission Error</h1>
        <p>Database error: <%= e.getMessage() %></p>
    </div>
</body>
</html>
<% 
    } finally {
        // Close resources
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submission Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        h1 {
            color: #e74c3c;
        }
        p {
            margin: 20px 0;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Submission Error</h1>
        <p>Database error: <%= e.getMessage() %></p>
    </div>
</body>
</html>
<%
        }
    }
%>
