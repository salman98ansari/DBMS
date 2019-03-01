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
        <br>
        <br>

<div class="jumbotron">
    <div class="text-center">
            <h4>Data Entry in Database. i.e(In Vendor and Product Table through one form)</h4>
            <h3 class=" text-center">Vendor/Product</h3>
            <div class="text-center">
                <a href="../Add/vendoradd.jsp" class="btn btn-primary btn-lg ">Data Entry</a>
            </div>
            <br>



            <div class="text-center">
                <a href="vendorview.jsp" class="btn btn-warning btn-lg " > Data View/Edit</a>
            </div>

    </div>

</div>
<br>
<br>
<br>


<div class="jumbotron">
    <div>
            <h3 class="text-center">Customer</h3>
            <div class="text-center">
                <a href="../Add/customeradd.jsp" class="btn btn-primary btn-lg ">Data Entry</a>
            </div>
            <br>



            <div class="text-center">
                <a href="customerview.jsp" class="btn btn-warning btn-lg " >Data View/Edit</a>
            </div>


            <br>

            <div class="text-center">
            <a href="details.jsp" class="btn btn-primary btn-lg ">Details</a>
            </div>



    </div>

</div>