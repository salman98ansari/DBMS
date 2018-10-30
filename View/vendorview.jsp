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
        <h3>Vendor & Product Data</h3>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>Vendor ID</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity Buy</th>
                    <th>Price Buy</th>
                    <th>Size</th>
                    <th>Product Desc</th>
                </tr>
            </thead>
            <tbody>
                <%@ include file="../connection.jsp" %>
                <%
                

                String Data = "select * from Vendor natural join product";
                rs = statement.executeQuery(Data);
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("v_id")%></td>
                    <td><%=rs.getString("p_id")%></td>
                    <td><%=rs.getString("p_name")%></td>
                    <td><%=rs.getString("quantity")%></td>
                    <td><%=rs.getString("price_buy")%></td>
                    <td><%=rs.getString("size")%></td>
                    <td><%=rs.getString("p_desc")%></td>
                    <td class="text-center" width="180">
                        <a href='../Edit/vendoredit.jsp?u=<%=rs.getString("v_id")%>' class="btn btn-info">Edit</a>
                        <a href='../Delete/vendordelete.jsp?d=<%=rs.getString("v_id")%>' class="btn btn-warning">Delete</a>
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
