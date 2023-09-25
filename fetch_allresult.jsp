<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
int t = 0;

try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("select * from exam_result"); // carrier
    ResultSet rs = pst.executeQuery();
%>
    <table style="border-collapse: collapse;">
        <tr>
            <th style="border: 1px solid black; padding: 8px;">Roll</th>
            <th style="border: 1px solid black; padding: 8px;">Subject</th>
            <th style="border: 1px solid black; padding: 8px;">Marks</th>
            <th style="border: 1px solid black; padding: 8px;">Out of</th>
        </tr>
<%
    while (rs.next()) {
%>
        <tr>
            
            <td style="border: 1px solid black; padding: 8px;"><a href=fetch1.jsp?roll=<%=rs.getString(1) %>><%= rs.getString(1) %></a></td>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(2) %></td>
            <td style="border: 1px solid black; padding: 8px;"><%= rs.getString(3) %></td>
            <td style="border: 1px solid black; padding: 8px;">15</td>
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
    out.println(e);
}
%>
