<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="sra_Maps.aspx.vb" Inherits="PortalCase.sra_Maps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            WORLD MAP
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-9 form-group">
                                    <div id="world-vmap" class="vmaps"></div>
                                </div>
                                <div class="col-md-3 form-group">
                                    <h3>Detalhes</h3>
                                    <div class="well">
                                        <address>
                                            <strong>bla bla bla</strong><br>
                                            bla bla bla bla bla bla<br>
                                            bla bla bla bla bla bla <br>
                                            <strong>bla bla bla bla bla bla</strong><br>
                                            <a href="mailto:#">
                                                first.last@email.com
                                            </a>
                                        </address>
                                    </div>
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
                            EUROPE
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-9 form-group">
                                    <div id="europe-vmap" class="vmaps"></div>
                                </div>
                                <div class="col-md-3 form-group">
                                        <h3>Detalhes</h3>
                                        <div class="well">
                                            <address>
                                                <strong>Nome do Pais</strong><br>
                                                ABC Ave, Suite 14<br>
                                                BucketLand, Australia <br>
                                                <abbr title="Phone">P:</abbr> (123) 456-7890 </address>
                                            <address>
                                                <strong>Full Name</strong><br>
                                                <a href="mailto:#">
                                                    first.last@email.com
                                                </a>
                                                <br>
                                                <br>
                                                <strong>Web Address</strong><br>
                                                <a href="http://themebucket.net">
                                                    themebucket.net
                                                </a>
                                            </address>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <section class="panel">
                        <header class="panel-heading">
                            ASIA
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="asia-vmap" class="vmaps"></div>
                        </div>
                    </section>
                </div>
                <div class="col-sm-6">
                    <section class="panel">
                        <header class="panel-heading">
                            Australia
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="australia-vmap" class="vmaps"></div>
                        </div>
                    </section>
                </div>

            </div>
        </div>
        <!--body wrapper end-->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="Scripts/jquery-1.10.2.min.js"></script>
<script src="Scripts/jquery-ui-1.9.2.custom.min.js"></script>
<script src="Scripts/jquery-migrate-1.2.1.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
<script src="Scripts/modernizr.min.js"></script>
<script src="Scripts/jquery.nicescroll.js"></script>

<!--Vector Maps-->
<script src="Scripts/jvector-map/jqvmap/jquery.vmap.js"></script>
<script src="Scripts/jvector-map/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="Scripts/jvector-map/jqvmap/data/jquery.vmap.sampledata.js"></script>
<script src="Scripts/jvector-map/jqvmap/maps/continents/jquery.vmap.europe.js"></script>
<script src="Scripts/jvector-map/jqvmap/maps/continents/jquery.vmap.asia.js"></script>
<script src="Scripts/jvector-map/jqvmap/maps/continents/jquery.vmap.australia.js"></script>

<script>

    jQuery('#europe-vmap').vectorMap({
        map: 'europe_en',
        backgroundColor: null,
        color: '#ffffff',
        hoverOpacity: 0.7,
        selectedColor: '#666666',
        enableZoom: true,
        borderWidth: 1,
        showTooltip: true,
        values: sample_data,
        scaleColors: ['#d3d3d3', '#262626'],
        onRegionClick: function (event, code) {
            var name = (code);
            alert(name);
        },
        normalizeFunction: 'polynomial'
    });

</script>

<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('#world-vmap').vectorMap({
            map: 'world_en',
            backgroundColor: null,
            color: '#ffffff',
            borderWidth: 1,
            hoverOpacity: 0.7,
            selectedColor: '#666666',
            enableZoom: false,
            showTooltip: false,
            values: sample_data,
            scaleColors: ['#d3d3d3', '#262626'],
            onRegionClick: function (event, code) {
                var name = (code);
                alert(name);
            },
            normalizeFunction: 'polynomial'
        });
    });

</script>

<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('#asia-vmap').vectorMap({
            map: 'asia_en',
            backgroundColor: null,
            color: '#ffffff',
            borderWidth: 1,
            hoverOpacity: 0.7,
            selectedColor: '#666666',
            enableZoom: false,
            showTooltip: true,
            values: sample_data,
            scaleColors: ['#d3d3d3', '#262626'],
            normalizeFunction: 'polynomial'
        });
    });
</script>

<script type="text/javascript">
    var country_colors = {};
    var country_name = 'br';

    country_colors[country_name] = '#99CC00';

    $('#world-vmap').vectorMap('set', 'colors', country_colors);
</script>
</asp:Content>
