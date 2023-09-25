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
    PreparedStatement pst = con.prepareStatement("insert into student_info values(?,?,?,?,?,?,?,?)"); // carrier
    pst.setString(1, roll);
    pst.setString(2, nm);
    pst.setString(3, pass);
    pst.setString(4, collage);
    pst.setString(5, add);
    pst.setString(6, mob_no);
    pst.setString(7, sem);
    pst.setString(8, dept);

    int t = pst.executeUpdate();
    if (t > 0)
        out.println("<h3>Inserted successfully</h3>");
    con.close();
} catch (Exception e) {
    out.println(e);
}
%>
