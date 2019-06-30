<%@ page import="java.sql.*"%>
<%@ include file = "/connect.jsp"%>
<%
    int noteID = Integer.parseInt(request.getParameter("noteID"));
    String email = request.getParameter("email");
    int fromUserID = 0;
    int toUserID = 0;

    String query = "SELECT userid from notes where noteID="+noteID;
    ResultSet rs = stmt.executeQuery(query);
    while(rs.next()){
        fromUserID = rs.getInt(1);
    }

    String query2 = "SELECT userid from users where email='"+email+"'";
    ResultSet rs2 = stmt.executeQuery(query2);
    while(rs2.next()){
        toUserID = rs2.getInt(1);
    }


    String query3 = "INSERT INTO sharenotes VALUES(null, ?, ? , ?)";
    PreparedStatement preStmt = connection.prepareStatement(query3);
    preStmt.setInt(1,noteID);
    preStmt.setInt(2,fromUserID);
    preStmt.setInt(3,toUserID);
    preStmt.executeUpdate();
    
    response.sendRedirect("./home.jsp");
%>