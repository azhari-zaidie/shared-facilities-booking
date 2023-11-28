<%@ Page Title="Branch" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="branchNew.aspx.cs" Inherits="WebApplication1.branchNew" %>
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
                    <h3 class="text-dark mb-4">Add New Branch</h3>
                    <div class="row mb-3">
                        <div class="col-lg-2">
                        </div>
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-header py-3">
                                            <p class="text-primary m-0 fw-bold">Branch</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                  <asp:Label ID="lblSuccess" class="alert alert-success" role="alert" runat="server"></asp:Label>
                                                  <asp:Label ID="lblFailed" class="alert alert-danger" role="alert" runat="server"></asp:Label>
                                            </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="username"><strong>Name</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtBranchName" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Branch Name..."></asp:TextBox>
                                                            <small class="text-danger">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtBranchName" Display="Dynamic" SetFocusOnError="True">*Name is required</asp:RequiredFieldValidator>
                                                         </small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="address"><strong>Manager</strong></label>
                                                        <asp:DropDownList ID="drpManager" class="browser-default custom-select" runat="server" DataSourceID="sqlManager1" DataTextField="manager_name" DataValueField="manager_id"></asp:DropDownList>
                                                            <small class="text-danger">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ControlToValidate="drpManager" ErrorMessage="RequiredFieldValidator">*Select Manager</asp:RequiredFieldValidator>                                                            </small>
                                                        <asp:SqlDataSource ID="sqlManager1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="select manager_id, manager_name from manager where manager_name !='Admin' except select b.manager_id, m.manager_name from branch b, manager m where b.manager_id = m.manager_id;"></asp:SqlDataSource>
                                                    </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="address"><strong>Address</strong></label>
                                                        <asp:DropDownList ID="drpLocation1" class="browser-default custom-select" runat="server" DataSourceID="sqlLocation1" DataTextField="location_address" DataValueField="location_id"></asp:DropDownList>
                                                            <small class="text-danger">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="drpLocation1" ErrorMessage="RequiredFieldValidator">*Select Location</asp:RequiredFieldValidator>
                                                            </small>
                                                        <asp:SqlDataSource ID="sqlLocation1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="select location_id, location_address from location except select b.location_id, l.location_address from branch b, location l where b.location_id = l.location_id;"></asp:SqlDataSource>
                                                    </div>
                                                    </div>
                                                </div>
                                            <div class="mb-3">
                                                <asp:Button ID="btnInsert" class="btn btn-primary d-block btn-user w-100" runat="server" Text="Add New Branch" OnClick="btnInsert_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
    </div>
</asp:Content>
