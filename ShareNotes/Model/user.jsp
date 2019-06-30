<%
    class User{
        private int userID;
        private String name;
        private String email;
        private String password;

        User(int userID,String name,String email,String password){
            this.userID = userID;
            this.email = email;
            this.password = password;
            this.name = name;
        }

        int getUserID() {
            return this.userID;
        }

        String getName() {
            return this.name;
        }

        String getPassword() {
            return this.password;
        }

        String getEmail() {
            return this.email;
        }
    }
%>