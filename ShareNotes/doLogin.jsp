<%@ page import="java.sql.*"%>
<%@ include file = "/connect.jsp"%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if(email == null || email.isEmpty()){
        response.sendRedirect("./login.jsp?errMsg=Email must be filled!");
    }else if(password == null || password.isEmpty()){
        response.sendRedirect("./login.jsp?errMsg=Password must be filled!");
    }else{
        ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE email = '" + email + "' and password ='" + password +"'");
        if(!rs.isBeforeFirst()) response.sendRedirect("./login.jsp?errMsg=Username and password didnt match!");
        else{
            while(rs.next()){
                session.setAttribute ( "userID" , rs.getInt(1)); 
                session.setAttribute ( "userName" , rs.getString(2));  
                response.sendRedirect("./home.jsp"); 
            } 
        }
        
    }
%>