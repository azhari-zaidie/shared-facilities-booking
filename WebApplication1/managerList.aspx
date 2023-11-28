<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="managerList.aspx.cs" Inherits="WebApplication1.managerList" %>
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
                    <h3 class="text-dark mb-4">Manager List</h3>
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 fw-bold">Manager Info</p>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <asp:Label ID="lblSuccess" class="alert alert-success" role="alert" runat="server"></asp:Label>
                                                  <asp:Label ID="lblFailed" class="alert alert-danger" role="alert" runat="server"></asp:Label>
                            </div>
                            
                            <div class="table-responsive table mb-0 pt-3 pe-2">
                              <asp:GridView ID="GridView1" runat="server" class="table table-bordered" style="width:100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="manager_id" >
                                <Columns>
                                    <asp:BoundField DataField="manager_id" HeaderText="manager_id" SortExpression="manager_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                                    <asp:BoundField DataField="manager_username" HeaderText="Username" SortExpression="manager_username" />
                                    <asp:BoundField DataField="manager_name" HeaderText="Fullname" SortExpression="manager_name" />
                                    <asp:BoundField DataField="manager_email" HeaderText="Email" SortExpression="manager_email" />
                                    <asp:BoundField DataField="manager_address" HeaderText="Address" SortExpression="manager_address" />
                                    <asp:BoundField DataField="manager_phone" HeaderText="Phone" SortExpression="manager_phone" />
                                    <asp:hyperlinkfield  Text="<i class='fas fa-edit'></i>" datanavigateurlfields="manager_id" HeaderText="Action" datanavigateurlformatstring="~\managerDetails.aspx?manager_id={0}" HeaderStyle-Width="5%"/>   
                                    <asp:hyperlinkfield  Text="<i class='fas fa-trash'></i>" datanavigateurlfields="manager_id" datanavigateurlformatstring="~\managerList.aspx?del={0}"  /> 
                                </Columns>
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT [manager_id], [manager_username], [manager_name], [manager_email], [manager_address], [manager_phone] FROM [manager]  except select [manager_id], [manager_username], [manager_name], [manager_email], [manager_address], [manager_phone] from manager where manager_username='Admin'"></asp:SqlDataSource>
                                   
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>
