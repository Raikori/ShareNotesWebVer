<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file = "./connect.jsp"%>
<%@ include file = "/Model/user.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>My Profile</title>
        <link href="./assets/css/templateAfterLogin.css" rel="stylesheet" />
    </head>

    <body>
        <%
            String name = "";
            String email = "";
            String userID = session.getAttribute("userID").toString();
            String query = "SELECT * from users where userid = " + userID;
            ResultSet rs = stmt.executeQuery(query);

            while(rs.next()){
                name = rs.getString(2);
                email = rs.getString(3);
            }
        %>
        <div class="navbar">
            <a href="./home.jsp" style="padding:0;"><p>Home</p></a>
            <a href="./newNote.jsp" style="margin:0px 10px 0px 30px;padding:0px;"><p>New Note</p></a>
            <a href="./myProfile.jsp" style="margin:0px 0px 0px 20px;padding:0px;border-bottom: 1px solid black;"><p>My Profile</p></a>
            <a href="./doLogout.jsp" style="margin:0px 0px 0px 20px;padding:0px;"><p>Log Out</p></a>
        </div>

        <div id="app" >
            <form method="post" action="./doMyProfileUpdate.jsp">
                <section class="auth-box shadow" style="background:white;width:60%;">
                    <div style="width:80%;margin-left:10%;">
                        <h4>name</h4>
                        <input type="text" name="name" value="<%= name %>">
                        <h4>email</h4>
                        <input type="text" name="email" value="<%= email %>">
                        <h4>password</h4>
                        <input type="password" name="password">
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
                        <button type="submit" style="width:100%;" class="blue text-center">update profile</button>
                    </div>
                </section>
            </form>
        </div>
    </body>
</html>