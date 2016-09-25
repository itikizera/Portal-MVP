Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.Security.Cryptography
Imports System.Threading
Imports System.Globalization
Imports System.Web.Services.WebService
Imports System.IO
Imports System.Web
Imports System.Net
Imports System.Web.Services
Public Class registration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Thread.CurrentThread.CurrentCulture = New CultureInfo("pt-BR")
        Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture

        drpListTpAcesso.Items.Add(New ListItem("Tipo de Acesso", "1"))
        drpListTpAcesso.Items.Add(New ListItem("Funcionário", "2"))
        drpListTpAcesso.Items.Add(New ListItem("Cliente", "3"))
        drpListTpAcesso.Items.Add(New ListItem("Fornecedor", "4"))

    End Sub
    Protected Sub BtnRegistrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnRegistrar.Click

        Dim oWSUserSiga = New WSPORTALMVP.PORTALMVPSOAPClient
        Dim oParam = New WSPORTALMVP.STRAUTUSER
        Dim oRetorno = New WSPORTALMVP.DADOSUSUARIO
        Dim msgErro As String = "ShowError();"

        oParam.REGNOME = inptNome.Value
        oParam.REGEMAIL = inptEmail.Value
        oParam.REGPERFIL = drpListTpAcesso.SelectedValue
        oParam.REGSENHA = inptSenha.Value
        oParam.USERTIPO = "REGISTRO"

        oRetorno = oWSUserSiga.AUTHUSERSIGA(oParam)
        Try
            If Not oRetorno Is Nothing Then
                If oRetorno.LRET Then
                    'Response.Redirect("Login")
                    lblUserError.Visible = True
                    lblRet.Text = oRetorno.ERRO
                Else
                    lblUserError.Visible = True
                    lblRet.Text = oRetorno.ERRO
                End If
            End If
        Catch ex As Exception
            lblUserError.Visible = True
            lblRet.Text = "Servidor não Respondendo"
            If (Not ClientScript.IsStartupScriptRegistered("ErrorMessage")) Then
                ClientScript.RegisterStartupScript(Me.GetType(), "ErrorMessage", msgErro, True)
            End If
        End Try

    End Sub

End Class