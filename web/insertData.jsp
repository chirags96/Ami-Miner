

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
                    <h1>Insert Details</h1>
                </div>
                <div class="container">

                    <div class="heading">
                        <h2>Please Enter Student Details</h2>
                    </div>
                    <div class="agile-form">
                        <form action="insert_data_db.jsp" method="post">
                            <ul class="field-list">
                                <li>
                                    <label class="form-label"> 
                                       Enrollment No.
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                        <input type="text" name="txtEnrollmentNo" placeholder="Enrollment No." maxlength="13" required >
                                    </div>
                                </li>
                                <li>
                                    <label class="form-label"> 
                                        Full Name 
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                        <input type="text" name="txtname" placeholder="Enter Student Name" required >
                                    </div>
                                </li>
                                 <li>
                                    <label class="form-label"> 
                                        Course
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                        <select class="form-dropdown" name="txtCourse" required>
                                          
                                            <option value="1"> BTECH </option>
                                            <option value="2"> BBA </option>
                                            <option value="3"> MBA </option>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <label class="form-label"> 
                                        Batch
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                        <select class="form-dropdown" name="txtBatch" required>
                                          
                                            <option value="1"> 2010-2014 </option>
                                            <option value="2"> 2011-2015 </option>
                                            <option value="3"> 2012-2016 </option>
                                            <option value="4"> 2013-2017 </option>
                                           
                                        </select>
                                    </div>
                                </li>
                              
                                <li> 
                                    <label class="form-label">
                                        CGPA
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                        <input type="number" name="txtCGPA" placeholder="CGPA" step=".01" max="10" required >
                                    </div>
                                </li>
                                <li> 
                                    <label class="form-label">
                                         Participation in sangatthan
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                        <select class="form-dropdown" name="txtPartipation" required>
                                         
                                            <option value="1"> Yes </option>
                                            <option value="0"> No </option>
                                            
                                        </select>
                                    </div>
                                </li>
                                <li> 
                                    <label class="form-label">
                                          Awards/Medals won   in SANGHATTAN
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                        <select class="form-dropdown" name="txtAward" required>
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2"> 2 </option>
                                            <option value="3">3 </option>
                                            
                                        </select>
                                    </div>
                                </li>
                                <li> 
                                    <label class="form-label">
                                           Participation in fest
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                        <select class="form-dropdown" name="txtFest" required>
                                         
                                            <option value="1"> Yes </option>
                                            <option value="0"> No </option>
                                            
                                        </select>
                                    </div>
                                </li>
                                <li> 
                                    <label class="form-label">
                                           Awards/Medals Won in FEST 
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                         <select class="form-dropdown" name="txtAwardFest" required>
                                            <option value="0">0</option>
                                            <option value="1">1</option>
                                            <option value="2"> 2 </option>
                                            <option value="3">3 </option>
                                            
                                        </select>
                                    </div>
                                </li>
                               
                                <li> 
                                    <label class="form-label">
                                           Placement 
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                         <select class="form-dropdown" name="txtPlacement" required>
                                            <option value="1">Off  campus</option>
                                            <option value="0"> On campus </option>
                                           
                                        </select>
                                    </div>
                                </li>
                                <li> 
                                    <label class="form-label">
                                           Placement package 
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                         <select class="form-dropdown" name="txtPlacementpackage" required>
                                            <option value="0">1-3L</option>
                                            <option value="1"> 3-6L </option>
                                            <option value="2">6-9L </option>
                                            
                                        </select>
                                    </div>
                                </li>
                                <li> 
                                    <label class="form-label">
                                           Number of workshops attended.
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                          <input type="number" name="txtNumberofWorkshopws" placeholder="Number of workshops" required >
                                    </div>
                                </li>
                                <li> 
                                    <label class="form-label">
                                           Mentor/Mentiee
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                      <select class="form-dropdown" name="txtMentor" required>
                                         
                                            <option value="1"> Yes </option>
                                            <option value="0"> No </option>
                                            
                                        </select>
                                    </div>
                                </li>
                                <li> 
                                    <label class="form-label">
                                            Research Paper/Conferense Attended
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                      <select class="form-dropdown" name="txtResearchPaper" required>
                                         
                                            <option value="1"> Yes </option>
                                            <option value="0"> No </option>
                                            
                                        </select>
                                    </div>
                                </li>
                                <li> 
                                    <label class="form-label">
                                            Future Plan
                                        <span class="form-required"> * </span>
                                    </label>
                                    <div class="form-input">
                                      <select class="form-dropdown" name="txtFuturePlan" required>
                                            <option value="1">MSC</option>
                                            <option value="2"> MBA </option>
                                            <option value="3"> JOB </option>
                                            <option value="4"> Other </option>
                                            
                                        </select>
                                    </div>
                                </li>
                                </ul>
                            <input type="submit" value="Save Details">
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