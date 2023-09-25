<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
String roll = request.getParameter("roll");
int t = 0; // Initialize the variable t

try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("select * from exam_result where roll=?"); // carrier
    pst.setString(1, roll);
    ResultSet rs = pst.executeQuery();

    while (rs.next()) {
        out.println("<table style=\"border-collapse: collapse;\">");
        out.println("<tr>");
        out.println("<th style=\"border: 1px solid black; padding: 8px;\">Roll</th>");
        out.println("<th style=\"border: 1px solid black; padding: 8px;\">Subject</th>");
        out.println("<th style=\"border: 1px solid black; padding: 8px;\">Marks</th>");
        out.println("<th style=\"border: 1px solid black; padding: 8px;\">Out of</th>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td style=\"border: 1px solid black; padding: 8px;\">" + rs.getString(1) + "</td>");
        out.println("<td style=\"border: 1px solid black; padding: 8px;\">" + rs.getString(2) + "</td>");
        out.println("<td style=\"border: 1px solid black; padding: 8px;\">" + rs.getString(3) + "</td>");
        out.println("<td style=\"border: 1px solid black; padding: 8px;\">15</td>");
        out.println("</tr>");
        t++;
    }
    out.println("</table>");

    if (t == 0) {
        out.println("<h3>You didn't give the exam/The particular student didn't give the exam</h3>");
    }

    con.close();
} catch (Exception e) {
    out.println(e);
}
%>