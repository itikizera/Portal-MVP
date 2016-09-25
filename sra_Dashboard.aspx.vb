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
Imports Newtonsoft.Json.Linq

Public Class sra_Dashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Thread.CurrentThread.CurrentCulture = New CultureInfo("pt-BR")
        Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture
        Me.Page.Title = "GPE: Dashboard"
        'If Not Session("Logado") Then
        'Response.Redirect("Login.aspx")
        'End If

        

    End Sub
    Protected Sub BtnDsDonut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnDsDonut.Click
        divDsDonut.Visible = True
        Dim ObjDSDonut As New DataSet
        Dim oWSGridView = New WSPORTALMVP.PORTALMVPSOAPClient
        Dim oParamDonut = New WSPORTALMVP.STRGETDBSRA
        Dim oRetornoDonut = New WSPORTALMVP.STRRETXML
        Dim msgErro As String = "ShowError();"
        Session("NomePagina") = "Dashboard SRA"
        'lblx9.Visible = False
        Dim nTotalDonut As Double
        'Dim cDescDonut As String
        Try
            'execução do metodo passando os parametros coletados
            oRetornoDonut = oWSGridView.GETDBSRA(oParamDonut)

            ObjDSDonut.ReadXml(New StringReader(oRetornoDonut.XML), XmlReadMode.Auto)

            If Trim(ObjDSDonut.Tables(0).Rows(0)("SRA_SITFOLH")) = "Sem Dados" Then
                'lblx9.Text = "Não foram encontrados NF em aberto."
                'lblx9.Visible = True
                'GVItens.Visible = False
            Else
                Session.Add("dsSRA", ObjDSDonut)
                For i = 0 To ObjDSDonut.Tables(0).Rows.Count Step 1
                    If Trim(ObjDSDonut.Tables(0).Rows(i)("SRA_SITFOLH")) = "A" Then
                        lblAfastados.Text = Trim(ObjDSDonut.Tables(0).Rows(i)("SRA_QNT"))
                    ElseIf Trim(ObjDSDonut.Tables(0).Rows(i)("SRA_SITFOLH")) = "F" Then
                        lblFerias.Text = Trim(ObjDSDonut.Tables(0).Rows(i)("SRA_QNT"))
                    ElseIf Trim(ObjDSDonut.Tables(0).Rows(i)("SRA_SITFOLH")) = "D" Then
                        lblDemitidos.Text = Trim(ObjDSDonut.Tables(0).Rows(i)("SRA_QNT"))
                    ElseIf Trim(ObjDSDonut.Tables(0).Rows(i)("SRA_SITFOLH")) = "" Then
                        lblAtivos.Text = Trim(ObjDSDonut.Tables(0).Rows(i)("SRA_QNT"))
                    End If
                    nTotalDonut += Convert.ToInt32(ObjDSDonut.Tables(0).Rows(i)("SRA_QNT"))
                Next i

            End If
        Catch ex As Exception
            'divX9.Visible = True

            If (Not ClientScript.IsStartupScriptRegistered("ErrorMessage")) Then
                ClientScript.RegisterStartupScript(Me.GetType(), "ErrorMessage", msgErro, True)
            End If
        Finally
        End Try
        If nTotalDonut > 0 Then
            Session("donutData") = "Busca SRA"
            Session("donutDataAfast") = FormatNumber(((Convert.ToDouble(lblAfastados.Text) * 100) / nTotalDonut), 2)
            Session("donutDataFeria") = FormatNumber(((Convert.ToDouble(lblFerias.Text) * 100) / nTotalDonut), 2)
            Session("donutDataDemit") = FormatNumber(((Convert.ToDouble(lblDemitidos.Text) * 100) / nTotalDonut), 2)
            Session("donutDataAtivo") = FormatNumber(((Convert.ToDouble(lblAtivos.Text) * 100) / nTotalDonut), 2)
            lblTotal.Text = Trim(nTotalDonut)
        End If
    End Sub
    Protected Sub BtnDsLine_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnDsLine.Click
        divDsLine.Visible = True
        Dim ObjDSLine As New DataSet
        Dim oWSGridView = New WSPORTALMVP.PORTALMVPSOAPClient
        Dim oParamLine = New WSPORTALMVP.STRGETDBCC
        Dim oRetornoLine = New WSPORTALMVP.STRRETXML
        Dim msgErro As String = "ShowError();"
        Session("NomePagina") = "Dashboard SRA"
        Try
            'execução do metodo passando os parametros coletados
            oRetornoLine = oWSGridView.GETDBCC(oParamLine)

            ObjDSLine.ReadXml(New StringReader(oRetornoLine.XML), XmlReadMode.Auto)

            If Trim(ObjDSLine.Tables(0).Rows(0)("SRA_CC")) = "Sem Dados" Then
                'lblx9.Text = "Não foram encontrados NF em aberto."
                'lblx9.Visible = True
                'GVItens.Visible = False
            Else
                Session.Add("dsSRA", ObjDSLine)
                For i = 0 To ObjDSLine.Tables(0).Rows.Count Step 1
                    If Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "51000" Then
                        Session("DsLineData1D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData1") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60000" Then
                        Session("DsLineData2D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData2") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60005" Then
                        Session("DsLineData3D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData3") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60010" Then
                        Session("DsLineData4D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData4") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60015" Then
                        Session("DsLineData5D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData5") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60030" Then
                        Session("DsLineData6D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData6") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60035" Then
                        Session("DsLineData7D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData7") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60105" Then
                        Session("DsLineData8D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData8") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60110" Then
                        Session("DsLineData9D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData9") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60200" Then
                        Session("DsLineData10D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData10") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60205" Then
                        Session("DsLineData11D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData11") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60225" Then
                        Session("DsLineData12D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData12") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "60235" Then
                        Session("DsLineData13D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData13") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "61020" Then
                        Session("DsLineData14D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData14") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    ElseIf Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC")) = "61025" Then
                        Session("DsLineData15D") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CC"))
                        Session("DsLineData15") = Trim(ObjDSLine.Tables(0).Rows(i)("SRA_CCQNT"))
                    End If
                Next i
            End If
        Catch ex As Exception
            'divX9.Visible = True

            If (Not ClientScript.IsStartupScriptRegistered("ErrorMessage")) Then
                ClientScript.RegisterStartupScript(Me.GetType(), "ErrorMessage", msgErro, True)
            End If
        Finally
        End Try
    End Sub
End Class