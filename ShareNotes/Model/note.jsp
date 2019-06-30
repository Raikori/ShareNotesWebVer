<%
    class Note{
        private int noteID;
        private int userID;
        private String title;
        private String content;
        private String postedDate;
        private String name;

        Note(int noteID,int userID,String title,String content,String postedDate,String name){
            this.noteID = noteID;
            this.userID = userID;
            this.title = title;
            this.content = content;
            this.name = name;
            this.postedDate = postedDate;
        }

        int getNoteID() {
            return this.noteID;
        }

        int getUserID() {
            return this.userID;
        }

        String getTitle() {
            return this.title;
        }

        String getContent() {
            return this.content;
        }

        String getPostedDate() {
            return this.postedDate;
        }

        String getName() {
            return this.name;
        }
    }
%>