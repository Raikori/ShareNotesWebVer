<%@ page import="java.sql.*"%>
<%@ include file = "/connect.jsp"%>
<%
    String content = request.getParameter("content");
    int noteID = Integer.parseInt(request.getParameter("noteID"));

    String query = "UPDATE notes SET content = ? where noteID = ?";
    PreparedStatement preStmt = connection.prepareStatement(query);
    preStmt.setString(1,content);
    preStmt.setInt(2,noteID);
    preStmt.executeUpdate();
    
    response.sendRedirect("./viewNote.jsp?noteID="+noteID);
%>