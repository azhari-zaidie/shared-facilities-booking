<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no "/>
    <title><%: Page.Title %> - Login</title>

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
    <form id="form1" runat="server">
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
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row" style="background: url(&quot;imagesd/logo.jpg&quot;) center / cover no-repeat;">
                            <div class="col-lg-6 d-none d-lg-flex">
                                <div class="flex-grow-1 bg-login-image" style="background: url(&quot;images/logo.jpg&quot;) center / contain no-repeat;"></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h4 class="text-dark mb-4">CheqAyu Welcome Back!</h4>
                                    </div>
                                        <div class="col-lg-6"> 
                                            <small class="text-danger">
                                                <asp:Label ID="lblLogin" runat="server" ForeColor="Red"></asp:Label>
                                             </small>
                                            </div>
                                        <div class="mb-3"><asp:TextBox  class="form-control form-control-user"  ID="txtUsername" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Username..."></asp:TextBox>
                                            <div class="col-sm-6"> 
                                            <small class="text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUsername" Display="Dynamic" SetFocusOnError="True">*Username is required</asp:RequiredFieldValidator>
                                             </small>
                                            </div>
                                        </div>
                                        <div class="mb-3"><asp:TextBox  class="form-control form-control-user"  ID="txtPsw1" runat="server" style="color: rgb(0,0,0);" placeholder="Enter Password..." TextMode="Password"></asp:TextBox>
                                            <div class="col-sm-6"> 
                                            <small class="text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPsw1" Display="Dynamic" SetFocusOnError="True">*Password is required</asp:RequiredFieldValidator>
                                             </small>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                        </div><asp:Button ID="btnLogin" class="btn btn-primary d-block btn-user w-100" runat="server" Text="Login" OnClick="btnLogin_Click" />
                                        <hr>
                                        <hr>
                                    <div class="text-center"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
    <script>
        function PrintPage() {
            document.getElementById('<%=btnLogin.ClientID %>').style.visibility = "";
            window.print();
        }
    </script>
</html>
