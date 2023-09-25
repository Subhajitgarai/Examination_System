<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
int t = 0, s = 0, i = 0, id = 1;
String sub = request.getParameter("sub");
String roll = request.getParameter("roll");

try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("select * from exam_ques where subject=?"); // carrier
    pst.setString(1, sub);
    ResultSet rs = pst.executeQuery();

    out.println("<center>");
    out.println("<head>");
    out.println("<style>");
    out.println("body {font-family: Arial, sans-serif;}");
    out.println(".container {max-width: 900px; margin: 0 auto;}");
    out.println(".header {background-color: #333; color: white; padding: 4px; text-align: center;}");
    out.println(".welcome {font-size: 24px; margin-top: 40px; text-align: center;}");
    out.println(".btn {background-color: #008CBA; border: none; color: white; padding: 16px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 20px; margin: 10px 20px; cursor: pointer;}");
    out.println("</style>");
    out.println("</head>");
    out.println("<body>");
    out.println("<div class=\"container\">");
    out.println("<div class=\"header\">");
    out.println("<h1>Answer the following questions for " + sub + "</h1>");
    out.println("</div>");
    out.println("</center>");
    out.println("<br><br>");

    while (rs.next()) {
        out.println("<form action='examcal.jsp' method='get'>");
        out.println("<body bgcolor='#FFFFFF'>");
        out.println("<div style='border: 2px solid black; padding: 10px; margin-bottom: 20px;'>");
        out.println("<h3 style='color:blue;'>" + id + ". " + rs.getString(3) + "</h3>");

        out.println("<input type='hidden' name='q" + i + "' value='" + rs.getString(1) + "'>"); //hidden file format to give the next page value of the particular questionid
        out.println("<h3 style='color:red;'><input type='radio' name='r" + i + "' value='a'>" + rs.getString(4) + "<br><br></h3>");
        out.println("<h3 style='color:green;'><input type='radio' name='r" + i + "' value='b'>" + rs.getString(5) + "<br><br></h3>");
        out.println("<h3 style='color:purple;'><input type='radio' name='r" + i + "' value='c'>" + rs.getString(6) + "<br><br></h3>");
        out.println("<h3 style='color:orange;'><input type='radio' name='r" + i + "' value='d'>" + rs.getString(7) + "<br><br></h3>");

        String p = "r" + i;
        out.println("</div>");
        out.println("</body>");
        out.println();
        t++;
        i++;
        id++;
    }
    out.println("<input type='hidden' name='total' value='" + id + "'>");
    out.println("<center>");
    out.println("<h3><input type='submit' value='Submit'></h3>");
    out.println("</center>");
    out.println("<input type='hidden' name='ro' value='" + roll + "'>");
    out.println("<input type='hidden' name='su' value='" + sub + "'>");
    out.println("</form>");
    if (t == 0) {
        out.println("<h3>Enter subject properly</h3>");
    }
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
