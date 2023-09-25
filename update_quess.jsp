<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
String qid = request.getParameter("qid");
String sub = request.getParameter("sub");
String ques = request.getParameter("ques");
String opta = request.getParameter("opta");
String optb = request.getParameter("optb");
String optc = request.getParameter("optc");
String optd = request.getParameter("optd");
String cans = request.getParameter("cans");
try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("update exam_ques set subject=?, ques=?, opta=?, optb=?, optc=?, optd=?, cans=? where qid=?"); // carrier
    pst.setString(1, sub);
    pst.setString(2, ques);
    pst.setString(3, opta);
    pst.setString(4, optb);
    pst.setString(5, optc);
    pst.setString(6, optd);
    pst.setString(7, cans);
    pst.setString(8, qid);

    int t = pst.executeUpdate();
    if (t > 0)
        out.println("<h3>Updated successfully</h3>");
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>
