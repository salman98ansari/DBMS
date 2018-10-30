<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ include file="../connection.jsp" %>
<%
String id=request.getParameter("d");
int no=Integer.parseInt(id);
try {
    statement.executeUpdate("DELETE FROM customer WHERE cust_id = '"+no+"'");
    response.sendRedirect("../View/customerview.jsp");
} catch(Exception e){}
%>