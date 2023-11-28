<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.register" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no "/>
    <title><%: Page.Title %> - My ASP.NET Application</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <link href="Content/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <script src="Content/assets/bootstrap/js/bootstrap.min.js"></script>
    <link href="Content/assets/fonts/fontawesome-all.min.css" rel="stylesheet" />
    <link href="Content/assets/fonts/fontawesome5-overrides.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" />
</head>

<body class="bg-gradient-primary" style="background: var(--bs-dark);">
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="container">
        <div class="card shadow-lg o-hidden border-0 my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-7 col-xxl-12" >
                        <div class="p-5" style="background: url(&quot;assets/img/images.jpg&quot;) center / cover no-repeat;">
                            <div class="text-center">
                                <h4 class="text-dark mb-4">Create an Account!</h4>
                            </div>
                            
                            <div class="user" id="myForm">
                                <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><asp:TextBox  class="form-control form-control-user"  ID="txtUsername" runat="server" style="color: rgb(0,0,0);" placeholder="Username"></asp:TextBox>
                                        <div class="col-sm-6"> 
                                            <small class="text-danger">
                                                <asp:Label ID="lblUsername" runat="server" Text="text" ForeColor="Red"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUsername" Display="Dynamic" SetFocusOnError="True">*Username is required</asp:RequiredFieldValidator>
                                             </small>
                                        </div>
                                    </div>
                                    <div class="col-sm-6"><asp:TextBox  class="form-control form-control-user"  ID="txtFullname" runat="server" style="color: rgb(0,0,0);" placeholder="Fullname"></asp:TextBox>
                                        <div class="col-sm-6"> 
                                            <small class="text-danger">
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFullname" Display="Dynamic" SetFocusOnError="True">*Fullname is required</asp:RequiredFieldValidator>
                                             </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3"><asp:TextBox  class="form-control form-control-user"  ID="txtEmail" runat="server" style="color: rgb(0,0,0);" placeholder="Email"></asp:TextBox>
                                    <div class="col-sm-6"> 
                                            <small class="text-danger">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*Invalid email format</asp:RegularExpressionValidator> 
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="True">*Email is required</asp:RequiredFieldValidator>
                                             </small>
                                      </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><asp:TextBox  class="form-control form-control-user"  ID="txtPsw1" runat="server" style="color: rgb(0,0,0);" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        <div class="col-sm-6"> 
                                            <small class="text-danger">
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPsw1" Display="Dynamic" SetFocusOnError="True">*Password is required</asp:RequiredFieldValidator>
                                             </small>
                                        </div>
                                    </div>
                                    <div class="col-sm-6"><asp:TextBox  class="form-control form-control-user"  ID="txtPsw2" runat="server" style="color: rgb(0,0,0);" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                        <div class="col-sm-6"> 
                                            <small class="text-danger">
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPsw2" Display="Dynamic" SetFocusOnError="True">*Confirm Password is required</asp:RequiredFieldValidator>
                                             </small>
                                        </div>
                                    </div>
                                    <div class="col-lg-6"> 
                                            <small class="text-danger">
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txtPsw1" ControlToValidate="txtPsw2" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">*Password and Confirm Password need to be same</asp:CompareValidator>
                                             </small>
                                      </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-xxl-6"><asp:Button  class="btn btn-primary d-block btn-user w-100" ID="registerBtn" runat="server" Text="Register Account" OnClick="registerBtn_Click" /></div>
                                    <div class="col-xxl-6"><asp:Button class="btn btn-light d-block btn-user w-100" ID="btnReset" runat="server" Text="Reset" OnClientClick="this.form.reset();return false;" /></div>
                                </div>
                                <hr>
                                
                            </div>
                            <div class="text-center">
                                <asp:HyperLink class="small" ID="hypLink1" runat="server" NavigateUrl="login.aspx">Already have an account? Login!</asp:HyperLink><br />
                                    <small class="text-danger">
                                        <asp:Label ID="lblLogin" runat="server" ForeColor="Red">Registration Succesful</asp:Label>
                                 </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
<script src="Content/assets/js/theme.js"></script>
</html>
