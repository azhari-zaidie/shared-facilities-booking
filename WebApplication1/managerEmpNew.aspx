<%@ Page Title="" Language="C#" MasterPageFile="~/emp.Master" AutoEventWireup="true" CodeBehind="managerEmpNew.aspx.cs" Inherits="WebApplication1.managerEmpNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top" style="background: var(--bs-indigo);">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <form class="d-none d-sm-inline-block me-auto ms-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group"></div>
                        </form>
                        <ul class="navbar-nav flex-nowrap ms-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="me-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
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
                    <h3 class="text-dark mb-4">Add New Employee</h3>
                    <div class="row mb-3">
                        <div class="col-lg-2">
                        </div>
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-header py-3">
                                            <p class="text-primary m-0 fw-bold">Employee</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                  <asp:Label ID="lblSuccess" class="alert alert-success" role="alert" runat="server"></asp:Label>
                                                  <asp:Label ID="lblFailed" class="alert alert-danger" role="alert" runat="server"></asp:Label>
                                            </div>
                                            <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="first_name"><strong>Full Name</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtEmpName" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Employee Name..."></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmpName" Display="Dynamic" SetFocusOnError="True">*Name is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="username"><strong>Salary</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtEmpSalary" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Employee Salary..."></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmpSalary" Display="Dynamic" SetFocusOnError="True">*Salary is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="username"><strong>Email</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtEmpEmail" runat="server" style="color: rgb(0,0,0);" TextMode="Email" placeholder="Enter Employee Email..."></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmpEmail" Display="Dynamic" SetFocusOnError="True">*Email is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label"><strong>Phone</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtEmpPhone" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Employee Phone...">+60</asp:TextBox>
                                                            <small class="text-danger">
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtEmpPhone" Display="Dynamic" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$">*Invalid Phone number</asp:RegularExpressionValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmpPhone" Display="Dynamic" SetFocusOnError="True">*Phone is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="first_name"><strong>Address</strong></label>
                                                            <asp:TextBox  class="form-control form-control-user"  ID="txtEmpAddress" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Employee Address..."></asp:TextBox>
                                                            <small class="text-danger">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmpAddress" Display="Dynamic" SetFocusOnError="True">*Address is required</asp:RequiredFieldValidator>
                                                                 </small>
                                                        </div>
                                                    </div>
                                                </div>
                                            <div class="row">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="address"><strong>Departments</strong></label>
                                                        <asp:DropDownList ID="drpLocation1" class="browser-default custom-select" runat="server" DataSourceID="sqlLocation1" DataTextField="dept_name" DataValueField="dept_id"></asp:DropDownList>
                                                            <small class="text-danger">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" runat="server" ControlToValidate="drpLocation1" ErrorMessage="RequiredFieldValidator">*Select Departments</asp:RequiredFieldValidator>
                                                            </small>
                                                        <asp:SqlDataSource ID="sqlLocation1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT * FROM [departments]"></asp:SqlDataSource>
                                                    </div>
                                                    </div>
                                                 <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="address"><strong>Jobs</strong></label>
                                                        <asp:DropDownList ID="DropDownList1" class="browser-default custom-select" runat="server" DataSourceID="SqlDataSource1" DataTextField="job_name" DataValueField="job_id"></asp:DropDownList>
                                                            <small class="text-danger">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" runat="server" ControlToValidate="DropDownList1" ErrorMessage="RequiredFieldValidator">*Select Jobs</asp:RequiredFieldValidator>
                                                            </small>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT * FROM [job]"></asp:SqlDataSource>
                                                    </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <asp:TextBox ID="txtBranchid" runat="server" Visible="False"></asp:TextBox>
                                                    <asp:Button ID="btnInsert" class="btn btn-primary d-block btn-user w-100" runat="server" Text="Add New Employee" OnClick="btnInsert_Click"/>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>
