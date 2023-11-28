﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="managerDetails.aspx.cs" Inherits="WebApplication1.managerDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top" style="background: var(--bs-indigo);">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <div class="d-none d-sm-inline-block me-auto ms-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group"></div>
                        </div>
                        <ul class="navbar-nav flex-nowrap ms-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <div class="me-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1"></li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="shadow dropdown-list dropdown-menu dropdown-menu-end" aria-labelledby="alertsDropdown"></div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="login.php"><span class="d-none d-lg-inline me-2 text-gray-600 small"></span>
                                    <asp:Image class="border rounded-circle img-profile" ID="Image2" runat="server" />
                                      </a>
                                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in">
                                        <div class="dropdown-divider"></div><asp:HyperLink class="dropdown-item" ID="hypLink1" runat="server" NavigateUrl="login.aspx"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</asp:HyperLink>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Manager Details</h3>
                    <div class="row mb-3">
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <div class="card-body text-center shadow">
                                    <asp:Image class="rounded mx-auto d-block" ID="Image1" runat="server" width="320" height="410"/>
                                    <div class="mb-3"><br>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        <asp:Button ID="btnTest" runat="server" Text="Save Image" ValidationGroup="g1" OnClick="btnTest_Click"/>
                                    </div>
                                    <small class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="g1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="RequiredFieldValidator" Display="Dynamic">*Image is required</asp:RequiredFieldValidator>

                                    </small>
                                </div>
                            </div>
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <div action="../pdf/index.php" method="post">
                                    <input type="hidden" name="booking_id" value="<?php echo $row['booking_id']; ?>">
                                    <h6 class="text-primary fw-bold m-0">Branch Details                                        <asp:Button ID="btnPrint" class="btn btn-success btn-sm float-right" runat="server" Text="Print Details" OnClientClick="javascript:PrintPage();" />
</h6></div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <div class="mb-3">
                                                <label class="form-label"><strong>Branch Name</strong></label>
                                                <asp:TextBox  class="form-control form-control-user"  ID="txtBranchName" runat="server" style="color: rgb(0,0,0);" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="mb-3">
                                                     <label class="form-label"><strong>Branch Address</strong></label>
                                                    <asp:TextBox  class="form-control form-control-user"  ID="txtBranchAddress" runat="server" style="color: rgb(0,0,0);" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div> 
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-header py-3">
                                            <p class="text-primary m-0 fw-bold">Manager</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                  <asp:Label ID="lblSuccess" class="alert alert-success" role="alert" runat="server"></asp:Label>
                                                  <asp:Label ID="lblFailed" class="alert alert-danger" role="alert" runat="server"></asp:Label>
                                            </div>
                                            <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="first_name"><strong>Full Name</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtManagerName" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Manager Name..."></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtManagerName" Display="Dynamic" SetFocusOnError="True">*Name is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="username"><strong>Username</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtManagerUsername" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Manager Username..."></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtManagerUsername" Display="Dynamic" SetFocusOnError="True">*Username is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="username"><strong>Email</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtManagerEmail" runat="server" style="color: rgb(0,0,0);" TextMode="Email" placeholder="Enter Manager Email..."></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtManagerEmail" Display="Dynamic" SetFocusOnError="True">*Email is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label"><strong>Phone</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtManagerPhone" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Manager Phone...">+60</asp:TextBox>
                                                            <small class="text-danger">
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtManagerPhone" Display="Dynamic" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$">*Invalid Phone number</asp:RegularExpressionValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtManagerPhone" Display="Dynamic" SetFocusOnError="True">*Phone is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="first_name"><strong>Address</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtManagerAddress" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Manager Address..."></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtManagerAddress" Display="Dynamic" SetFocusOnError="True">*Address is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                </div>
                                            
                                            <div class="row">
                                                <div class="col">
                                                <div class="mb-3">
                                                    <asp:Button ID="btnInsert" class="btn btn-primary d-block btn-user" runat="server"  Text="Update Manager" OnClick="btnInsert_Click"/>
                                                </div>
                                                    <div class="mb-3"><a class="btn btn-success btn-sm" role="button" id="btn">Change&nbsp;Password</a></div>
                                            </div>
                                            </div>
                                            
                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="myModal" class="modal">
                      <!-- Modal content -->
                      <div class="modal-content">
                        <div action="../functions.php" method="post">
                        <div class="modal-header">
                          <h2>Change Pasword</h2>
                          <span class="close"></span>
                        </div>
                        <div class="modal-body">
                          <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="username"><strong>Password</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtPassword" runat="server" style="color: rgb(0,0,0);" TextMode="Password"></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="g3" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPassword" Display="Dynamic" SetFocusOnError="True">*Password is required</asp:RequiredFieldValidator>
                                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="g3" ErrorMessage="CompareValidator" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">*Password and Confirm Password need to be same</asp:CompareValidator>

                                                                 </small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label"><strong>Confirm Password</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtConfirmPassword" runat="server" style="color: rgb(0,0,0);" TextMode="Password"></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="g3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtConfirmPassword" Display="Dynamic" SetFocusOnError="True">*Confirm Password is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                </div>
                        </div>
                        <div class="modal-footer">
                          <asp:Button ID="btnPassword" ValidationGroup="g3" class="btn btn-primary d-block btn-user" runat="server" Text="Save Password" OnClick="btnPassword_Click"/>
                        </div>
                        </div>
                      </div>
                    </div>
                    </div>
    <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("btn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function() {
          modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
          modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }
    </script>
</asp:Content>
