<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Sign Up</title>
        <link href="./assets/css/templateLogin.css" rel="stylesheet" />
    </head>

    <body>
        <div id="app">
            <section class="auth-box shadow" id="app">
                <section class="box-color">
                    <img src="./assets/image/2.jpg" width="40%" height="40%">
                    <h5 style="padding:0% 10% 0% 10%;text-align:center;">Share Note helps you create notes, capture and prioritize ideas, so nothing falls through the cracks.</h5>
                    <a href="./login.jsp"><button type="button" class="register-btn pink text-center">sign in here</button></a>
                </section>
                <section class="register">
                    <section class="header">
                        <h2>Share Notes</h2>
                    </section>
                    <section class="body">
                        <form action="./doRegister.jsp" method="post">
                            <label for="name">
                                <input type="text" name="name" placeholder="full name">
                            </label>
                            <label for="email">
                                <input type="text" name="email" placeholder="email">
                            </label>
                            <label for="password">
                                <input type="password" name="password" placeholder="password">
                            </label>
                            <% 
                                String errMsg = request.getParameter("errMsg"); 
                                if(errMsg != null){
                                    %>
                                        <p style="color: red; font-size:10pt;margin-top: 2%;">
                                            * <%= errMsg %>
                                        </p>
                                    <%
                                }
                            %>
                            <label class="d-flex flex-column">
                                <button type="submit" class="blue text-center">sign up</button>
                            </label>
                        </form>
                    </section>
                </section>
            </section>
        </div>
        
    </body> 
</html>