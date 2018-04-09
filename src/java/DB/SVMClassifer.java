package DB;

import be.abeel.io.LineIterator;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import libsvm.LibSVM;
import net.sf.javaml.classification.Classifier;

import net.sf.javaml.core.Dataset;
import net.sf.javaml.core.DefaultDataset;
import net.sf.javaml.core.DenseInstance;
import net.sf.javaml.core.Instance;

/**
 *
 * @author DKG
 */
public class SVMClassifer {

    public static void main(String args[]) {
        checkDataForPositiveNegative("it is bad");
    }

 

    public static String checkDataForPositiveNegative(String mytext) {
//        String output = "NA";
//        try {
//            //prepare test data
//          //  Dataset dataForClassification = convertMyWordToDouble(mytext);
//            /* Load a data set */
// /*
//             * Contruct a LibSVM classifier with default settings.
//             */
//            System.out.println("dataset loading");
//            URL url = SVMClassifer.class.getResource("/datasets/positive_negative1.csv");
//            //Dataset dataset = FileHandler.loadDataset(new File("datasets/positive_negative1.csv"), 1, ",");
//            Reader reader = new InputStreamReader(url.openStream(), Charset.forName("UTF-8"));
//
//            Dataset dataset = load(reader, 1, ",");
//            System.out.println("dataset loaded");
//            Classifier svm = new LibSVM();
//            svm.buildClassifier(dataset);
//            /*
//             * Load a data set, this can be a different one, but we will use the
//             * same one.
//             */
//            //  Dataset dataForClassification = FileHandler.loadDataset(new File("datasets/positive_negative_test_data.txt"));
//
//            /* Counters for correct and wrong predictions. */
//            int correct = 0, wrong = 0;
//            /* Classify all instances and check with the correct class values */
//            for (Instance inst : dataForClassification) {
//
//                Object predictedClassValue = svm.classify(inst);
//                Object realClassValue = inst.classValue();
//                System.out.println("predicted value" + predictedClassValue + ":real value=" + realClassValue);
//                if (predictedClassValue.equals("1")) {
//                    correct++;
//                } else {
//                    wrong++;
//                }
//            }
//            System.out.println("total positive:negative" + correct + ":" + wrong);
//            if (correct == wrong) {
//                output = "Neutral";
//            } else if (correct >= wrong) {
//                output = "Positive";
//            } else if (correct <= wrong) {
//                output = "Negative";
//
//            }
//
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
        return null;
    }

    public static Dataset loadDataSetForPlacement() {
        Dataset out = new DefaultDataset();
        try {
            Connection conn = DB.Connect.openConnection();
            String sql = "select * from tblData";
            PreparedStatement statement = conn.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                double cgpa = rs.getDouble("cgpa");//6            
                double ps =  rs.getDouble("participation_sangatthan");             
                double awards_won_sangathan = rs.getDouble("awards_won_sangathan");//8
                double fest_d=Double.parseDouble(rs.getString("fest"));             
                double awards_in_fest = rs.getDouble("awards_in_fest");//10              
                double placement_type_d = rs.getDouble("placement_type");
                double workshops = rs.getDouble("workshops");//11               
                double mentor_d = rs.getDouble("mentor");//11              
                double research_paper_d=rs.getDouble("research_paper");
                double research_future_d=rs.getDouble("future");
               
             
                System.out.println("cgpa" + cgpa + "ps"+ps+"awards_won_sangathan"+awards_won_sangathan+"fest"+fest_d+"awards_in_fest"+awards_in_fest+"workshops="+workshops+"mentor_d="+mentor_d+"research_paper_d"+research_paper_d);
      
                double d[] = {cgpa, ps, awards_won_sangathan, fest_d, awards_in_fest, workshops, mentor_d,research_paper_d};
                out.add(new DenseInstance(d,placement_type_d));
            }

            return out;
        } catch (SQLException ex) {
            Logger.getLogger(SVMClassifer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return out;
    }
public static Dataset loadDataSetForFurtherStudies() {
        Dataset out = new DefaultDataset();
        try {
            Connection conn = DB.Connect.openConnection();
            String sql = "select * from tblData";
            PreparedStatement statement = conn.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
               double cgpa = rs.getDouble("cgpa");//6            
                double ps =  rs.getDouble("participation_sangatthan");             
                double awards_won_sangathan = rs.getDouble("awards_won_sangathan");//8
                double fest_d=Double.parseDouble(rs.getString("fest"));             
                double awards_in_fest = rs.getDouble("awards_in_fest");//10              
                double placement_type_d = rs.getDouble("placement_type");
                double workshops = rs.getDouble("workshops");//11               
                double mentor_d = rs.getDouble("mentor");//11              
                double research_paper_d=rs.getDouble("research_paper");
                double research_future_d=rs.getDouble("future");
                double d[] = {cgpa, ps, awards_won_sangathan, fest_d, awards_in_fest, workshops, mentor_d,research_paper_d};
                out.add(new DenseInstance(d,research_future_d));
            }

            return out;
        } catch (SQLException ex) {
            Logger.getLogger(SVMClassifer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return out;
    }
public static Dataset loadDataSetForPlacementPackage() {
        Dataset out = new DefaultDataset();
        try {
            Connection conn = DB.Connect.openConnection();
            String sql = "select * from tblData";
            PreparedStatement statement = conn.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
               double cgpa = rs.getDouble("cgpa");//6            
                double ps =  rs.getDouble("participation_sangatthan");             
                double awards_won_sangathan = rs.getDouble("awards_won_sangathan");//8
                double fest_d=Double.parseDouble(rs.getString("fest"));             
                double awards_in_fest = rs.getDouble("awards_in_fest");//10              
                double placement_package = rs.getDouble("placement_package");
                double workshops = rs.getDouble("workshops");//11               
                double mentor_d = rs.getDouble("mentor");//11              
                double research_paper_d=rs.getDouble("research_paper");
              //  double research_future_d=rs.getDouble("future");
                double d[] = {cgpa, ps, awards_won_sangathan, fest_d, awards_in_fest, workshops,
                    mentor_d,research_paper_d};
                     System.out.println("cgpa" + cgpa + "ps"+ps+"awards_won_sangathan"+awards_won_sangathan+
                             "fest"+fest_d+"awards_in_fest"+awards_in_fest+
                             "workshops="+workshops+"mentor_d="+mentor_d+"research_paper_d"+research_paper_d);
                System.out.println("pack"+placement_package);
                out.add(new DenseInstance(d,placement_package));
            }

            return out;
        } catch (SQLException ex) {
            Logger.getLogger(SVMClassifer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return out;
    }

}
