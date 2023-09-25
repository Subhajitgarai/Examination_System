<%
String name = "Subhajit";
String password = "Subhait@321";
String admin_id = request.getParameter("admin_id");
String pass = request.getParameter("pass");
%>
<html>
        <head>
        <title>Admin Panel</title>
        <style>
        body {
          background-color: #f1f1f1;
          font-family: Arial, Helvetica, sans-serif;
        }
		
		
    h1 {
         text-align: center;
      margin-top: 50px;
		
		  color: #088F8F;
      text-decoration: none;
      display: block;
      margin: 10px;
      padding: 10px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
		
     }
		
		
        a {
          color: #088F8F;
          text-decoration: none;
          display: block;
          margin: 10px;
          padding: 10px;
          background-color: #fff;
          border-radius: 5px;
          box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }
		
		
        a:hover {
          background-color: #f1f1f1;
        }
        </style>
        </head>
        <body  style=\"background-color:#088F8F\">
<%        

        if (name.equals(admin_id) && password.equals(pass)) {
            
            out.println("<h1>Hello Admin " + admin_id + ", it's your arena now...</h1><br>"); %>
			<h3>
            <a href="insert_studentinfo.html">Insert Student Information</a>
            <a href= "delete_studentinfo.html">Delete Studentinfo</a>
            <a href="/Examination_system/fetchall_studentinfo.jsp">Fetch all student details</a>
            <a href="update_studentinfo.html">Update Student Information</a>
            <a href="insert_ques.html">Insert Questions</a>
            <a href="delete_ques.html">Delete Questions</a>
            <a href="/Examination_system/fetch_allquestions.jsp">Fetch All Questions</a>
            <a href="update_ques.html">Update Questions</a>
			<a href="search.html">Search by Student_name</a>
			<a href="show_result.html">Get Results By Roll</a>
			<a href="/Examination_system/fetch_allresult.jsp">Fetch All Results</a>
		    <a href="admin.html">Logout</a>
			</h3>
        <%
        } else {
            out.println("Wrong admin_id or pass");
        }
        %>
       </body>
</html>