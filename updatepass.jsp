<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
String roll = (String)session.getAttribute("roll");
String pass = request.getParameter("pass");

try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("update student_info set passwd=? where roll=?"); // carrier
    pst.setString(1, pass);
    pst.setString(2, roll);
    int t = pst.executeUpdate();
    if (t > 0) {
        out.println("<h3>Updated successfully</h3>");
    } else {
        out.println("<h3>Failed to update password</h3>");
    }
    con.close();
} catch (Exception e) {
    out.println(e);
} finally {
    try {
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        out.println(e);
    }
}
%>
