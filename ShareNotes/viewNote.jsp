<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file = "./connect.jsp"%>
<%@ include file = "/Model/share.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>View Note</title>
        <link href="./assets/css/templateAfterLogin.css" rel="stylesheet" />
    </head>

    <body>
        <%
            String userID = session.getAttribute("userID").toString();
            String noteID = request.getParameter("noteID");
            String title = "";
            String content = "";
            String postedDate = "";
            String fromUserName = "";
            Vector<Share> vecShare = new Vector<Share>();

            String query = "SELECT title,content,DATE_FORMAT(postedDate, '%d / %m / %Y'),name from notes n join users u on u.userid = n.userid where noteId = "+noteID;
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                title = rs.getString(1);
                content = rs.getString(2);
                postedDate = rs.getString(3);
                fromUserName = rs.getString(4);
            }

            String query2 = "SELECT noteid, shareid, touserid, name, email FROM sharenotes s join users u on u.userid = s.touserid where noteid = "+noteID;
            ResultSet rs2 = stmt.executeQuery(query2);
            while(rs2.next()){
                vecShare.add(
                    new Share(
                        rs2.getInt(1),
                        rs2.getInt(2),
                        rs2.getInt(3),
                        rs2.getString(4),
                        rs2.getString(5)
                    )
                );
            }
        %>
        <div class="navbar">
            <a href="./home.jsp" style="padding:0;border-bottom: 1px solid black;"><p>Home</p></a>
            <a href="./newNote.jsp" style="margin:0px 10px 0px 30px;padding:0px;"><p>New Note</p></a>
            <a href="./myProfile.jsp" style="margin:0px 0px 0px 20px;padding:0px;"><p>My Profile</p></a>
            <a href="./doLogout.jsp" style="margin:0px 0px 0px 20px;padding:0px;"><p>Log Out</p></a>
        </div>

        <div id="app" >
            <form method="post" action="./doViewNoteUpdate.jsp?noteID=<%=noteID%>">
                <section class="auth-box shadow" style="background:white;width:60%;">
                    <div style="width:80%;margin-left:10%;">
                        <h2 style="text-align: center;"><%= title %></h2>
                        <p style="font-size:8pt;color:#616161;margin: 0px 0px 5px 0px;text-align:center;"><%= postedDate %></p>
                        <p style="font-size:8pt;color:#616161;margin:0;text-align:center;"><%= fromUserName %></p>
                                    
                        <h4 style="margin-bottom:2%;">shared with: </h4>
                        <%
                        if(vecShare.size() > 0){
                            for(int i = 0;i < vecShare.size() ; i++){
                                %>
                                <h6 style="margin:1%;"><%= vecShare.get(i).getToUserName() %> - <%= vecShare.get(i).getToUserEmail() %></h6>
                                <%
                            }
                        }else{
                            %>
                            <h6 style="margin:1%;">-</h6> 
                            <%
                        }
                        %>
                        <h4 style="margin-top:5%;"></h4>
                        <textarea style="padding:3%;height: 300px;" type="text" name="content"><%= content %></textarea>
                        <button type="submit" style="width:100%;" class="blue text-center">update notes</button>
                    </div>
                </section>
            </form>
        </div>
    </body>
</html>