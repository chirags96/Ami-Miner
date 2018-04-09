<%@page import="java.util.Random"%>
<%
String username=request.getParameter("txtEmail");
String password=request.getParameter("txtPass");

if(username.equals("admin@gmail.com")&&password.equals("asdfgh")){
session.setAttribute("msg", "Welcome admin");
session.setAttribute("userid", username);
Random rand=new Random();
int n = 100000 +rand.nextInt(900000);
System.out.println("otp"+n);
session.setAttribute("otp", Integer.toString(n));
        DB.SMSSender.SMSSender("apdtc", Integer.toString(n), "FORDER", "9810139067", "3f06ddd8-4326-4052-a8ff-5f207ddbc250");
    //DB.SMSSender.SMSSender("amiminer", Integer.toString(n), "amimin", "9810139067", "3f06ddd8-4326-4052-a8ff-5f207ddbc250");
    
response.sendRedirect("validateotp.jsp");
}else{
session.setAttribute("msg", "Failed to login");
response.sendRedirect("login.jsp");
}
%>