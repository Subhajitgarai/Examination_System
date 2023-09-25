<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>
<%
int s = 0;
int totalno = Integer.parseInt(request.getParameter("total"));
String su = request.getParameter("su");
String ro = (String) session.getAttribute("roll"); // Get roll from session

try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("select * from exam_ques"); // carrier
    ResultSet rs = pst.executeQuery();

    while (rs.next()) {
        String orginalqid = rs.getString(1);
        String originalans = rs.getString(8);
        for (int i = 0; i < totalno - 1; i++) {
            String ans = request.getParameter("r" + i);
            String qid = request.getParameter("q" + i);
            if (qid.equals(orginalqid) && ans.equals(originalans)) {
                s = s + 1;
            }
        }
    }
    int n = totalno - 1;
    int t = 0;
    if (n > 0) {
        out.println("<center>");
        out.println("<h3>You Score in this Subject =" + s + " out of " + n + "</h3>");
        out.println("</center>");

        PreparedStatement pst1 = con.prepareStatement("insert into exam_result values(?,?,?)"); // carrier
        String ma = String.valueOf(s);
        pst1.setString(1, ro);
        pst1.setString(2, su);
        pst1.setString(3, ma);
        t = pst1.executeUpdate();
    }

    if (t > 0) {
        out.println("<center>");
        out.println("<h3>Your result has been recorded successfully!</h3>");
        out.println("</center>");
    } else {
        out.println("<center>");
        out.println("<h3>Failed to record your result.</h3>");
        out.println("</center>");
    }

    con.close(); // Close the connection

} catch (Exception e) {
    out.println("<center>");
    out.println("<h3>Error occurred while processing your result.</h3>");
    out.println("</center>");
    e.printStackTrace();
}
%>
