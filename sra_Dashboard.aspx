<%@ Page Title="Dashboard GPE" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="sra_Dashboard.aspx.vb" Inherits="PortalCase.sra_Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
  <!--Morris Chart CSS -->
  <link rel="stylesheet" href="Scripts/morris-chart/morris.css">

    <script>
        donutData = [
            { value: '<%= Session("donutDataDemit")%>', label: 'Demitido', formatted: '<%= Session("donutDataDemit")%>'+'%' },
            { value: '<%= Session("donutDataAtivo")%>', label: 'Ativos', formatted: '<%= Session("donutDataAtivo")%>' + '%' },
            { value: '<%= Session("donutDataAfast")%>', label: 'Afastados', formatted: '<%= Session("donutDataAfast")%>' + '%' },
            { value: '<%= Session("donutDataFeria")%>', label: 'Férias', formatted: '<%= Session("donutDataFeria")%>' + '%' }
        ];

        var day_data = [
            { "elapsed": '<%= Session("DsLineData1D")%>', "value": '<%= Session("DsLineData1")%>' },
            { "elapsed": '<%= Session("DsLineData2D")%>', "value": '<%= Session("DsLineData2")%>' },
            { "elapsed": '<%= Session("DsLineData3D")%>', "value": '<%= Session("DsLineData3")%>' },
            { "elapsed": '<%= Session("DsLineData4D")%>', "value": '<%= Session("DsLineData4")%>' },
            { "elapsed": '<%= Session("DsLineData5D")%>', "value": '<%= Session("DsLineData5")%>' },
            { "elapsed": '<%= Session("DsLineData6D")%>', "value": '<%= Session("DsLineData6")%>' },
            { "elapsed": '<%= Session("DsLineData7D")%>', "value": '<%= Session("DsLineData7")%>' },
            { "elapsed": '<%= Session("DsLineData8D")%>', "value": '<%= Session("DsLineData8")%>' },
            { "elapsed": '<%= Session("DsLineData9D")%>', "value": '<%= Session("DsLineData9")%>' },
            { "elapsed": '<%= Session("DsLineData10D")%>', "value": '<%= Session("DsLineData10")%>' },
            { "elapsed": '<%= Session("DsLineData11D")%>', "value": '<%= Session("DsLineData11")%>' },
            { "elapsed": '<%= Session("DsLineData12D")%>', "value": '<%= Session("DsLineData12")%>' },
            { "elapsed": '<%= Session("DsLineData13D")%>', "value": '<%= Session("DsLineData13")%>' },
            { "elapsed": '<%= Session("DsLineData14D")%>', "value": '<%= Session("DsLineData14")%>' },
            { "elapsed": '<%= Session("DsLineData15D")%>', "value": '<%= Session("DsLineData15")%>' }
        ];

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<form class="wrapper" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <section class="panel">
               <header class="panel-heading" runat="server">
                   Situação dos Funcionários 
                   <span class="tools pull-right">
                       <a href="javascript:;" class="fa fa-chevron-down"></a>
                       <a href="javascript:;" class="fa fa-times"></a>
                    </span>
                   <asp:LinkButton ID="BtnDsDonut" runat="server" CssClass="btn btn-default tooltips" data-toggle="tooltip" data-placement="right" 
                    title="" data-original-title="Carregar"><i class="fa fa-refresh" runat="server"></i></asp:LinkButton>
               </header>
                <div class="panel-body">
                <div class="row" runat="server" visible="false" id="divDsDonut">
                <div class="col-md-6">
                    <!--statistics start-->
                    <div class="row state-overview">
                        <div class="col-md-6 col-xs-12 col-sm-6">
                            <div class="panel purple">
                                <div class="symbol">
                                    <i class="fa fa-gears"></i>
                                </div>
                                <div class="state-value">
                                    <div class="value" runat="server"><asp:label runat="server" id="lblAtivos"></asp:label></div>
                                    <div class="title">Ativos</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 col-sm-6">
                            <div class="panel red">
                                <div class="symbol">
                                    <i class="fa fa-home"></i>
                                </div>
                                <div class="state-value">
                                    <div class="value" runat="server"><asp:label runat="server" id="lblFerias"></asp:label></div>
                                    <div class="title">Férias</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row state-overview">
                        <div class="col-md-6 col-xs-12 col-sm-6">
                            <div class="panel blue">
                                <div class="symbol">
                                    <i class="fa fa-medkit"></i>
                                </div>
                                <div class="state-value">
                                    <div class="value" runat="server"><asp:label runat="server" id="lblAfastados"></asp:label></div>
                                    <div class="title"> Afastados</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 col-sm-6">
                            <div class="panel green">
                                <div class="symbol">
                                    <i class="fa fa-fire"></i>
                                </div>
                                <div class="state-value">
                                    <div class="value" runat="server"><asp:label runat="server" id="lblDemitidos"></asp:label></div>
                                    <div class="title"> Demitidos</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--statistics end-->
                </div>
                <div class="col-md-6">
                    <!--more statistics box start-->
                    <div class="panel deep-purple-box">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-7 col-sm-7 col-xs-7">
                                    <div id="graph-donut" class="revenue-graph"></div>

                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <ul class="bar-legend">
                                        <li><span class="blue"></span> Afastados</li>
                                        <li><span class="green"></span> Demitidos</li>
                                        <li><span class="purple"></span> Ativos</li>
                                        <li><span class="red"></span> Férias</li>
                                    </ul>
                                    <label><strong>Total:</strong> </label><asp:Label runat="server" id="lblTotal"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--more statistics box end-->
                </div>
            </div>
                </div>
            </section>
        </div>
    </div>
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Line Chart
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                            <asp:LinkButton ID="BtnDsLine" runat="server" CssClass="btn btn-default tooltips" data-toggle="tooltip" data-placement="right" 
                    title="" data-original-title="Carregar"><i class="fa fa-refresh" runat="server"></i></asp:LinkButton>
                        </header>
                        <div class="panel-body" runat="server" visible="false" id="divDsLine">>
                            <div id="graph-line"></div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            Bar Chart
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="graph-bar"></div>
                        </div>
                    </section>
                </div>
            </div>

