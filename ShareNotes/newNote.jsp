<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>New Note</title>
        <link href="./assets/css/templateAfterLogin.css" rel="stylesheet" />
    </head>

    <body>
        <div class="navbar">
            <a href="./home.jsp" style="padding:0;"><p>Home</p></a>
            <a href="./newNote.jsp" style="margin:0px 10px 0px 30px;padding:0px;border-bottom: 1px solid black;"><p>New Note</p></a>
            <a href="./myProfile.jsp" style="margin:0px 0px 0px 20px;padding:0px;"><p>My Profile</p></a>
            <a href="./doLogout.jsp" style="margin:0px 0px 0px 20px;padding:0px;"><p>Log Out</p></a>
        </div>

        <div id="app" >
            <form method="post" action="./doNewNoteInsert.jsp">
                <section class="auth-box shadow" style="background:white;width:60%;">
                    <div style="width:80%;margin-left:10%;">
                        <h4>title</h4>
                        <input type="text" name="title">
                        <h4>new note</h4>
                        <textarea cols="30" rows="10" style="margin: 0px;height:15%;padding-top: 1%;padding-bottom: 1%;" name="noteFill">
                        </textarea>
                        <% 
                            String errMsg = request.getParameter("errMsg"); 
                            if(errMsg != null){
                                %>
                                    <p style="color: red; font-size:10pt;margin-top: 2%;margin-bottom: 0;">
                                        * <%= errMsg %>
                                    </p>
                                <%
                            }
                        %>
                        <button type="submit" style="width:100%;" class="blue text-center">add new note</button>
                    </div>
                    
                </section>
            </form>
        </div>
    </body>
</html>