<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style type="text/css">
    label#pw{
        margin-left: 41%;
    }
    .btn-primary{
        margin-left: 60%;   
    }


</style>


<%@ include file="../header.jsp" %>
        <p><br/></p>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6"><h3>Customer Data</h3></div>
                </div>
                <p></p>
                <form method="post">

                    <div class="form-group">
                        <label for="custname">Customer Name</label>
                        <input type="text" class="form-control" id="myname" name="zz" placeholder="Customer Name" required="required">
                    </div>

                	<div class="form-group">
                        <label for="myname">Product ID</label>
                        <input type="text" class="form-control" id="myname" name="nm" placeholder="Product ID (integer)" required="required">
                    </div>

                    <div class="form-group">
                        <label for="quantity">Quantity Sell</label>
                        <input type="text" class="form-control" id="myemail" name="em" placeholder="Quantity (Integer)" required="required">
                    </div>
                    <div class="form-group">
                        <label for="pricebuy">Price sold</label>
                        <input type="text" class="form-control" id="mynumber" name="pn" placeholder="Price Sold(Integer)" required="required">
                    </div>

                    <div class="form-group" >
                    <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                     <div id='div1' style='display:none';>
                        Successfully data Entered!!!
                    </div>
                    <br>
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
<script>
        $(document).ready(function() { 
            setTimeout(function() { 
                $('#div1').fadeOut(); 
         }, 2000); 
        });
</script> 


<%@ include file="../connection.jsp" %>
<%
String customername=request.getParameter("zz");
String productid=request.getParameter("nm");
String quantitysell=request.getParameter("em");
String pricesold=request.getParameter("pn");

int statusQuery = 0;

Class.forName("com.mysql.jdbc.Driver").newInstance();
if(customername!=null && productid!=null && quantitysell!=null && pricesold!=null)
{
    String query="Insert into customer(p_id,quantity_sell,price_sold,cust_name) values(?,?,?,?)";
    ps=connection.prepareStatement(query);
    ps.setString(1,productid);
    ps.setString(2,quantitysell);
    ps.setString(3,pricesold);
    ps.setString(4,customername);
    statusQuery=ps.executeUpdate();
    if(statusQuery>0)
    {
        %>

        <script>
                $(document).ready(function(){
                        $('#div1').show();
                    });
              setTimeout(function() {
                  document.location = "../View/menu.jsp";
              }, 1000); // <-- this is the delay in milliseconds
        </script>
        <%
    }
}
%>






