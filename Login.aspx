<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="PortalCase.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Itiki">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>Login</title>

    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="Scripts/html5shiv.js"></script>
    <script src="Scripts/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body">

<div class="container">

    <form class="form-signin" action="Login" runat="server">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title"></h1>
            <img src="images/login-logo.png" alt=""/>
        </div>
        <div class="login-wrap">
            <asp:TextBox runat="server" id="edtUsuario" class="form-control" placeholder="Usuário"/>
            <asp:TextBox type="password" runat="server" id="edtSenha" class="form-control" placeholder="Senha" />
            <asp:LinkButton runat="server" Id="BtnLogar" CssClass="btn btn-lg btn-login btn-block" type="submit">
                <i class="fa fa-check"></i>
            </asp:LinkButton>

            <div class="registration" runat="server" >
                
                <a class="" href="registration">
                   <asp:Label runat="server" id="lblRegistro"> Registrar-se</asp:Label>
                </a>
            </div>
            <div class="alert alert-block alert-danger fade in" runat="server" visible="false" id="lblServerError">
                <asp:Label runat="server" type="button" class="close close-sm" data-dismiss="alert">
                    <i class="fa fa-times"></i>
                </asp:Label>   
                <strong>Ops!</strong> Servidor não Respondendo                                                                    
            </div>
            <div class="alert alert-block alert-danger fade in" runat="server" visible="false" id="lblUserError">
                <asp:Label runat="server" type="button" class="close close-sm" data-dismiss="alert">
                    <i class="fa fa-times"></i>
                </asp:Label>   
                <strong>Ops!</strong> Usuário não Encontrado                                                                     
            </div>
            <label class="checkbox">
                <!--<input type="checkbox" value="remember-me"> Remember me-->
                <span class="pull-right">
                    <a data-toggle="modal" href="#myModal"> Esqueceu a Senha?</a>

                </span>
            </label>

        </div>

        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Esqueceu sua Senha?</h4>
                    </div>
                    <div class="modal-body">
                        <p>E-mail utlizado para cadastro</p>
                        <input type="text" name="email" placeholder="E-mail" autocomplete="off" class="form-control placeholder-no-fix">

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Cancelar</button>
                        <button class="btn btn-primary" type="button">Enviar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->

    </form>

</div>



<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="Scripts/jquery-1.10.2.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
<script src="Scripts/modernizr.min.js"></script>

</body>
</html>



