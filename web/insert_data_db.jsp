<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String txtEnrollmentNo=request.getParameter("txtEnrollmentNo");
String txtname=request.getParameter("txtname");
String txtCourse=request.getParameter("txtCourse");
String txtBatch=request.getParameter("txtBatch");
String txtCGPA=request.getParameter("txtCGPA");
String txtPartipation=request.getParameter("txtPartipation");
String txtAward=request.getParameter("txtAward");
String txtFest=request.getParameter("txtFest");
String txtAwardFest=request.getParameter("txtAwardFest");
String txtPlacement=request.getParameter("txtPlacement");
String txtPlacementpackage=request.getParameter("txtPlacementpackage");
String txtNumberofWorkshopws=request.getParameter("txtNumberofWorkshopws");
String txtMentor=request.getParameter("txtMentor");
String txtResearchPaper=request.getParameter("txtResearchPaper");
String txtFuturePlan=request.getParameter("txtFuturePlan");
Connection conn=DB.Connect.openConnection();
 String sql = "INSERT INTO `tblData` ( `name`, `course`, `batch`, `e_no`, `cgpa`,"
         + " `participation_sangatthan`, `awards_won_sangathan`, `fest`, `awards_in_fest`, "
         + "`placement_type`, `workshops`, `mentor`, `research_paper`, `future`,placement_package) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, txtname);
            statement.setString(2, txtCourse);
            statement.setString(3, txtBatch);
            statement.setString(4, txtEnrollmentNo);
            statement.setString(5, txtCGPA);
            statement.setString(6, txtPartipation);
            statement.setString(7, txtAward);
            statement.setString(8, txtFest);
            statement.setString(9, txtAwardFest);
            statement.setString(10, txtPlacement);
            statement.setString(11, txtNumberofWorkshopws);
            statement.setString(12, txtMentor);
            statement.setString(13, txtResearchPaper);
            statement.setString(14, txtFuturePlan);
            statement.setString(15, txtPlacementpackage);

           int i = statement.executeUpdate();

if(i>0){
session.setAttribute("msg", "Data Saved Successfully");

response.sendRedirect("insertData.jsp");
}else{
session.setAttribute("msg", "Failed to saved details");
response.sendRedirect("insertData.jsp");
}
%>