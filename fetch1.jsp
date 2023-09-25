<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
String roll = request.getParameter("roll");
try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("select * from student_info where roll=?"); // carrier
    pst.setString(1, roll);
    ResultSet rs = pst.executeQuery();

    if (rs.next()) {
        out.println("<h3>Roll =" + rs.getString(1) + "</h3>");
        out.println("<h3>Name =" + rs.getString(2) + "</h3>");
        out.println("<h3>Password =" + rs.getString(3) + "</h3>");
        out.println("<h3>Collage =" + rs.getString(4) + "</h3>");
        out.println("<h3>Address =" + rs.getString(5) + "</h3>");
        out.println("<h3>Mobile no =" + rs.getString(6) + "</h3>");
        out.println("<h3>Semester =" + rs.getString(7) + "</h3>");
        out.println("<h3>Department =" + rs.getString(8) + "</h3>");
    } else {
        out.println("<h3>Invalid Roll number.</h3>");
    }
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>
