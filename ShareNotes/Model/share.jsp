<%
    class Share{
        private int noteID;
        private int shareID;
        private int toUserID;
        private String toUserName;
        private String toUserEmail;

        Share(int noteID,int shareID,int toUserID, String toUserName,String toUserEmail){
            this.noteID = noteID;
            this.shareID = shareID;
            this.toUserID = toUserID;
            this.toUserName = toUserName;
            this.toUserEmail = toUserEmail;
        }

        int getNoteID() {
            return this.noteID;
        }

        int getShareID() {
            return this.shareID;
        }

        int getToUserID() {
            return this.toUserID;
        }

        String getToUserName() {
            return this.toUserName;
        }

        String getToUserEmail() {
            return this.toUserEmail;
        }
    }
%>