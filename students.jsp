

<%@ page import="java.sql.*" %>
<%!
   Connection con = null;
%>

<%
String student_id = request.getParameter("student_id");
String pass = request.getParameter("pass");
try {
    Class.forName("oracle.jdbc.OracleDriver"); // compatibility
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "12345"); // connectivity
    PreparedStatement pst = con.prepareStatement("select * from student_info where roll=? and passwd=?"); // carrier
    pst.setString(1, student_id);
    pst.setString(2, pass);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        %>
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
        body {
            margin-top: 100px;
            background-image: url('studentloginafter.png');
            background-size: cover;
            background-repeat: no-repeat;
        }
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        .header {
            background-color: #008CBA;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .welcome {
            font-size: 24px;
            margin-top: 50px;
            text-align: center;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }
        .btn {
            background-color: #008CBA;
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            margin: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #005F7F;
        }
        @media only screen and (max-width: 800px) {
            .container {
                max-width: 90%;
            }
            .header {
                padding: 10px;
            }
            .welcome {
                margin-top: 30px;
            }
            .btn {
                font-size: 18px;
                margin: 5px 10px;
            }
        }
        </style>
        </head>
        <body>
        <div class="container">
        <div class="header">
        <h1>Welcome to Exam Portal</h1>
        </div>
        <div class="welcome">
        <h4 ><p style="color:white;">Welcome <%= rs.getString(2) %>!</p></h4>
        <h4 ><p style="color:white;">Your Roll No is <%= rs.getString(1) %></p></h4>
        <a class="btn" href="startexam.html">Start Exam</a>
        <a class="btn" href="update_pass.html">Update Password</a>
        <a class="btn" href="/Examination_system/show_results.jsp">Show Result</a>
        </div>
        </div>
        </body>
        </html>
        <%
    } else {
        out.println("<h1>Invalid login credentials</h1>");
    }
    con.close();
    session.setAttribute("roll", student_id); // Using the implicit session object to store the Student roll.
} catch (Exception e) {
    out.println(e);
}
%>
