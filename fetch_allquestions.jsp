<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345");
    PreparedStatement pst = con.prepareStatement("select * from exam_ques");
    ResultSet rs = pst.executeQuery();
%>
    <table style="border-collapse: collapse;">
        <tr>
            <th style="border: 1px solid black; padding: 8px;">Qid</th>
            <th style="border: 1px solid black; padding: 8px;">Subject</th>
            <th style="border: 1px solid black; padding: 8px;">Question</th>
            <th style="border: 1px solid black; padding: 8px;">Option a</th>
            <th style="border: 1px solid black; padding: 8px;">Option b</th>
            <th style="border: 1px solid black; padding: 8px;">Option c</th>
            <th style="border: 1px solid black; padding: 8px;">Option d</th>
            <th style="border: 1px solid black; padding: 8px;">Correct Answer</th>
        </tr>
<%
    while (rs.next()) {
%>
        <tr>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(1) %></td>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(2) %></td>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(3) %></td>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(4) %></td>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(5) %></td>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(6) %></td>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(7) %></td>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(8) %></td>
        </tr>
<%
    }
%>
    </table>
<%
    rs.close();
    pst.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace(); // Print any exception for debugging purposes
}
%>
