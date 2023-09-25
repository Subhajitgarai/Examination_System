<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
String nm = request.getParameter("nm");
try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("select * from student_info where name like ?");
    pst.setString(1, nm + "%");
    ResultSet rs = pst.executeQuery();
    while (rs.next()) {
        String roll = rs.getString(1);
        out.println("<center>");
        out.println("<br><h3><a href=fetch1.jsp?roll=" + roll + ">" + rs.getString(2) + "</a>");
        out.println("</center>");
    }
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>
