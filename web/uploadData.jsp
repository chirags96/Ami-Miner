

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
        <title>Data Analysis</title>
        <!-- Bootstrap core CSS-->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
        <link href="css/style_1.css" rel="stylesheet">
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
                <div class="heading">
                    <h1>Upload CSV Details</h1>
                </div>
                <div class="container">

                    <div class="heading">
                        <h2>Please Select Detail File</h2>
                    </div>
                    <div class="agile-form">
                        <form action="csvReader.jsp" method="post"  enctype="multipart/form-data">
                            <%                                          if (session.getAttribute("msg") != null) {
                                    %>
                                    <p style="color:red "><%=session.getAttribute("msg")%></p>
                                    <%
                                            session.setAttribute("msg", null);
                                        }
                                    %>
                            <ul class="field-list">
                                <li>
                                    
                                    <label class="form-label"> 
                                        Select File
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                        <input type="file" name="txtFile"  required accept=".csv">
                                    </div>
                                </li>

                            </ul>
                            <input type="submit" value="Upload File">
                        </form>	
                    </div>
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
        </div>

        <!-- Logout Modal-->


        <!-- Custom scripts for all pages-->
        <!--                    <script src="js/sb-admin.min.js"></script>-->
        <!-- Custom scripts for this page-->
        <!--            <script src="js/sb-admin-charts.min.js"></script>-->



    </body>
</html>