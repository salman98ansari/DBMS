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
                        <a href="../View/vendorview.jsp" class="btn btn-info">Back to View</a>
                    </div>
                </div>
                <p></p>
                <form action="" method="post">
                    <%

                    String u=request.getParameter("u");
                    int num=Integer.parseInt(u);
                    String Data = "SELECT * from product NATURAL JOIN vendor where vendor.v_id='"+num+"'";
                    rs = statement.executeQuery(Data);
                    while (rs.next()) {
                    %>

                    <input type="hidden" name="vid" value='<%=rs.getString("v_id")%>'/>

                    <input type="hidden" name="p_id" value='<%=rs.getString("p_id")%>'/>

                    <div class="form-group">
                        <label for="myname">Product Name</label>
                        <input type="text" class="form-control" id="myname" name="nm" value='<%=rs.getString("p_name")%>' required="required">
                    </div>

                    <div class="form-group">
                        <label for="Quantity">Quantity</label>
                        <input type="text" class="form-control" id="myemail" name="em" value='<%=rs.getString("quantity")%>' required="required">
                    </div>


                    <div class="form-group">
                        <label for="pricebuy">Price Buy</label>
                        <input type="text" class="form-control" id="mynumber" name="pn" value='<%=rs.getString("price_buy")%>' required="required">
                    </div>
                  <!--   <div class="form-group">
                        <label for="PID">PID</label>
                        <input type="text" class="form-control" id="mynumber" name="pid" value='<%=rs.getString("p_id")%>' required="required">
                    </div> -->
                     <div class="form-group">
                        <label for="p_desc">Product Description</label>
                        <input type="text" class="form-control" id="mynumber" name="desc" value='<%=rs.getString("p_desc")%>' required="required">
                    </div>
                    <div class="form-group">
                        <label for="size">Product Size</label>
                        <input type="text" class="form-control" id="mynumber" name="size" value='<%=rs.getString("size")%>' required="required">
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
String vid =request.getParameter("vid");
String p_id=request.getParameter("p_id");
String productname=request.getParameter("nm");
String quantity=request.getParameter("em");
String pricebuy=request.getParameter("pn");
String size = request.getParameter("size");
String p_desc=request.getParameter("desc");
int updateQuery = 0;

if(productname!=null && quantity!=null && pricebuy!=null){

try
{
    
    String query = "update vendor set p_name=?,quantity=?,price_buy=? where vendor.v_id='"+vid+"'";
    ps=connection.prepareStatement(query);
    ps.setString(1,productname);
    ps.setString(2,quantity);
    ps.setString(3,pricebuy);
    updateQuery=ps.executeUpdate();
    ps=null;
    String query1="update product set p_name=?,quantity=?,price=?,size=?,p_desc=? where product.p_id='"+p_id+"'";
    ps=connection.prepareStatement(query1);
    ps.setString(1,productname);
    ps.setString(2,quantity);
    ps.setString(3,pricebuy);
    ps.setString(4,size);
    ps.setString(5,p_desc);
    ps.executeUpdate();

    if(updateQuery!=0)
    {
    response.sendRedirect("../View/vendorview.jsp");
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


