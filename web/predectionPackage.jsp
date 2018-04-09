

<%@page import="net.sf.javaml.core.Instance"%>
<%@page import="net.sf.javaml.core.DefaultDataset"%>
<%@page import="net.sf.javaml.core.DenseInstance"%>
<%@page import="libsvm.LibSVM"%>
<%@page import="net.sf.javaml.classification.Classifier"%>
<%@page import="net.sf.javaml.core.Dataset"%>
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


            <%            
                  String output = "";
                try {

                    String txtCourse = request.getParameter("txtCourse");
                    String txtCGPA = request.getParameter("txtCGPA");
                    String txtPartipation = request.getParameter("txtPartipation");
                    String txtAward = request.getParameter("txtAward");
                    String txtFest = request.getParameter("txtFest");
                    String txtAwardFest = request.getParameter("txtAwardFest");
                    String txtNumberofWorkshopws = request.getParameter("txtNumberofWorkshopws");
                    String txtMentor = request.getParameter("txtMentor");
                    String txtResearchPaper = request.getParameter("txtResearchPaper");

                    if (txtCourse != null) {
                        //            session.setAttribute("ask_result", askArrayList);

                        double cgpa = Double.parseDouble(txtCGPA);//6
                        double ps = Double.parseDouble(txtPartipation);
                        double awards_won_sangathan = Double.parseDouble(txtAward);//8
                        double fest =  Double.parseDouble(txtFest); 
                        double awards_in_fest = Double.parseDouble(txtAwardFest);//10
                        double mentor_d =   Double.parseDouble(txtMentor);
                        double workshops = Double.parseDouble(txtNumberofWorkshopws);                       
                        double research_paper_d =  Double.parseDouble(txtResearchPaper);
                     
                        System.out.println("cgpa" + cgpa + "ps" + ps + "awards_won_sangathan" + awards_won_sangathan + "fest" + fest + "awards_in_fest" + awards_in_fest + "workshops=" + workshops + "mentor_d=" + mentor_d + "research_paper_d" + research_paper_d);

                        double d[] = {cgpa, ps, awards_won_sangathan, fest, awards_in_fest, workshops, mentor_d, research_paper_d};

                        Dataset datasetTest = new DefaultDataset();
                        datasetTest.add(new DenseInstance(d));

                        Dataset dataset = DB.SVMClassifer.loadDataSetForPlacementPackage();
                        Classifier svm = new LibSVM();
                        svm.buildClassifier(dataset);
                      
                        for (Instance inst : datasetTest) {
                            Object predictedClassValue = svm.classify(inst);
                            Object realClassValue = inst.classValue();
                            double pred=(Double)predictedClassValue;
                            System.out.println("predicted value" + predictedClassValue + ":real value=" + realClassValue);
                           /*
                             <option value="0">1-3L</option>
                                            <option value="1"> 3-6L </option>
                                            <option value="2">6-9L </option>
                            */
                            
                            if (pred==0.0) {
                                output = "Package will like be <b>1-3L</b>";
                            } else if (pred==1.0) {
                                output = "Package will like be <b>3-6L</b>";
                            } else if (pred==2.0) {
                                output = "Package will like be of type <b>6-9L</b>";
                            }
                        }
System.out.println("output"+output);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <div class="h1">
                        <%=output%>
                </div>

            </div>

            <!-- Custom scripts for all pages-->
            <!--                    <script src="js/sb-admin.min.js"></script>-->
            <!-- Custom scripts for this page-->
            <!--            <script src="js/sb-admin-charts.min.js"></script>-->
        </div>
    </div>
</div>
</body>
</html>