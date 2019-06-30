<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file = "./connect.jsp"%>
<%@ include file = "/Model/note.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Home</title>
        <link href="./assets/css/templateAfterLogin.css" rel="stylesheet" />
    </head>

    <body>
        <div class="navbar">
            <a href="./home.jsp" style="padding:0;border-bottom: 1px solid black;"><p>Home</p></a>
            <a href="./newNote.jsp" style="margin:0px 10px 0px 30px;padding:0px;"><p>New Note</p></a>
            <a href="./myProfile.jsp" style="margin:0px 0px 0px 20px;padding:0px;"><p>My Profile</p></a>
            <a href="./doLogout.jsp" style="margin:0px 0px 0px 20px;padding:0px;"><p>Log Out</p></a>
        </div>

        <div id="app" style="margin-top: 5%;">
            <%
                String userID = session.getAttribute("userID").toString();
                Vector<Note> vecNote = new Vector<Note>();
                String query = "SELECT noteid, n.userid, title, content, DATE_FORMAT(postedDate, '%d / %m / %Y') , name FROM notes n join users u on u.userid = n.userID where n.userid = "+userID+" or n.noteid in (select noteid from sharenotes where touserid =  "+userID+")";
                ResultSet rs = stmt.executeQuery(query);

                while(rs.next()){
                    vecNote.add(
                        new Note(
                            rs.getInt(1),
                            rs.getInt(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6)
                        )
                    );
                }
            %>
            <section class="auth-box">
                <%
                    if(vecNote.size() > 0){
                        %>
                        <div class="row">
                        <%
                        for(int i = 1;i <= vecNote.size() ; i++){
                            %>
                            <div class="card column">
                                <div class="products">
                                    <h1 class="title"><%= vecNote.get(i-1).getTitle() %></h1>
                                    <p style="font-size:8pt;color:#616161;margin: 0px 0px 5px 0px;"><%= vecNote.get(i-1).getPostedDate() %></p>
                                    <p style="font-size:8pt;color:#616161;margin:0;"><%= vecNote.get(i-1).getName() %></p>
                                    <p class="description"><%= vecNote.get(i-1).getContent() %></p>
                                </div>
                                <div class="footerAction">
                                    <a class="btn" id="prev" href="?noteID=<%= vecNote.get(i-1).getNoteID() %>#sharePopUp">SHARE</a>
                                    <a class="btn" id="next" href="./viewNote.jsp?noteID=<%= vecNote.get(i-1).getNoteID() %>">VIEW</a>
                                </div>
                            </div>
                            <%
                            if(i % 3 == 0){
                            %>
                            </div>
                            <div class="row">
                            <%
                            }
                        }
                        %>
                        </div>
                        <%
                    }else{
                        out.println("There's no notes");
                    }
                %>
            </section>
        </div>
        <div id="sharePopUp" class="overlay">
            <div class="popup">
                <h2 style="text-align: center;">SHARE</h2>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    <form method="post" action="./doHomeShare.jsp">
                        <div style="width:60%;">
                            <%
                                String noteID = request.getParameter("noteID");
                            %>
                            <input type="hidden" name="noteID" value="<%= noteID %>">
                            <h4>email</h4>
                            <input type="text" name="email">
                            <button type="submit" style="width:100%;" class="blue text-center">share this note</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>