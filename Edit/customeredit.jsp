<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../header.jsp" %>
        <p><br/></p>
        
        <%@ include file="../connection.jsp" %>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6"><h3>Edit/Update Data</h3></div>
                    <div class="col-md-6 text-right">
                        <a href="../View/customerview.jsp" class="btn btn-info">Back to View</a>
                    </div>
                </div>
                <p></p>
                <form action="" method="post">
                    <%

                    String u=request.getParameter("u");
                    int num=Integer.parseInt(u);
                    String Data = "select * from customer where cust_id='"+num+"'";
                    rs = statement.executeQuery(Data);
                    while (rs.next()) {
                    %> 

                    <input type="hidden" name="cust_id" value='<%=rs.getString("cust_id")%>'/>

                    <input type="hidden" name="p_id" value='<%=rs.getString("p_id")%>'/>

                    <div class="form-group">
                        <label for="custname">Customer Name</label>
                        <input type="text" class="form-control" id="myname" name="zz" value='<%=rs.getString("cust_name")%>' required="required">
                    </div>

                    <div class="form-group">
                        <label for="quantity">Quantity Sell</label>
                        <input type="text" class="form-control" id="myemail" name="em" value='<%=rs.getString("quantity_sell")%>' required="required">
                    </div>
                    <div class="form-group">
                        <label for="pricebuy">Price sold</label>
                        <input type="text" class="form-control" id="mynumber" name="pn" value='<%=rs.getString("price_sold")%>' required="required">
                    </div>

                    <%
                    }
                %>
                <button type="submit" class="btn btn-warning">Update</button>
                </form>
            </div>
        </div>
<%@ include file="../footer.jsp" %>    
</html>

<script type="text/javascript">
    
    var select = '';
    for (i=18;i<=100;i++){
        select += '<option val=' + i + '>' + i + '</option>';
    }
    $('#some_select').html(select);
</script>

<%
String cust_id=request.getParameter("cust_id");
String productid=request.getParameter("p_id");
String customername=request.getParameter("zz");
String quantitysell=request.getParameter("em");
String pricesold=request.getParameter("pn");
int updateQuery = 0;

if(productid!=null && customername!=null && quantitysell!=null && pricesold!=null)
{
    try{
    String query="update customer set cust_name=?,quantity_sell=?,price_sold=? where customer.cust_id='"+cust_id+"'";
    ps=connection.prepareStatement(query);
    ps.setString(1,customername);
    ps.setString(2,quantitysell);
    ps.setString(3,pricesold);
    updateQuery=ps.executeUpdate();
    if(updateQuery!=0)
    {
    response.sendRedirect("../View/customerview.jsp");
    }
    }
    catch(Exception ex)
    {
        out.println("Your Connection: "+ex);
    }

    finally
    {
        ps.close();
        connection.close();
    }
}
%>
