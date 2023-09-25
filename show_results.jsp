<%@ page import="java.sql.*" %>
<%
   Connection con = null;
   String roll = (String)session.getAttribute("roll");
   int t = 0;

   try {
      Class.forName("oracle.jdbc.OracleDriver");
      con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345");
      PreparedStatement pst = con.prepareStatement("select * from exam_result where roll=?");
      pst.setString(1, roll);
      ResultSet rs = pst.executeQuery();

      while (rs.next()) {
         out.println("<center>");
         out.println("<table style=\"border-collapse: collapse;\">");
         out.println("<tr>");
         out.println("<th style=\"border: 1px solid black; padding: 8px;\">Roll</th>");
         out.println("<th style=\"border: 1px solid black; padding: 8px;\">Subject</th>");
         out.println("<th style=\"border: 1px solid black; padding: 8px;\">Marks</th>");         
         out.println("<th style=\"border: 1px solid black; padding: 8px;\">Out Of</th>");         

         out.println("</tr>");
         out.println("<tr>");
         out.println("<td style=\"border: 1px solid black; padding: 8px;\">" + rs.getString(1) + "</td>");
         out.println("<td style=\"border: 1px solid black; padding: 8px;\">" + rs.getString(2) + "</td>");
         out.println("<td style=\"border: 1px solid black; padding: 8px;\">" + rs.getString(3) + "</td>");
         out.println("<td style=\"border: 1px solid black; padding: 8px;\">15</td>");
         out.println("</tr>");
         out.println("</center>");
         t++;
      }

      out.println("</table>");
      if (t == 0) {
         out.println("<h3>You didn't give the exam/The particular student didn't give the exam</h3>");
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
