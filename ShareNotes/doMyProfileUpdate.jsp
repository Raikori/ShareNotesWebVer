<%@ page import="java.sql.*"%>
<%@ include file = "/connect.jsp"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    int userID = Integer.parseInt(session.getAttribute("userID").toString());

    if(name == null || name.isEmpty()){
        response.sendRedirect("./myProfile.jsp?errMsg=Name must be filled!");
    }else if(email == null || email.isEmpty()){
        response.sendRedirect("./myProfile.jsp?errMsg=Email must be filled!");
    }else if(password == null || password.isEmpty()){
        response.sendRedirect("./myProfile.jsp?errMsg=Password must be filled!");
    }else{
        String query = "UPDATE users SET name = ?, email = ?, password = ? where userID = ?";
        PreparedStatement preStmt = connection.prepareStatement(query);
        preStmt.setString(1,name);
        preStmt.setString(2,email);
        preStmt.setString(3,password);
        preStmt.setInt(4,userID);
        preStmt.executeUpdate();
        
        response.sendRedirect("./myProfile.jsp");
    }
%>