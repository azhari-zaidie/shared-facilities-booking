﻿<%@ Page Title="Employee" Language="C#" MasterPageFile="~/emp.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplication1.User._default" %>
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
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="login.php"><span class="d-none d-lg-inline me-2 text-gray-600 small"><?php echo $row1['user_fullname']; ?></span><img class="border rounded-circle img-profile" src="img/<?=$row1['user_picture']?>"></a>
                                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in">
                                        <div class="dropdown-divider"></div><asp:HyperLink class="dropdown-item" ID="hypLink1" runat="server" NavigateUrl="~/login.aspx"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</asp:HyperLink>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Dashboard</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-start-primary py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col me-2">
                                            <div class="text-uppercase text-primary fw-bold text-xs mb-1"><span>Notice Board</span></div>
                                            <div class="text-dark fw-bold h5 mb-0"><span>
                                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span></div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-list-ul fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-start-success py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col me-2">
                                            <div class="text-uppercase text-success fw-bold text-xs mb-1"><span>Total Branches</span></div>
                                            <div class="text-dark fw-bold h5 mb-0"><span>2</span></div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-redo fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-start-info py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col me-2">
                                            <div class="text-uppercase text-info fw-bold text-xs mb-1"><span>Total Employees</span></div>
                                            <div class="row g-0 align-items-center">
                                                <div class="col-auto">
                                                    <div class="text-dark fw-bold h5 mb-0 me-3"><span>3</span></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-check fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-start-warning py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col me-2">
                                            <div class="text-uppercase text-warning fw-bold text-xs mb-1"><span>Total Manager</span></div>
                                            <div class="text-dark fw-bold h5 mb-0"><span><?php echo $row2[2]; ?></span></div>
                                        </div>
                                        <div class="col-auto"><i class="far fa-times-circle fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <div action="../pdf/index.php" method="post">
                                    <input type="hidden" name="booking_id" value="<?php echo $row['booking_id']; ?>">
                                    <h6 class="text-primary fw-bold m-0">Noticeboard <button class="btn btn-success btn-sm float-right"
                                    type="submit" id="myBtn" name="report">Report</button></h6></div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <div class="mb-3">
                                        <label class="form-label"><strong>Branch Name</strong></label><input class="form-control" value=""name="facilitate_id" readonly></div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="mb-3">
                                                <label class="form-label"><strong>ID</strong></label><input class="form-control" value=""name="facilitate_id" readonly></div>
                                            </div>
                                            <div class="col">
                                                <div class="mb-3">
                                                <label class="form-label"><strong>Manager Name</strong></label><input class="form-control" value=""name="facilitate_id" readonly></div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
</asp:Content>
