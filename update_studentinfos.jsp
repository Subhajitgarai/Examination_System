<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>
<%
String roll = request.getParameter("roll");
String nm = request.getParameter("name");
String pass = request.getParameter("pass");
String collage = request.getParameter("collage");
String add = request.getParameter("add");
String mob_no = request.getParameter("mob_no");
String sem = request.getParameter("sem");
String dept = request.getParameter("dept");
try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("update student_info set name=?, passwd=?, collage=?, address=?, mob_no=?, sem=?, dept=? where roll=?"); // carrier
    pst.setString(1, nm);
    pst.setString(2, pass);
    pst.setString(3, collage);
    pst.setString(4, add);
    pst.setString(5, mob_no);
    pst.setString(6, sem);
    pst.setString(7, dept);
    pst.setString(8, roll);

    int t = pst.executeUpdate();
    if (t > 0)
        out.println("<h3>Updated successfully</h3>");
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>
