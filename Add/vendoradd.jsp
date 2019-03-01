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
                    <div class="col-md-6"><h3>ADD PRODUCT</h3></div>
                </div>
                <p></p>
                <form method="post">


                    <div class="form-group">
                        <label for="myname">Product Name</label>
                        <input type="text" class="form-control" id="myname" name="nm" placeholder="Product Name" required="required">
                    </div>

                    <div class="form-group">
                        <label for="myemail">Quantity Buy</label>
                        <input type="text" class="form-control" id="myemail" name="em" placeholder="Quantity (Integer)" required="required">
                    </div>


                    <div class="form-group">
                        <label for="pricebuy">Price Buy</label>
                        <input type="text" class="form-control" id="mynumber" name="pn" placeholder="Price Buy (Integer)" required="required">
                    </div>
                     <div class="form-group">
                        <label for="PID">PID</label>
                        <input type="text" class="form-control" id="mynumber" name="pid" placeholder="PID" required="required">
                    </div>
                     <div class="form-group">
                        <label for="p_desc">Product Description</label>
                        <input type="text" class="form-control" id="mynumber" name="desc" placeholder="Product Description" required="required">
                    </div>
                    <div class="form-group">
                        <label for="size">Product Size</label>
                        <input type="text" class="form-control" id="mynumber" name="size" placeholder="Product Size" required="required">
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
String productname=request.getParameter("nm");
String quantity=request.getParameter("em");
String pricebuy=request.getParameter("pn");
String p_id = request.getParameter("pid");
String size = request.getParameter("size");
String p_desc=request.getParameter("desc");
int statusQuery = 0;

Class.forName("com.mysql.jdbc.Driver").newInstance();
if(productname!=null && quantity!=null && pricebuy!=null)
{

	String query="Insert into vendor(p_id,p_name,quantity,price_buy) values(?,?,?,?)";
	ps=connection.prepareStatement(query);
    ps.setString(1,p_id);
    ps.setString(2,productname);
    ps.setString(3,quantity);
    ps.setString(4,pricebuy);
    statusQuery=ps.executeUpdate();
    ps=null;
    String query1="Insert into product(p_id,p_name,quantity,price,size,p_desc) values(?,?,?,?,?,?)";
    ps=connection.prepareStatement(query1);
    ps.setString(1,p_id);
    ps.setString(2,productname);
    ps.setString(3,quantity);
    ps.setString(4,pricebuy);
    ps.setString(5,size);
    ps.setString(6,p_desc);
    ps.executeUpdate();
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