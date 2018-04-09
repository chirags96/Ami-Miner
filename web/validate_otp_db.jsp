<%@page import="java.util.Random"%>
<%
String txtOTP=request.getParameter("txtOTP");


if(txtOTP.equals(session.getAttribute("otp"))){


Random rand=new Random();
int n = 100000 +rand.nextInt(900000);
System.out.println("otp"+n);
session.setAttribute("otp", Integer.toString(n));
        
response.sendRedirect("searchText.jsp");
}else{
session.setAttribute("msg", "Failed to Validate OTP");
response.sendRedirect("login.jsp");
}
%>