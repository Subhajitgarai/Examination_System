<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345");
    PreparedStatement pst = con.prepareStatement("select * from student_info");
    ResultSet rs = pst.executeQuery();
%>
    <table style="border-collapse: collapse;">
        <tr>
            <th style="border: 1px solid black; padding: 8px;">Roll</th>
            <th style="border: 1px solid black; padding: 8px;">Name</th>
            <th style="border: 1px solid black; padding: 8px;">Password</th>
            <th style="border: 1px solid black; padding: 8px;">College</th>
            <th style="border: 1px solid black; padding: 8px;">Address</th>
            <th style="border: 1px solid black; padding: 8px;">Mobile_no</th>
            <th style="border: 1px solid black; padding: 8px;">Semester</th>
            <th style="border: 1px solid black; padding: 8px;">Department</th>
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
    con.close();
} catch (Exception e) {
    e.printStackTrace(); // Print any exception for debugging purposes
}
%>
