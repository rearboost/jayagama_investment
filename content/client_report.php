<!DOCTYPE html>
<html lang="en">
 <?php
    // Database Connection
    require '../include/config.php';
  ?>
  <!-- include head code here -->
  <?php  include('../include/head.php');   ?>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <!-- include nav code here -->
      <?php  include('../include/nav.php');   ?>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <!-- include sidebar code here -->
        <?php  include('../include/sidebar.php');   ?>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- Page Title Header Starts-->
            <div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Dashboard</h4>
                  <div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
                    <ul class="quick-links">
                      <li><a href="#"> REPORT</a></li>
                      <li><a href="#"> CLIENT REPORT</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <!-- Page Title Header Ends-->
            <div class="col-12 stretch-card">
                <div class="card">
                    <div class="card-body">
                    <!-- <h4 class="card-title">Job Status report</h4> -->
                    <!-- <p class="card-description"> Horizontal form layout </p> -->
                        <div class="row">
                            <div class="col-md-6">
                              <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Choose a Center</label>
                                <div class="col-sm-8">
                                <SELECT class="form-control" name="center" id="center" required>
                                  <option disabled="" selected="">--Choose a  Center--</option>
                                  <?php
                                    $custom = "SELECT * FROM center";
                                    $result = mysqli_query($conn,$custom);
                                    $numRows = mysqli_num_rows($result); 
                    
                                    if($numRows > 0) {
                                        while($row1 = mysqli_fetch_assoc($result)) {
                                            echo '<option value ="'.$row1["id"].'">' . $row1["center_code"]. ' | ' .$row1["center_name"];
                                        }
                                    }
                                  ?>
                                </SELECT>
                                </div>
                              </div>
                              <button type="button" onclick="cancelForm()" class="btn btn-warning btn-fw">Cancel</button>  
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                <label class="col-sm-5 col-form-label">Select Client Type</label>
                                    <div class="col-sm-7">
                                        <input list="brow" class="form-control" name="type" id="type" required>
                                          <datalist id="brow">
                                               <option value ="All">
                                               <option value ="Active">
                                               <option value ="Deactive">
                                          </datalist> 
                                    </div>
                                </div>                      
                            </div>
                        </div>
                  </div>
                </div>
            </div>
            <br>

            <?php if (isset($_GET['view_id1']) && isset($_GET['view_id2'])): ?>
            
            <form class="forms-sample" id="report_form">

                <input type="hidden" value ='<?php echo $_GET['view_id1']; ?>' name="center">
                <input type="hidden" value ='<?php echo $_GET['view_id2']; ?>' name="type">

                <div class="col-lg-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                        <?php
                        $center = $_GET['view_id1'];
                        $type = $_GET['view_id2'];

                          $getName = mysqli_query($conn, "SELECT * FROM center WHERE id=$center ");
                          $val = mysqli_fetch_assoc($getName);
                          $centerName = $val['center_name'];
                          $centerCode = $val['center_code'];
                        ?>
                        <center><b><h5><?php echo $_GET['view_id2']; ?>&nbsp; Clients In <?php echo $centerName . ' ['. $centerCode. ']'; ?></h5></b></center>
                        <br>
                        <div class="row">
                    
                        <?php 

                        
                        //   $sql_buyerName=mysqli_query($conn,"SELECT * FROM po_entering WHERE status='$poNo'");
                        //   $row_buyerName= mysqli_fetch_assoc($sql_buyerName);
                        //   $bpo_no = $row_buyerName['bpo_no'];

                        if($type =='All'){

                          $sql = mysqli_query($conn, "SELECT DISTINCT(C.cust_id) as cust_id, C.memberID AS memberID, name AS name, NIC AS NIC, contact AS contact, contact2 AS contact2, address AS address, C.image AS image FROM customer C INNER JOIN loan L ON C.cust_id=L.customerID WHERE L.centerID='$center' ");

                        }else if($type =='Active'){

                          $sql = mysqli_query($conn, "SELECT * FROM customer C INNER JOIN loan L ON C.cust_id=L.customerID WHERE L.centerID='$center' AND L.status='1'");

                        }else if($type =='Deactive'){

                          $sql = mysqli_query($conn, "SELECT * FROM customer C INNER JOIN loan L ON C.cust_id=L.customerID WHERE  L.centerID='$center' AND L.status='0' AND C.cust_id NOT IN (SELECT customerID FROM loan WHERE status='1')");
                        }
                    
                        ?>

                       <!-- <h4 class="card-title">Materials</h4> -->
                        <div class="table-responsive">
                            <div id="printablediv">
                            <table class="table table-bordered" id="costing_bom_table">
                                <thead>
                                    <tr>
                                    <th> # </th>
                                    <th>Member # </th>
                                    <th>Name</th>
                                    <th>NIC</th>
                                    <th>Contact 01 </th>
                                    <th>Contact 02 </th>
                                    <th>Address </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    
                                    $numRows = mysqli_num_rows($sql); 
                                
                                    if($numRows > 0) {
                                        $i = 1;

                                        while($row = mysqli_fetch_assoc($sql)) {

                                        $memberID  = $row['memberID'];
                                        $image   = $row['image'];
                                        $name = $row['name'];
                                        $NIC = $row['NIC'];
                                        $contact = $row['contact'];
                                        $contact2 = $row['contact2'];
                                        $address = $row['address'];

                                        // $center = mysqli_query($conn, "SELECT * FROM center WHERE id='$centerID'");
                                        // $detail = mysqli_fetch_assoc($center);

                                        // $center_name = $detail['center_name'];

                                        echo ' <tr>';
                                        echo ' <td>'.$i.' </td>';
                                        echo ' <td> <img src="../upload/'.$image.' "></td>';
                                        echo ' <td>'.$memberID.' </td>';
                                        echo ' <td>'.$name.' </td>';
                                        echo ' <td>'.$NIC.' </td>';
                                        echo ' <td>'.$contact.' </td>';
                                        echo ' <td>'.$contact2.' </td>';
                                        echo ' <td>'.$address.' </td>';
                                        echo ' </tr>';
                                        $i++;
                                        }
                                    }
                                    ?>
                                </tbody>
                            </table>
                            </div>
                            <br>
                             
                            <button type="button"  onclick="javascript:printDiv('printablediv');" class="btn btn-info btn-fw" >PRINT</button>   
                            <br>
                            <br>                       
                        </div> 
                   </div>
                 </div>
               </div>
              </div>
            </form>
           <?php else: ?>

           <?php endif ?>
            
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <!-- include footer coe here -->
          <?php include('../include/footer.php');   ?>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- include footer coe here -->
    <?php include('../include/footer-js.php');   ?>

  </body>
</html>


<script>
   
    ////////////// status get  ///////////////////////
    $("#type").on('change',function(){

      var center = $('#center').val();

      var type = $(this).val();
      if(center && type){     
        window.location.href = "client_report.php?view_id1="+center+"&view_id2="+ type;
      }else{
        alert('Please select both Center and Type');
      }

    });

    function cancelForm(){

        window.location.href = "client_report.php";
    }

    function printDiv(divID)
    {
     
        //Get the HTML of div
        var divElements = document.getElementById(divID).innerHTML;
        //Get the HTML of whole page
        var oldPage = document.body.innerHTML;

        //Reset the page's HTML with div's HTML only
        document.body.innerHTML =
            "<html><head><title></title></head><body>" +
            divElements + "</body>";

        //Print Page
        window.print();

        //Restore orignal HTML
        document.body.innerHTML = oldPage;

    }


  </script>