<%@ page import="java.sql.*"%>
<%@ include file = "/connect.jsp"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    if(name == null || name.isEmpty()){
        response.sendRedirect("./register.jsp?errMsg=Name must be filled!");
    }else if(email == null || email.isEmpty()){
        response.sendRedirect("./register.jsp?errMsg=Email must be filled!");
    }else if(password == null || password.isEmpty()){
        response.sendRedirect("./register.jsp?errMsg=Password must be filled!");
    }else{
        String query = "INSERT INTO users VALUES(null, ?, ?, ?)";
        PreparedStatement preStmt = connection.prepareStatement(query);
        preStmt.setString(1,name);
        preStmt.setString(2,email);
        preStmt.setString(3,password);
        preStmt.executeUpdate();
        response.sendRedirect("./login.jsp"); 
    }
%>