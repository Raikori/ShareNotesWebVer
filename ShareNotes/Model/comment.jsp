<%
    class Comment{
        private int commentID;
        private int noteID;
        private String comment;
        private String postedDate;
 
        Comment(int commentID, int noteID,String comment,String postedDate){
            this.commentID = commentID;
            this.noteID = noteID;
            this.comment = comment;
            this.postedDate = postedDate;
        }

        int getCommentID() {
            return this.commentID;
        }

        int getNoteID() {
            return this.noteID;
        }

        String getComment() {
            return this.comment;
        }

        String getPostedDate() {
            return this.postedDate;
        }
    }
%>