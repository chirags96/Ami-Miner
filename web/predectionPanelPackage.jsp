

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


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
         <link href="css/style_1.css" rel="stylesheet">
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
                    <form class="form-inline my-2 my-lg-0 mr-lg-2"  action="predectionPackage.jsp" method="post">
                        <%    if (session.getAttribute("msg") != null) {
                                out.print(session.getAttribute("msg"));
                                session.setAttribute("msg", null);
                            }
                        %>
                       
              
                <div class="container">

                    <div class="heading">
                        <h2>Please Enter Student Details</h2>
                    </div>
                          <div class="agile-form">
                        
                         <ul class="field-list">
                               
                                
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
                                
                                </ul>
                        <span class="input-group-append">
                            <button class="btn btn-primary" type="submit">
                                <i class="fa fa-check"></i>
                            </button>
                        </span>
                          </div>
                    </form>
                </ol>
                <%
                    }
                %>
            </div>
           
            <%
                try {
                    String batch1 = request.getParameter("txtBatch1");
                    String batch2 = request.getParameter("txtBatch2");
                    if (batch1 != null) {
                        //            session.setAttribute("ask_result", askArrayList);
                        Connection conn = DB.Connect.openConnection();
                        String sql = "select avg(cgpa),avg(awards_won_sangathan) from tblData where batch='" + batch1 + "'";
                        String sql1 = "select avg(cgpa),avg(awards_won_sangathan) from tblData where batch='" + batch2 + "'";
                        String sql2 = "select count(placement_type) from tblData where batch='" + batch1 + "' and placement_type='On Campus'";
                        String sql3 = "select count(placement_type) from tblData where batch='" + batch2 + "' and placement_type='Off Campus'";
System.out.println("hereee"+sql+"\nsql1"+sql1+"\n"+sql2+"\n"+sql3);
                        double cgpa_batch1 = 0;
                        double cgpa_batch2 = 0;
                        double awards_won_batch1 = 0;
                        double awards_won_batch2 = 0;
                        int oncampus = 0;;
                        int offcampus = 0;;
                        //int future_plan1 =0;
                        //int future_plan2 =0;

                        PreparedStatement statement = conn.prepareStatement(sql);

                        ResultSet rs = statement.executeQuery();

                        if (rs.next()) {
                            cgpa_batch1 = rs.getDouble(1);
                            awards_won_batch1 = rs.getDouble(2);
                        }
                        PreparedStatement statement1 = conn.prepareStatement(sql1);

                        ResultSet rs1 = statement1.executeQuery();

                        if (rs1.next()) {
                            cgpa_batch2 = rs1.getDouble(1);
                            awards_won_batch2 = rs1.getDouble(2);
                        }

                        PreparedStatement statement3 = conn.prepareStatement(sql2);

                        ResultSet rs3 = statement3.executeQuery();

                        if (rs3.next()) {
                            oncampus = rs3.getInt(1);

                        }
                        PreparedStatement statement4 = conn.prepareStatement(sql3);

                        ResultSet rs4 = statement4.executeQuery();

                        if (rs4.next()) {
                            offcampus = rs4.getInt(1);

                        }


            %>
            <div class="container-fluid">

                <!-- Area Chart Example-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i> CGPA Analysis</div>
                    <div class="card-body">
                        <canvas id="myAreaChart" width="100%" height="30"></canvas>
                    </div>
                    <div class="card-footer small text-muted">Last Updated at <%= new java.util.Date()%></div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Example Bar Chart Card-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-bar-chart"></i> Bar Chart </div>
                            <div class="card-body">
                                <canvas id="myBarChart" width="100" height="50"></canvas>
                            </div>
                            <div class="card-footer small text-muted">Last Updated at <%= new java.util.Date()%></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <!-- Example Pie Chart Card-->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-pie-chart"></i> Pie Chart </div>
                            <div class="card-body">
                                <canvas id="myPieChart" width="100%" height="100"></canvas>
                            </div>
                            <div class="card-footer small text-muted">Last Updated at <%= new java.util.Date()%></div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                Chart.defaults.global.defaultFontColor = '#292b2c';
                // -- Area Chart Example
                var ctx = document.getElementById("myAreaChart");
                var myLineChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ["Batch 1", "Batch 2"],
                        datasets: [{
                                label: "CGPA",
                                lineTension: 0.3,
                                backgroundColor: "rgba(2,117,216,0.2)",
                                borderColor: "rgba(2,117,216,1)",
                                pointRadius: 5,
                                pointBackgroundColor: "rgba(2,117,216,1)",
                                pointBorderColor: "rgba(255,255,255,0.8)",
                                pointHoverRadius: 5,
                                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                pointHitRadius: 20,
                                pointBorderWidth: 2,
                                data: [ <%=cgpa_batch1%>, <%=cgpa_batch2%>],
                            }],
                    },
                    options: {
                        scales: {
                            xAxes: [{
                                    time: {
                                        unit: 'millisecond'
                                    },
                                    gridLines: {
                                        display: false
                                    },
                                    ticks: {
                                        maxTicksLimit: 7
                                    }
                                }],
                            yAxes: [{
                                    ticks: {
                                        min: 0,
                                        max: <%=10%>,
                                        maxTicksLimit: 5
                                    },
                                    gridLines: {
                                        color: "rgba(0, 0, 0, .125)",
                                    }
                                }],
                        },
                        legend: {
                            display: false
                        }
                    }
                });
                // -- Bar Chart Example
                var ctx = document.getElementById("myBarChart");
                var myLineChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ["Batch 1", "Batch 2"],
                        datasets: [{
                                label: "Awards Won",
                                backgroundColor: "rgba(2,117,216,1)",
                                borderColor: "rgba(2,117,216,1)",
                                data: [<%=awards_won_batch1%>, <%=awards_won_batch2%>]}],
                    },
                    options: {
                        scales: {
                            xAxes: [{
                                    time: {
                                        unit: 'millisecond'
                                    },
                                    gridLines: {
                                        display: false
                                    },
                                    ticks: {
                                        maxTicksLimit: 6
                                    }
                                }],
                            yAxes: [{
                                    ticks: {
                                        min: 0,
                                        max: <%=awards_won_batch1 + awards_won_batch2%>,
                                        maxTicksLimit: 5
                                    },
                                    gridLines: {
                                        display: true
                                    }
                                }],
                        },
                        legend: {
                            display: false
                        }
                    }
                });
                // -- Pie Chart Example
                var ctx = document.getElementById("myPieChart");
                var myPieChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: ["On Campus", "Off Campus"],
                        datasets: [{
                                data: [<%=oncampus%>, <%=offcampus%>], backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
                            }],
                    },
                });
            </script>
            <!--<a href="google_result.jsp">View Google Result</a>
            <a href="bing_result.jsp">View Bing Result</a>
            <a href="yahoo_result.jsp">View Yahoo Result</a>
            <a href="ask_result_1.jsp">View Ask Result</a>-->

            <%                            }

                } catch (Exception e) {
                    e.printStackTrace();
                }


            %>

           
            <!-- Custom scripts for all pages-->
            <!--                    <script src="js/sb-admin.min.js"></script>-->
            <!-- Custom scripts for this page-->
            <!--            <script src="js/sb-admin-charts.min.js"></script>-->
 </div>
        </div>
    </div>
</body>
</html>