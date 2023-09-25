<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
String qid = request.getParameter("qid");
String sub = request.getParameter("subject");
String ques = request.getParameter("ques");
String opta = request.getParameter("opta");
String optb = request.getParameter("optb");
String optc = request.getParameter("optc");
String optd = request.getParameter("optd");
String cans = request.getParameter("cans");
try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("insert into exam_ques values(?,?,?,?,?,?,?,?)"); // carrier
    pst.setString(1, qid);
    pst.setString(2, sub);
    pst.setString(3, ques);
    pst.setString(4, opta);
    pst.setString(5, optb);
    pst.setString(6, optc);
    pst.setString(7, optd);
    pst.setString(8, cans);
    int t = pst.executeUpdate();
    if (t > 0)
        out.println("<h3>Inserted successfully</h3>");
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>
