<!DOCTYPE html>
<html lang="en">
  <?php
    // Database Connection
    require '../include/config.php';

  ?>
  <!-- include head code here -->
  <?php  include('../include/head.php');   ?>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                      <li><a href="#"> | LOANS</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <!-- Page Title Header Ends-->
            <form class="form-sample" id="loanAdd">
              <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                    <h4 class="card-title">Loan Application</h4>

                        <div class="row">
                        <?php
                          $get_id = mysqli_query($conn, "SELECT loan_no FROM loan ORDER BY loan_no DESC LIMIT 1");

                          $data = mysqli_fetch_assoc($get_id);

                          $next_id = $data['loan_no']+1;
                        ?>
                        <input type="hidden" id="loan_no" value="<?php echo $next_id; ?>">


                          <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Branch</label>
                                <div class="col-sm-9">
                                  <input type="text" class="form-control" name="branch" required/>
                                </div>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label calRental">Interest Rate(%)</label>
                                <div class="col-sm-9">
                                  <input type="text" class="form-control" name="intRate" id="intRate" required/>
                                </div>
                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Customer</label>
                                <div class="col-sm-8">
                                  <SELECT class="form-control" name="customer" id="customer" required>
                                    <option disabled="" selected="">--Select Customer--</option>
                                    <?php
                                      $custom = "SELECT * FROM customer";
                                      $result = mysqli_query($conn,$custom);
                                      $numRows = mysqli_num_rows($result); 
                      
                                      if($numRows > 0) {
                                          while($row = mysqli_fetch_assoc($result)) {
                                              echo '<option value ="'.$row["cust_id"].'">' . $row["member_id"]. ' | ' .$row["name"];
                                          }
                                      }
                                    ?>
                                  </SELECT>
                                </div>

                                <div class="col-sm-1 size">
                                    <i class="fa fa-plus-circle pointer" onclick="customerForm()"></i>   
                                </div>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label calRental">Terms (weeks)</label>
                                <div class="col-sm-9">
                                  <input type="text" class="form-control" name="terms" id="terms" required/>
                                </div>
                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Center</label>
                              <div class="col-sm-9">
                              <SELECT class="form-control" name="center" id="center" required>
                                <option disabled="" selected="">--Select Center--</option>
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
                          </div>
                          <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Rental</label>
                                <div class="col-sm-9">
                                  <input type="text" class="form-control" name="rental" id="rental" required/>
                                </div>
                            </div>
                          </div>
                        </div>
                        
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group row">
                              <label class="col-sm-3 col-form-label">Contract No</label>
                              <div class="col-sm-9">
                                <input type="text" class="form-control" name="contractNo" id="contractNo" required/>
                              </div>
                             </div>
                          </div>

                          <div class="col-md-6">
                              <div class="form-group row">
                              <label class="col-sm-3 col-form-label">Inspection Date </label>
                              <div class="col-sm-9">
                                  <input type="date" class="form-control" name ="inspectionDate" required="" />
                              </div>
                              </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group row">
                              <label class="col-sm-3 col-form-label calRental">Loan Amount</label>
                              <div class="col-sm-9">
                                <input type="text" class="form-control" name="loanAmt" id="loanAmt" required/>
                              </div>
                             </div>
                          </div>

                          <div class="col-md-6">
                              <div class="form-group row">
                              <label class="col-sm-3 col-form-label">Disburse Date</label>
                              <div class="col-sm-9">
                                  <input type="date" class="form-control" name ="disburseDate" value="<?php echo date("Y-m-d"); ?>" required="" />
                              </div>
                              </div>
                          </div>
                        </div>
                       
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group row">
                              <label class="col-sm-3 col-form-label">Gurantee Details</label>
                              <div class="col-sm-9">
                                <textarea class="form-control" name="gurantee" rows="3" placeholder="Name | NIC No | Contact No"></textarea>
                              </div>
                            </div>
                          </div>

                          <div class="col-md-6">
                            <div class="form-group row">
                              <label class="col-sm-3 col-form-label">loan Step</label>
                              <div class="col-sm-9">
                                <SELECT class="form-control" name="loanStep" required>
                                  <option value="1" selected="" disabled="">--Select Loan Step--</option>
                                  <option value="1">Step 01</option>
                                  <option value="2">Step 02</option>
                                  <option value="3">Step 03</option>
                                </SELECT>
                              </div>
                            </div>
                          </div>
                        </div>

                        <input type="hidden" class="form-control" name="add" value="add" />
                        <button type="submit" class="btn btn-primary btn-fw">SAVE</button>
                        <button type="button" onclick="cancelForm()" class="btn btn-danger btn-fw">Cancel</button>
                    </div>
                  </div>
                </div>
              </div>                
            </form>

            <div class="row">
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Loan Details</h4>
                    
                    <div class="table-responsive">          
                    <table id="myTable" class="table table-bordered">
                      <thead>
                        <tr>
                          <th style="display: none;"> # </th>
                          <th> # </th>
                          <th>Customer</th>
                          <th>Center</th>
                          <th>Contract #</th>
                          <th>Amount </th>
                          <th>Terms</th>
                          <th>Interest Rate(%)</th>
                          <th>Rental</th>
                          <th>Disburse Date</th>
                          <th>Print</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                          $sql=mysqli_query($conn,"SELECT * FROM customer C INNER JOIN loan L ON C.cust_id=L.customerID WHERE L.status=1 ORDER BY L.loan_no DESC");
                          
                          $numRows = mysqli_num_rows($sql); 
                    
                          if($numRows > 0) {
                            $i = 1;
                            while($row = mysqli_fetch_assoc($sql)) {

                            $name   = $row['name'];

                            // $custom = myswqli_query($conn, "SELECT * FROM customer WHERE cust_id='$customerID' ");
                            // $customData = mysqli_fetch_assoc($custom);
                            // $name = $customData['name'];

                            $centerID     = $row['centerID'];

                            $center = myswqli_query($conn, "SELECT * FROM center WHERE id='$centerID' ");
                            $centerData = mysqli_fetch_assoc($center);
                            $centername = $centerData['center_name'];

                            $loan_no      = $row['loan_no'];   
                            $contractNo   = $row['contractNo'];   
                            $loanAmt      = $row['loanAmt'];
                            $terms        = $row['terms'];
                            $interestRate = $row['interestRate'];
                            $rental       = $row['rental'];
                            $disburseDate = $row['disburseDate'];

                              echo ' <tr>';
                              echo ' <td style="display: none;">'.$i.' </td>';
                              echo ' <td>'.$loan_no.' </td>';
                              echo ' <td>'.$name.' </td>';
                              echo ' <td>'.$centername.' </td>';
                              echo ' <td>'.$contractNo.' </td>';
                              echo ' <td>'.$loanAmt.' </td>';
                              echo ' <td>'.$terms.' </td>';
                              echo ' <td>'.$interestRate.' </td>';
                              echo ' <td>'.$rental.' </td>';
                              echo ' <td>'.$disburseDate.' </td>';
                              
                              echo '<td class="td-center"><button type="button" onclick="printForm('.$row["loan_no"].')" name="print" class="btn btn-primary btn-fw">PRINT</button></td>';
                              
                              echo ' </tr>';
                              $i++;
                            }
                          }
                        ?>
                      </tbody>
                    </table>
                    </div>
                  </div>
                </div>
              </div>
             
             
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
    $(document).ready( function () {
      $('#myTable').DataTable();
    });
    
    //var numberRegex = /^[+-]?\d+(\.\d+)?([eE][+-]?\d+)?$/;

    $('#customer').on('change',function(){

        // var customerID = this.value;
        // $.ajax({
        //     type: 'post',
        //     url: '../functions/get_customerDetail.php',
        //     data: {customerID:customerID},
        //     success: function (response) {

        //         var obj = JSON.parse(response);

        //         var id      = obj.id
        //         var address = obj.address
        //         var nic     = obj.nic
        //         var contact = obj.contact

        //         $('#customerID').val(id);
        //         $('#address').val(address);
        //         $('#nic').val(nic);
        //         $('#contact').val(contact);

        //     }
        // });
    });

    $('.calRental').on('keyup',function(){
        var loanAmt = $('#loanAmt').val();
        var terms   = $('#terms').val();
        var intRate = $('#intRate').val();

        var interest = Number(loanAmt)*Number(intRate/100)*Number(terms);
        var rental = Number(loanAmt)+Number(interest).toFixed(2);

        $('#rental').val(rental);
    });

    ////////////////////// Form Submit Add  /////////////////////////////

    $(function () {

        $('#customerAdd').on('submit', function (e) {

          e.preventDefault();

          $.ajax({
            type: 'post',
            url: '../controller/customer_controller.php',
            data: $('#customerAdd').serialize(),
            success: function (data) {
                  if(data==0){

                    swal({
                      title: "Can't Duplication !",
                      text: "Customer",
                      icon: "error",
                      button: "Ok !",
                    });

                  }else{
                    swal({
                    title: "Good job !",
                    text: "Successfully Submited",
                    icon: "success",
                    button: "Ok !",
                    });
                    setTimeout(function(){ location.reload(); }, 2500);
                    
                  }
               }
          });
        });
      });

    ///////////////////////////////////////////////////

    $(function () {

        $('#loanAdd').on('submit', function (e) {

          e.preventDefault();

          var loan_no= $('#loan_no').val();

              $.ajax({
                type: 'post',
                url: '../controller/loan_controller.php',
                data: $('#loanAdd').serialize(),
                success: function (data) {

                    if(data==0){

                        swal({
                          title: "Can't Duplication !",
                          text: "Jobs",
                          icon: "error",
                          button: "Ok !",
                        });

                    }else{

                        swal({
                          title: "Good job !",
                          text: "Successfully Submited",
                          icon: "success",
                          button: "Ok !",
                          });
                          //setTimeout(function(){ location.reload(); }, 2500);
                          //setTimeout(function(){window.open('receipt?id='+mid, '_blank'); }, 100);

                          setTimeout(function(){ location.reload(); }, 2500);
                    }
                }
              });


        });
      });


    function cancelForm(){
        window.location.href = "loan.php";
    }

    // print bill //////
    function printForm(id){
      //window.open('receipt?id='+id, '_blank');
      window.location.href = "loan.php";
    }



    function customerForm(){
        $('#myModal').modal('show');
    }


</script>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Customer Register</h4>
        </div>
        <div class="modal-body">
          <div class="card">
            <div class="card-body">
            <!-- <h4 class="card-title">Customer Register</h4> -->
            <!-- <p class="card-description"> Basic form elements </p> -->
            <form class="forms-sample" id="customerAdd">
                <div class="form-group">
                <label for="exampleInputName1">Name</label>
                <input type="text" class="form-control" name="name" placeholder="customer name here.." required>
                </div>
                <div class="form-group">
                <label for="exampleTextarea1">Address</label>
                <textarea class="form-control" name="address" rows="2" placeholder="customer address here.."></textarea>
                </div>
                <div class="form-group">
                <label for="exampleInputEmail3">NIC No</label>
                <input type="text" class="form-control" name="nic" required>
                </div>
                <div class="form-group">
                <label for="exampleInputName1">Tel No</label>
                <input type="number" class="form-control" name="contact" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength = "10" minlength="10"required>
                </div>
                <input type="hidden" class="form-control" name="add" value="add" />
                <button type="submit" class="btn btn-success mr-2">Submit</button>
                <!-- <button class="btn btn-light">Cancel</button> -->
            </form>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


