Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Logado") = False
    End Sub

    Protected Sub btnLogar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogar.Click
        Dim oWSUserSiga = New WSPORTALMVP.PORTALMVPSOAPClient
        Dim oParam = New WSPORTALMVP.STRAUTUSER
        Dim oRetorno = New WSPORTALMVP.DADOSUSUARIO
        Dim msgErro As String = "ShowError();"

        Try

            oParam.USERLOGIN = edtUsuario.Text
            oParam.USERSENHA = edtSenha.Text
            oParam.USERTIPO = "LOGIN"

            oRetorno = oWSUserSiga.AUTHUSERSIGA(oParam)

            If Not oRetorno Is Nothing Then
                If oRetorno.LRET Then
                    System.Threading.Thread.Sleep(2000)
                    Session.Add("Nome", oRetorno.NOMECOMPLETO)
                    Session.Add("Sessao", oRetorno.CODIGO + oRetorno.LOJA)
                    'Session.Add("CPF", IIf(oRetorno.CPF.Trim.Length > 11, Convert.ToUInt64(oRetorno.CPF).ToString("00\.000\.000\/0000\-00"), Convert.ToUInt64(oRetorno.CNPJ).ToString("000\.000\.000\-00")))
                    Session.Add("TipoLog", oRetorno.TIPOUSER)
                    Session("Logado") = True
                    Response.Redirect("Dashboard.aspx")

                Else
                    lblUserError.Visible = True
                End If
            End If
        Catch ex As Exception
            'lblRegistro.Visible = False
            lblServerError.Visible = True
            If (Not ClientScript.IsStartupScriptRegistered("ErrorMessage")) Then
                ClientScript.RegisterStartupScript(Me.GetType(), "ErrorMessage", msgErro, True)
            End If
        End Try
    End Sub

End Class