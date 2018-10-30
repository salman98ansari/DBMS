<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ include file="../connection.jsp" %>
<%
String id=request.getParameter("d");
int no=Integer.parseInt(id);
try {
    statement.executeUpdate("delete FROM product , vendor using product INNER JOIN vendor ON  product.p_id = vendor.p_id WHERE vendor.v_id = '"+no+"'");
    response.sendRedirect("../View/vendorview.jsp");
} catch(Exception e){}
%>
