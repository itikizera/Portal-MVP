Imports System.Data
Imports PortalCase.WSPORTALMVP

Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Try
            lblNome.Text = Session("Nome")

        Catch ex As Exception

        End Try
    End Sub
End Class