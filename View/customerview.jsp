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
        <h3>Customer Data</h3>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Product ID</th>
                    <th>Quantity Sell</th>
                    <th>Price Sold(Each)</th>
                </tr>
            </thead>
            <tbody>
                <%@ include file="../connection.jsp" %>
                <%
                
                String Data = "select * from customer";
                rs = statement.executeQuery(Data);
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("cust_id")%></td>
                    <td><%=rs.getString("cust_name")%></td>
                    <td><%=rs.getString("p_id")%></td>
                    <td><%=rs.getString("quantity_sell")%></td>
                    <td><%=rs.getString("price_sold")%></td>
                    <td class="text-center" width="180">
                        <a href='../Edit/customeredit.jsp?u=<%=rs.getString("cust_id")%>' class="btn btn-info">Edit</a>
                        <a href='../Delete/customerdelete.jsp?d=<%=rs.getString("cust_id")%>' class="btn btn-warning">Delete</a>
                        
                    </td>
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
