<%@ page import="java.sql.*"%>
<%@ include file = "/connect.jsp"%>
<%
    String title = request.getParameter("title");
    String noteFill = request.getParameter("noteFill");
    String userID = session.getAttribute("userID").toString();

    if(title == null || title.isEmpty()){
        response.sendRedirect("./newNote.jsp?errMsg=Title must be filled!");
    }else if(noteFill == null || noteFill.isEmpty()){
        response.sendRedirect("./newNote.jsp?errMsg=New Note must be filled!");
    }else{
        String query = "INSERT INTO notes VALUES(null, ?, ? , ?, now())";
        PreparedStatement preStmt = connection.prepareStatement(query);
        preStmt.setString(1,userID);
        preStmt.setString(2,title);
        preStmt.setString(3,noteFill);
        preStmt.executeUpdate();
        
        response.sendRedirect("./home.jsp");
    }
%>