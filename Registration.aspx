<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registration.aspx.vb" Inherits="PortalCase.registration" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Itiki">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>Registro</title>

    <link href="css/style.css" rel="stylesheet"/>
    <link href="css/style-responsive.css" rel="stylesheet"/>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="Scripts/html5shiv.js"></script>
    <script src="Scripts/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-body">

    <form class="form-signin" runat="server">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">Registro</h1>
            <img src="images/login-logo.png" alt=""/>
        </div>
        <div class="login-wrap">
            <p>Informações Pessoais</p>
            <input type="text" runat="server" id="inptNome" autofocus="" placeholder="Nome Completo" class="form-control"/>
            <input type="text" runat="server" id="inptEmail" autofocus="" placeholder="E-mail" class="form-control"/>
            <!--<input type="text" autofocus="" placeholder="City/Town" class="form-control"/>-->
            <div class="form-group adminex-form">
                <div class="col-sm-15">
                    <asp:DropDownList runat="server" CssClass="form-control input-sm m-bot15" ID="drpListTpAcesso" />
                </div>
            </div>
            <p></p>
            <!--<input type="text" autofocus="" placeholder="User Name" class="form-control"/>-->
            <input type="password" runat="server" id="inptSenha" placeholder="Digite sua Senha" class="form-control"/>
            <input type="password" runat="server" id="inptSenhaVl" placeholder="Confirmação de Senha" class="form-control"/>
            
            <!--<label class="checkbox">
                <input type="checkbox" value="agree this condition"/>Concordo com os Termos de Serviço e Política de Privacidade
            </label>-->
            <asp:LinkButton runat="server" ID="BtnRegistrar" OnClick="BtnRegistrar_Click" CssClass="btn btn-lg btn-login btn-block">
                    <i class="fa fa-check"></i>
            </asp:LinkButton>
            <div class="alert alert-block alert-danger fade in" runat="server" visible="false" id="lblUserError">
                <asp:Label runat="server" type="button" class="close close-sm" data-dismiss="alert">
                    <i class="fa fa-times"></i>
                </asp:Label>   
                <strong>Ops!</strong> <asp:Label runat="server" id="lblRet" ></asp:Label>                                                                   
            </div>
            <div class="registration">                
                <a href="Login" class="">
                    Login
                </a>
            </div>

        </div>

    </form>




<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="Scripts/jquery-1.10.2.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
<script src="Scripts/modernizr.min.js"></script>
</body>
</html>
