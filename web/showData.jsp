

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="twitter4j.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Message Pattern</title>
        <!-- Bootstrap core CSS-->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Page level plugin JavaScript-->
        <script src="vendor/chart.js/Chart.min.js"></script>
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <%@include  file="left_nav.jsp" %>
        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <%     if (session.getAttribute("userid") != null) {
                    %>
                    <form class="form-inline my-2 my-lg-0 mr-lg-2"  action="showData.jsp" method="post">
                        <%    if (session.getAttribute("msg") != null) {
                                out.print(session.getAttribute("msg"));
                                session.setAttribute("msg", null);
                            }
                        %>
                        <select class="form-dropdown" name="txtBatch1" required>
                            <option value="1"> 2010-2014 </option>
                            <option value="2"> 2011-2015 </option>
                            <option value="3"> 2012-2016 </option>
                            <option value="4"> 2013-2017 </option>
                        </select>
                        <span class="input-group-append">
                            <button class="btn btn-primary" type="submit">
                                <i class="fa fa-sign-in"></i>
                            </button>
                        </span>
                    </form>
                </ol>
                <%
                    }
                    String batch1 = request.getParameter("txtBatch1");

                    String batch = "";
try{
 if (batch1.equals("1")) {
                        batch = "2010-2014";
                    } else if (batch1.equals("2")) {
                        batch = "2011-2015";
                    } else if (batch1.equals("3")) {
                        batch = "2012-2016";

                    } else if (batch1.equals("4")) {
                        batch = "2013-2017";
                    }
}catch(Exception e){
}
                   
                %>
            </div>
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i> <%=batch%></div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Enrollment No.</th>
                                    <th>Name</th>
                                    <th>Course</th>
                                    <th>Batch</th>

                                    <th>CGPA</th>
                                    <th>Participation In Sangatthan</th>
                                    <th>Award Won In Sangatthan</th>
                                    <th>Fests Attended</th>
                                    <th>Awards In Fest</th>
                                    <th>Placement</th>
                                    <th>Workshop</th>
                                    <th>Mentor/Mentiee</th>
                                    <th>Research Paper</th>
                                    <th>Future</th>
                                    <th>Placement Package</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Enrollment No.</th>
                                    <th>Name</th>
                                    <th>Course</th>
                                    <th>Batch</th>    
                                    <th>CGPA</th>
                                    <th>Participation In Sangatthan</th>
                                    <th>Award Won In Sangatthan</th>
                                    <th>Fests Attended</th>
                                    <th>Awards In Fest</th>
                                    <th>Placement</th>
                                    <th>Workshop</th>
                                    <th>Mentor/Mentiee</th>
                                    <th>Research Paper</th>
                                    <th>Future</th>
                                    <th>Placement Package</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <%
                                    try {

                                        if (batch1 != null) {
                                            //            session.setAttribute("ask_result", askArrayList);
                                            Connection conn = DB.Connect.openConnection();
                                            String sql = "select * from tblData where batch='" + batch1 + "'";

                                            double cgpa_batch1 = 0;

                                            PreparedStatement statement = conn.prepareStatement(sql);

                                            ResultSet rs = statement.executeQuery();

                                            while (rs.next()) {
                                                String course = "", participation_sangatthan = "No", awards_won_sangathan, fest = "", placement_type = "On Campus";
                                                String mentor = "No", research_paper = "No", future = "",placement_package="";
                                                if (rs.getString("course").equals("1")) {
                                                    course = "BTECH";
                                                } else if (rs.getString("course").equals("2")) {
                                                    course = "BBA";
                                                } else if (rs.getString("course").equals("3")) {
                                                    course = "MBA";
                                                }

                                                if (rs.getBoolean("participation_sangatthan")) {
                                                    participation_sangatthan = "Yes";
                                                }
                                                if (rs.getBoolean("fest")) {
                                                    fest = "Yes";
                                                }
                                                if (rs.getBoolean("placement_type")) {
                                                    placement_type = "Off Campus";
                                                }
                                                if (rs.getBoolean("mentor")) {
                                                    mentor = "Yes";
                                                }
                                                if (rs.getBoolean("research_paper")) {
                                                    research_paper = "Yes";
                                                }
                                                if (rs.getString("future").equals("1")) {
                                                    future = "MSC";
                                                } else if (rs.getString("future").equals("2")) {
                                                    future = "MBA";
                                                } else if (rs.getString("future").equals("3")) {
                                                    future = "JOB";
                                                } else if (rs.getString("future").equals("4")) {
                                                    future = "Other";
                                                }
                                                 if (rs.getString("placement_package").equals("0")) {
                                                    placement_package = "1-3L";
                                                } else if (rs.getString("placement_package").equals("1")) {
                                                    placement_package = "3-6L";
                                                } else if (rs.getString("placement_package").equals("2")) {
                                                    placement_package = "6-9L";
                                                } else if (rs.getString("placement_package").equals("3")) {
                                                    placement_package = "Other";
                                                }
                                %>

                                <!--String sql = "INSERT INTO `tblData` ( `name`, `course`, `batch`, `e_no`, `cgpa`,"
                                         + " `participation_sangatthan`, `awards_won_sangathan`, `fest`, `awards_in_fest`, "
                                         + "`placement_type`, `workshops`, `mentor`, `research_paper`, `future`,placement_package) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                                -->

                                <tr>

                                    <td><%=rs.getString("e_no")%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=course%></td>

                                    <td><%=batch%></td>
                                    <td><%=rs.getString("cgpa")%></td>
                                    <td><%=participation_sangatthan%></td>
                                    <td><%=rs.getString("awards_won_sangathan")%></td>
                                    <td><%=fest%></td>
                                    <td><%=rs.getString("awards_in_fest")%></td>
                                    <td><%=placement_type%></td>
                                    <td><%=rs.getString("workshops")%></td>
                                    <td><%=mentor%></td>
                                    <td><%=research_paper%></td>
                                    <td><%=future%></td>
                                    <td><%=placement_package%></td>

                                </tr>





                                <%                            }
                                        }

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }


                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <footer class="sticky-footer">
                <div class="container">
                    <div class="text-center">
                        <small>Copyright © Your Website 2018</small>
                    </div>
                </div>
            </footer>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fa fa-angle-up"></i>
            </a>
            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Page level plugin JavaScript-->
            <script src="vendor/datatables/jquery.dataTables.js"></script>
            <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script src="js/sb-admin-datatables.min.js"></script>
        </div>
    </div>
</body>
</html>