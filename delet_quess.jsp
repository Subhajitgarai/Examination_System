<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
String qid = request.getParameter("qid");
try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("delete from exam_ques where qid=?"); // carrier
    pst.setString(1, qid);

    int i = pst.executeUpdate();
    if (i > 0) {
        out.println("<h3>Deleted Successfully</h3>");
    }
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>
