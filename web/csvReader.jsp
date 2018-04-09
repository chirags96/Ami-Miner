<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletRequestContext"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.Reader"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>

<%
    
boolean b;
    
    String filename = "", fullImagepath = "", txtuserid = "";
    System.out.println("here");

    String context = config.getServletContext().getRealPath("/");
    String filePath = context + "data";
boolean status;
    File f = null;
    boolean isMultipart = ServletFileUpload.isMultipartContent(new ServletRequestContext(request));
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                List/*FileItem*/ items = upload.parseRequest(request);
                Iterator iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {

                        //mother's name
                     



                    } else {
                        // upload first image
                        if (item.getFieldName().equalsIgnoreCase("txtFile")) {
                      filename = item.getName();
                            if (!filename.equalsIgnoreCase("")) {
                                String extension = filename.substring(filename.lastIndexOf("."), filename.length());
                           
                                fullImagepath = filePath + File.separator + "temp.csv";
                                f = new File(fullImagepath);
                                try {
                                    item.write(f);
                                    status = true;
                                } catch (Exception e1) {
                                    e1.printStackTrace();
                                    status = false;
                                }
                            }
                        }

                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                status = false;
            }
        }
   

       //String path, String original, String ext1, String stegan, String message
    //  stegno.encode("check", "abc", "png", "abc4", "helllo munnaji");       
//Crypter c = new Crypter(context+"data\\deer.png"); // Key picture.
  
 

    System.out.print("name: " + filePath + "\\" + filename + "\next");
  
   File file = new File(f.getPath());
        
        Scanner scanner = new Scanner(file);
        String lineSeparator = System.getProperty("line.separator");
 int i=0;
        try {
             Connection conn=DB.Connect.openConnection();
            while (scanner.hasNextLine()) {
               
               String value=scanner.nextLine().replace("\"", "");
               System.out.println("line"+value);
               String arr[]=value.split(",");
               System.out.println("=="+arr[0]+","+arr[1]);
              try{
 String sql = "INSERT INTO `tblData` ( `name`, `course`, `batch`, `e_no`, `cgpa`,"
         + " `participation_sangatthan`, `awards_won_sangathan`, `fest`, `awards_in_fest`, "
         + "`placement_type`, `workshops`, `mentor`, `research_paper`, `future`,placement_package) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, arr[0]);
            statement.setString(2, arr[1]);
            statement.setString(3, arr[2]);
            statement.setString(4, arr[3]);
            statement.setString(5, arr[4]);
            statement.setString(6, arr[5]);
            statement.setString(7, arr[6]);
            statement.setString(8, arr[7]);
            statement.setString(9, arr[8]);
            statement.setString(10, arr[9]);
            statement.setString(11, arr[10]);
            statement.setString(12, arr[11]);
            statement.setString(13, arr[12]);
            statement.setString(14, arr[13]);
            statement.setString(15, arr[14]);

           i= statement.executeUpdate();
              }catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e2){
              System.out.println("duplicate entry"+e2.getLocalizedMessage());
              }
            }
           
        } finally {
            scanner.close();
        }
    
    
    System.out.print("data=" + i);

    if (i > 0) {
        session.setAttribute("msg", "File Uploaded Successfully");
        response.sendRedirect("uploadData.jsp");
    } else {
       session.setAttribute("msg", "Failed to upload file please check enrollement no.");
        response.sendRedirect("uploadData.jsp");
    }
                //Decrypt
    //System.out.println(c.deCrypt(filePath1));

%>