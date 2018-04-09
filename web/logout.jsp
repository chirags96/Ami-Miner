<%
session.setAttribute("userid", null);
session.setAttribute("msg", "Logout Successfull");
response.sendRedirect("login.jsp");
%>