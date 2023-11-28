<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="WebApplication1.location" %>
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
                    <h3 class="text-dark mb-4">Location Details</h3>
                    <div class="row mb-3">
                        <div class="col-lg-4">
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-header py-3">
                                            <p class="text-primary m-0 fw-bold">Location</p>
                                        </div>
                                        <div class="card-body">
                                       <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="first_name"><strong>Location Postal Code</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtDepartmentId" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Postal Code..." ></asp:TextBox>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="locationID" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Postal Code..." Visible="false"></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDepartmentId" Display="Dynamic" SetFocusOnError="True">*Code is required</asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtDepartmentId" ValidationExpression="\d{5}(-\d{4})?">*Invalid Code</asp:RegularExpressionValidator>
                                                            </small
                                                                ><br />
                                                            <label class="form-label" for="first_name"><strong>Location Name</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtDepartment" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Location Name..."></asp:TextBox>
                                                            
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDepartment" Display="Dynamic" SetFocusOnError="True">*Name is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                </div>
                                                        <div class="row">
                                            <div class="col-xxl-4"><asp:Button  class="btn btn-primary d-block btn-user w-100" ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" /></div>
                                            <div class="col-xxl-4"><asp:Button class="btn btn-success d-block btn-user w-100" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" /></div>
                                            <div class="col-xxl-4"><asp:Button class="btn btn-warning d-block btn-user w-100" ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" /></div>

                                            </div>
                                            <br />
                                            <div class="row">
                                    <div class="mb-6"><asp:Button  class="btn btn-light d-block btn-user w-100" ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click"/></div>

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
                                            <p class="text-primary m-0 fw-bold">List Of Location</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                  <asp:Label ID="lblSuccess" class="alert alert-success" role="alert" runat="server"></asp:Label>
                                                  <asp:Label ID="lblFailed" class="alert alert-danger" role="alert" runat="server"></asp:Label>
                                            </div>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT * FROM [location]"></asp:SqlDataSource>
                                                   <div class="table-responsive table mb-0 pt-3 pe-2">
                                                  <asp:GridView ID="GridView1" runat="server" class="table table-bordered" style="width:100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="location_id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                      <Columns>
                                                          <asp:CommandField ShowSelectButton="True" />
                                                          <asp:BoundField DataField="location_id" HeaderText="Location ID" InsertVisible="False" ReadOnly="True" SortExpression="location_id"  />
                                                          <asp:BoundField DataField="location_address" HeaderText="Location Address" SortExpression="location_address" />
                                                          <asp:BoundField DataField="location_postalcode" HeaderText="Postal Code" SortExpression="location_postalcode" />
                                                      </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
</asp:Content>
