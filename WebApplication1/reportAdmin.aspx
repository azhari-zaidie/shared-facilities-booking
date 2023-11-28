<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile ="reportAdmin.aspx.cs" Inherits="WebApplication1.reportAdmin" %>
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
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Report Chart</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-start-primary py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                            <asp:TextBox ID="idManager" runat="server" Visible="false"></asp:TextBox>
                                                                                    <asp:Button ID="btnPrint" class="btn btn-success btn-sm float-right" runat="server" Text="Print Details" OnClientClick="javascript:PrintPage();" />
                 
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="row">
                         <div class="col-lg-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <p class="text-primary m-0 fw-bold">Total Of Employee for Each Branch</p>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="select (select count(emp_id) from employee) as 'Emp', count(b.branch_id) as 'Branch', (select count(manager_id) from manager) as 'Manager' , (select count(location_id) from location) as 'Location' from   branch b;"></asp:SqlDataSource>
                                        <asp:Chart runat="server" ID="ctl01" Width="461px">
                                            <Series>
                                                <asp:Series Name="Series1" ChartType="StackedBar"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    <div class="col-lg-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <p class="text-primary m-0 fw-bold">Salary Of Each Employee</p>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <asp:Chart runat="server" ID="Chart1"  Width="461px">
                                            <Series>
                                                <asp:Series Name="Series1" ChartType="StackedBar"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
                    
    </div>
</asp:Content>
