<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../header.jsp" %>
        <p><br/></p>
        <div class="row">
            <% String name=(String)session.getAttribute("sessname"); %>
            <div class="col-md-6"><h3>Welcome <% out.print(name);%></h3></div>
            <div class="col-md-6 text-right">
                <a href="../Logout/logout.jsp" class="btn btn-info">Logout</a>
            </div>
        </div>
        <p></p>
        <h3>Customer Details</h3>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity Sell</th>
                    <th>Price Sold(Each)</th>
                </tr>
            </thead>
            <tbody>
                <%@ include file="../connection.jsp" %>
                <%
                
                String Data = "select cust_id,cust_name,p_name,price,quantity_sell,price_sold from customer,product where product.p_id=customer.p_id";
                rs = statement.executeQuery(Data);
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("cust_id")%></td>
                    <td><%=rs.getString("cust_name")%></td>
                    <td><%=rs.getString("p_name")%></td>
                    <td><%=rs.getString("price")%></td>
                    <td><%=rs.getString("quantity_sell")%></td>
                    <td><%=rs.getString("price_sold")%></td>

                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <div class=" text-right">
                <a href="menu.jsp" class="btn btn-primary">BACK TO MENU</a>
        </div>
<%@ include file="../footer.jsp" %>    
</html>