</form>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="Scripts/jquery-1.10.2.min.js"></script>
<script src="Scripts/jquery-ui-1.9.2.custom.min.js"></script>
<script src="Scripts/jquery-migrate-1.2.1.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
<script src="Scripts/modernizr.min.js"></script>
<script src="Scripts/jquery.nicescroll.js"></script>

<!--easy pie chart-->
<script src="Scripts/easypiechart/jquery.easypiechart.js"></script>
<script src="Scripts/easypiechart/easypiechart-init.js"></script>

<!--Sparkline Chart-->
<script src="Scripts/sparkline/jquery.sparkline.js"></script>
<script src="Scripts/sparkline/sparkline-init.js"></script>

<!--icheck -->
<script src="Scripts/iCheck/jquery.icheck.js"></script>
<script src="Scripts/icheck-init.js"></script>

<!-- jQuery Flot Chart-->
<script src="Scripts/flot-chart/jquery.flot.js"></script>
<script src="Scripts/flot-chart/jquery.flot.tooltip.js"></script>
<script src="Scripts/flot-chart/jquery.flot.resize.js"></script>

<!--Morris Chart-->
<script src="Scripts/morris-chart/morris.js"></script>
<script src="Scripts/morris-chart/raphael-min.js"></script>
<script src="Scripts/morris-chart/morris.init.js"></script>

<!--Calendar-->
<script src="Scripts/calendar/clndr.js"></script>
<script src="Scripts/calendar/evnt.calendar.init.js"></script>
<script src="Scripts/calendar/moment-2.2.1.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>

<!--Dashboard Charts-->
<script src="Scripts/dashboard-chart-init.js"></script>
</asp:Content>
