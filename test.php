<!DOCTYPE html>
<html lang="en">
  <?php
    // Database Connection
    require '../include/config.php';
     $row_num = 0;

  ?>
  <!-- include head code here -->
  <?php  include('../include/head.php');   ?>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <!-- include nav code here -->
    
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <!-- include sidebar code here -->
      
        <!-- partial -->
          <div class="main-panel">
           
            <!-- Page Title Header Starts-->
            <!-- <div class="row page-title-header">
              <div class="col-12">
                <div class="page-header">
                  <h4 class="page-title">Dashboard</h4>
                  <div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
                    <ul class="quick-links">
                      <li><a href="#"> | DEBT COLLECTION</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div> -->
            <!-- Page Title Header Ends-->
            <form class="form-sample" id="collectionForm" style="margin: 1.2%;">
              
              <?php if (isset($_GET['createDate']) && isset($_GET['center'])): ?>
              
                  <div class="row">
                          <!-- <h5 class="card-title"></h5>
                          <div class="card-scroll"></div> -->
                          
                          <div class="row">
                            <div class="col-md-12">
                              <div class="form-group row">
                                  <?php 
                                  $center_id = $_GET['center']; 
                                  $createDate =  $_GET['createDate'];

                                  $getCenter = mysqli_query($conn, "SELECT * FROM center WHERE id='$center_id'");
                                  $cd = mysqli_fetch_assoc($getCenter);

                                  $center_id   = $cd['id'];
                                  $center_code   = $cd['center_code'];
                                  $center_name = $cd['center_name'];
                                  $leader      = $cd['leader'];
                                  $contact     = $cd['contact'];

                                  $fetchData = mysqli_query($conn, "SELECT * FROM loan WHERE centerID='$center_id' AND status=1");
                                  $count1 = mysqli_num_rows($fetchData);

                                  ///TRUNCATE TABLE FIRST
                                  $sql ="TRUNCATE TABLE temp_collection";
                                  $result=mysqli_query($conn,$sql);

                                  if($count1>0){
                                    while($row1 = mysqli_fetch_assoc($fetchData)){
                                        $loan_no      = $row1['loan_no'];
                                        $contractNo   = $row1['contractNo'];
                                        $customerID   = $row1['customerID'];
                                        $loanAmt      = $row1['loanAmt'];
                                        $rental = $row1['rental'];
                                
                                        $fetchInst = mysqli_query($conn, "SELECT * FROM loan_installement WHERE loanNo='$loan_no' ORDER BY id DESC LIMIT 1");
                                        $count2 = mysqli_num_rows($fetchInst);
                                        
                                        if(!$count2==0){
                                          $row2 = mysqli_fetch_assoc($fetchInst);
                                          
                                          $arrears  = $row2['arrears'];
                                         // echo "<script type='text/javascript'>alert('$arrears');</script>";
                                          $balance  = $row2['outstanding'];
                                          $bef_date = $row2['li_date'];
                                        }else{
                                          $arrears  = 0;
                                          $balance  = $row1['totalAmt'];
                                          $bef_date = $row1['disburseDate'];
                                        }

                                        $pre_date   = strtotime($bef_date);
                                        $now_date   = strtotime($createDate);
                                        $Days = round(($now_date-$pre_date) / (60 * 60 * 24));

                                        //$payable= $daily_rental * $Days;
                                        $payable= $rental;

                                        // echo '<p>'.$loan_no.' | </p>';
                                        // echo '<p>'.$contractNo.' | </p>';
                                        // echo '<p>'.$customerID.' | </p>';
                                        // echo '<p>'.$loanAmt.' | </p>';
                                        // echo '<p>'.$arrears.' | </p><br>';
                                        // echo '<p>'.$arrears.' | </p><br>';
                                        // echo '<p>'.$bef_date.' | </p><br>';
                                        // echo '<p>'.$payable.' | </p><br>';
                                    
                                        $insert = mysqli_query($conn, "INSERT INTO temp_collection(loan_no,contractNo,customerID,loanAmt,Arrears,balance,payable) VALUES($loan_no,'$contractNo',$customerID,'$loanAmt','$arrears','$balance','$payable')");
                                  
                                      // if($insert){
                                      //  echo 1;
                                      // }

                                    }
                                  }

                                  ?>
                                  <input type="hidden" class="form-control" name="center_id" id="center_id" value="<?php echo $center_id; ?>" />
                                  <input type="hidden" class="form-control" name="li_date" id="li_date" value="<?php echo $createDate; ?>" />

                                  <div class="col-md-3">
                                    <label class="col-sm-12 col-form-label"><strong>Formed Date : </strong> <?php echo $createDate; ?> </label>
                                  </div>

                                  <div class="col-md-3">
                                    <label class="col-sm-12 col-form-label"><strong>MSU Name : </strong> <?php echo $center_name; ?> </label>
                                  </div>

                                  <div class="col-md-4">
                                    <label class="col-sm-12 col-form-label"><strong>MSU Leader : </strong> <?php echo $leader .' [' . $contact . ']' ; ?> </label>
                                  </div>

                                  <div class="col-md-2">
                                    <label class="col-sm-12 col-form-label"><strong>Status : </strong> Active</label>
                                  </div>
                              </div>
                            </div>
                          </div>
                          <hr><br>

                          <div class="row">
                            <!-- <div class="col-md-12" style="height: 240px; overflow-y: auto;"> -->
                            <div class="col-md-12">
                            <!-- <div id="here"> -->

                              <input type="hidden" id="myitemjson" name="myitemjson"/>
                              <div class="table-responsive">          
                                <table id="example" class="table table-bordered">
                                <thead>
                                  <tr>
                                    <th style="text-align:center; font-size: 0.677rem;">#</th>
                                    <th style="text-align:center; font-size: 0.677rem;">Contract No</th>
                                    <th style="text-align:center; font-size: 0.677rem;">Customer</th>
                                    <th style="text-align:center; font-size: 0.677rem;">Contact</th>
                                    <th style="text-align:center; font-size: 0.677rem;">NIC</th>
                                    <th style="text-align:center; font-size: 0.677rem;">Payment</th>
                                    <th style="text-align:center; font-size: 0.677rem;">Rental</th>
                                    <th style="text-align:center; font-size: 0.677rem;">Arrears</th>
                                    <th style="text-align:center; font-size: 0.677rem;">Balance</th>
                                    <th style="text-align:center; font-size: 0.677rem;">Loan Amount</th>
                                  </tr>
                                </thead>
                                <tbody>
                                <?php

                                $sql=mysqli_query($conn,"SELECT * FROM temp_collection");
                                
                                  $row_num = mysqli_num_rows($sql); 
                            
                                  if($row_num > 0) {

                                    $total_due = 0;
                                    // $total_arr = 0;
                                    // $total_p = 0;
                                    // $total_out = 0;

                                    while($row = mysqli_fetch_assoc($sql)) {

                                      $loanNo = $row['loan_no'];

                                      $cus = mysqli_query($conn, "SELECT C.name AS customer,C.NIC AS NIC , C.contact FROM customer C INNER JOIN loan L ON C.cust_id = L.customerID WHERE L.loan_no=$loanNo");
                                      $cusRow = mysqli_fetch_assoc($cus);
                                    
                                    
                                      $customer = $cusRow['customer'];
                                      $NIC      = $cusRow['NIC'];
                                      $contact      = $cusRow['contact'];

                                      $id       = $row['id'];
                                      $paid     = $row['paid'];
                                      $pacontractNoid     = $row['contractNo'];
                                      $payable  = $row['payable'];
                                      $arrears  = $row['Arrears'];
                                      $balance  = $row['balance'];
                                      $loanAmt  = $row['loanAmt'];

                                      $total_due = $total_due + $payable;


                                    echo ' <tr>';
                                    echo ' <td style="font-size: 0.677rem;">'.$loanNo.'</td>';
                                    echo ' <td style="font-size: 0.677rem;">'.$contractNo.'</td>';
                                    echo ' <td style="font-size: 0.677rem;">'.$customer.'</td>';
                                    echo ' <td style="font-size: 0.677rem;">'.$contact.'</td>';
                                    echo ' <td style="font-size: 0.677rem;">'.$NIC.'</td>';
                                    echo ' <td style="text-align:right;">
                                         
                                    </td>';
                                    echo ' <td style="text-align:right; font-size: 0.677rem;">
                                     '.number_format($payable, 2, '.', ',').'
                                    </td>';
                                    echo ' <td style="text-align:right; font-size: 0.677rem;">
                                     '.number_format($arrears, 2, '.', ',').'
                                    </td>';
                                    echo ' <td style="text-align:right; font-size: 0.677rem;">
                                    '.number_format($balance, 2, '.', ',').'
                                    </td>';
                                    echo ' <td style="text-align:right; font-size: 0.677rem;">'.number_format($loanAmt, 2, '.', ',').'</td>';
                                    echo ' </tr>';

                                    }
                                  }else{
                                    echo ' <tr style="background-color:#DAF7A6;">';
                                      echo ' <th colspan ="5">No data </th>';
                                    echo ' </tr>';
                                  }
                                ?>
                                </tbody>
                                </table>
                              </div>
                              <br><br>
                              <b><p>Total Count : <?php if(isset($row_num)){echo $row_num;}else{ echo "0";} ?></p></b>

                                <div class="form-group row">
                                  <label class="col-sm-2 col-form-label">Total Due</label>
                                  <div class="col-sm-2">
                                    <b><span><?php if(isset($total_due)){echo number_format($total_due, 2, '.', ',');}else{echo "0";} ?></span></b>
                                  </div>
                                </div>

                                 <div class="form-group row">
                                  <label class="col-sm-2 col-form-label">Total Collection</label>
                                  <div class="col-sm-2">
                                    <span>..................</span>
                                  </div>
                                </div>
                            <!--</div>

                              <input type="hidden" class="form-control" name="add" value="add" /> -->

                              <!-- <input type="number" name="" id="test" value="0"> -->
                              <!-- <button type="button" onclick="cancelForm()" class="btn btn-danger btn-fw">Cancel</button> -->
                            </div>
                          </div><!-- end 2nd row-->
                    </div>
                </form>
              
            <?php else: ?>
            <?php endif ?>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <!-- include footer coe here -->

            <!-- partial -->
         
        <!-- main-panel ends -->
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- include footer coe here -->
  

  </body>
</html>

  <script>
    //////////////////////// CLEAR THE LOCAL STORAGE ////////////////////////

    ///////////////////////////////////////  Print  
    $(document).ready(function(){
        setTimeout(function(){ window.print(); }, 1500);
        // setTimeout(window.close, 3000);
    });
    ///////////////////////////////////////////

    function cancelForm(){
      window.location.href = "debt_collection.php";
    }

</script>