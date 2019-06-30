<%@ page import="java.sql.*"%>
<%
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webTeori", "root", "");
    Statement stmt = connection.createStatement(1004,1008);

%>
