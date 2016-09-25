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
Public Class sra_Gestao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Thread.CurrentThread.CurrentCulture = New CultureInfo("pt-BR")
        Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture
        Me.Page.Title = "GPE: Gestão"
        'If Not Session("Logado") Then
        'Response.Redirect("Login.aspx")
        'End If

        Dim ObjDS As New DataSet
        Dim oWSGridView = New WSPORTALMVP.PORTALMVPSOAPClient
        Dim oParam = New WSPORTALMVP.STRGETSRA
        Dim oRetorno = New WSPORTALMVP.STRRETXML
        Dim msgErro As String = "ShowError();"
        Session("NomePagina") = "Busca SRA"
        'lblx9.Visible = False
        Try
            If Not IsPostBack Then
                dlistIndice.Items.Add(New ListItem("Filial+Matricula", "1"))
                dlistIndice.Items.Add(New ListItem("Filial+Nome", "2"))
                'dlistIndice.Items.Add(New ListItem("Filial+Mat+Nome", "3"))

                dlistPageSize.Items.Add(New ListItem("10", "10"))
                dlistPageSize.Items.Add(New ListItem("25", "25"))
                dlistPageSize.Items.Add(New ListItem("50", "50"))

                'Preenchimento dos parametros
                oParam.INDICE = dlistIndice.SelectedValue
                oParam.FILIAL = Mid(txtBusca.Text.ToString, 1, 2)
                oParam.BUSCA = Mid(txtBusca.Text.ToString, 3, 12)

                'execução do metodo passando os parametros coletados
                oRetorno = oWSGridView.GETSRA(oParam)

                ObjDS.ReadXml(New StringReader(oRetorno.XML), XmlReadMode.Auto)

                If Trim(ObjDS.Tables(0).Rows(0)("SRA_MAT")) = "Sem Dados" Then
                    'lblx9.Text = "Não foram encontrados NF em aberto."
                    'lblx9.Visible = True
                    'GVItens.Visible = False
                Else
                    Session.Add("dsSRA", ObjDS)
                    DetalhesField.Visible = False
                    GVItens.DataSource = ObjDS.Tables(0).DefaultView 'atribui ao gridview a fonte de dados
                    GVItens.DataBind() 'gera as linhas no gridview
                End If
            End If
        Catch ex As Exception
            divX9.Visible = True

            If (Not ClientScript.IsStartupScriptRegistered("ErrorMessage")) Then
                ClientScript.RegisterStartupScript(Me.GetType(), "ErrorMessage", msgErro, True)
            End If
        Finally
        End Try

    End Sub
    Protected Sub btnSeek_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSeek.Click

        Dim ObjDS As New DataSet
        Dim oWSGridView = New WSPORTALMVP.PORTALMVPSOAPClient
        Dim oParam = New WSPORTALMVP.STRGETSRA
        Dim oRetorno = New WSPORTALMVP.STRRETXML
        Dim msgErro As String = "ShowError();"
        DetalhesField.Visible = False
        'Session.Clear()
        Try
            'Preenchimento dos parametros
            oParam.INDICE = dlistIndice.SelectedValue
            oParam.FILIAL = Mid(txtBusca.Text.ToString, 1, 2)
            oParam.BUSCA = Mid(txtBusca.Text.ToString, 3, 12)

            'execução do metodo passando os parametros coletados
            oRetorno = oWSGridView.GETSRA(oParam)

            ObjDS.ReadXml(New StringReader(oRetorno.XML), XmlReadMode.Auto)

            If Trim(ObjDS.Tables(0).Rows(0)("SRA_MAT")) = "Sem Dados" Then
                'Session.Add("dsSRA", ObjDS)
                divX9.Visible = True
                GVItens.Visible = False
            Else
                GVItens.Visible = True
                divGridView.Visible = True
                Session.Add("dsSRA", ObjDS) 'gera sessão cache
                divX9.Visible = False
                GVItens.PageSize = dlistPageSize.SelectedValue
                GVItens.DataSource = ObjDS.Tables(0).DefaultView 'atribui ao gridview a fonte de dados
                GVItens.DataBind() 'gera as linhas no gridview
            End If
        Catch ex As Exception
            'lblx9.Text = "Deu bosta véio"
            divX9.Visible = True
            If (Not ClientScript.IsStartupScriptRegistered("ErrorMessage")) Then
                ClientScript.RegisterStartupScript(Me.GetType(), "ErrorMessage", msgErro, True)
            End If
        End Try

    End Sub

    Protected Sub GVItens_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVItens.PageIndexChanging
        'Realiza a paginação dos dados na grid
        Dim objDataSetPage As New DataSet
        Dim msgErro As String = "ShowError();"

        Try
            objDataSetPage = Session("dsSRA")

            GVItens.PageIndex = e.NewPageIndex
            GVItens.DataSource = objDataSetPage.Tables(0)
            GVItens.DataBind()
            DetalhesField.Visible = False
        Catch ex As Exception
            'lblx9.Text = ex.Message
            divX9.Visible = True
            If (Not ClientScript.IsStartupScriptRegistered("ErrorMessage1")) Then
                ClientScript.RegisterStartupScript(Me.GetType(), "ErrorMessage1", msgErro, True)
            End If
        End Try

    End Sub

    Protected Sub GVItensHover(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles GVItens.RowDataBound
        If (e.Row.RowIndex > -1) Then
            e.Row.Attributes.Add("onMouseOver", "this.className = 'hover';")
            e.Row.Attributes.Add("onMouseOut", "this.className = 'normal';")
            'e.Row.Font.Bold = True
        End If

    End Sub

    Public Sub btnNovoFunc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovoFunc.Click
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub GVItens_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If (e.CommandName = "btnVisualizar") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            If index >= 0 Then
                DetalhesField.Visible = True
                Dim row As GridViewRow = GVItens.Rows(index)

                RA_FILIAL.Value = row.Cells(1).Text
                RA_MAT.Value = row.Cells(2).Text
                RA_NOME.Value = row.Cells(3).Text
                RA_CIC.Value = row.Cells(4).Text
                RA_ADMISSA.Value = row.Cells(5).Text
                RA_NASC.Value = row.Cells(6).Text
                RA_CC.Value = row.Cells(7).Text

            End If

        End If
    End Sub

End Class