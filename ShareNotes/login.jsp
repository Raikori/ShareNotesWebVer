<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Sign In</title>
        <link href="./assets/css/templateLogin.css" rel="stylesheet" />
    </head>

    <body>
        <div id="app">
            <section class="auth-box shadow" id="app">
                <section class="login">
                    <section class="header">
                        <h2>Share Notes</h2>
                    </section>
                    <section class="body">
                        <form action="./doLogin.jsp" method="post">
                            <label for="email">
                                <div class="w-100 text-right blue-color"><i class="far fa-envelope"></i></div>
                                <input type="text" name="email" placeholder="email">
                            </label>
                            <label for="password">
                                <div class="w-100 text-right blue-color"><i class="fas fa-lock"></i></div>
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
                                <button type="submit" class="blue text-center">sign in</button>
                            </label>
                        </form>
                    </section>
                </section>
                <section class="box-color">
                    <img src="./assets/image/2.jpg" width="40%" height="40%">
                    <h5 style="padding:0% 10% 0% 10%;text-align:center;">Share Note helps you create notes, capture and prioritize ideas, so nothing falls through the cracks.</h5>
                    <a href="./register.jsp"><button type="button" class="register-btn pink text-center">sign up here</button></a>
                </section>
            </section>
        </div>
        
    </body>
</html>