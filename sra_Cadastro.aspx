<%@ Page Title="Cadastro GPE" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="sra_Cadastro.aspx.vb" Inherits="PortalCase.sra_Cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<section>

        <!-- page heading start-->
        <div class="page-heading">
            <h3>
                Cadastro de Funcionário
            </h3>
            <ul class="breadcrumb">
                <li>
                    <a href="Dashboard">Dashboard</a>
                </li>
                <li class="active">Cadastro de Funcionário</li>
            </ul>
        </div>
        <!-- page heading end-->
        <hr/>
        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-md-12">
                    <div class="square-widget">
                        <div class="widget-container">
                            <div class="stepy-tab">
                            </div>
                            <form id="default" class="form-horizontal">
                                <fieldset title="Cadastrais">
                                    <legend>Informações Pessoais</legend>
                                    <div class="form-group">
                                        <label class="col-md-1 col-sm-1 control-label">Filial</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Filial" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Matricula</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Matricula" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Nome Completo</label>
                                        <div class="col-sm-4">
                                            <input type="text" placeholder="Nome Completo" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-1 col-sm-1 control-label">Tipo End.</label>
                                        <div class="col-sm-1">
                                            <select class="form-control m-bot1">
                                            <option>1-Comercial</option>
                                            <option>2-Residencial</option>
                                            </select>
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Endereço</label>
                                        <div class="col-sm-4">
                                            <input type="text" placeholder="Endereço" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Numero</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Numero" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Complemento</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Complento" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-1 col-sm-1 control-label">Bairro</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Bairro" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Município</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Município" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Estado</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Estado" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">CEP</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="CEP" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-1 col-sm-1 control-label">Nome da Mãe</label>
                                        <div class="col-sm-4">
                                            <input type="text" placeholder="Nome da Mãe" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Nome do Pai</label>
                                        <div class="col-sm-4">
                                            <input type="text" placeholder="Nome do Pai" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">Dt. Nascimento</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Dt. Nascimento" data-mask="99/99/9999" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Sexo</label>
                                        <div class="col-sm-1">
                                            <select class="form-control m-bot1">
                                            <option>M-Masculino</option>
                                            <option>F-Feminino</option>
                                            </select>
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Estado Civil</label>
                                        <div class="col-sm-1">
                                            <select class="form-control m-bot1">
                                            <option>Casado(a)</option>
                                            <option>Divorciado(a)</option>
                                            <option>Martial</option>
                                            <option>Desquitado(a)</option>
                                            <option>Solteiro(a)</option>
                                            <option>Viuvo(a)</option>
                                            </select>
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Naturalidade</label>
                                        <div class="col-sm-1">
                                            <select class="form-control m-bot1">
                                            <option>São Paulo</option>
                                            <option>Rio de Janeiro</option>
                                            <option>Minas Gerais</option>
                                            <option>Porto Alegre</option>
                                            <option>Bahia</option>
                                            <option>Goias</option>
                                            </select>
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Nascionalidade</label>
                                        <div class="col-sm-1">
                                            <select class="form-control m-bot1">
                                            <option>Brasileiro</option>
                                            <option>Naturalizado</option>
                                            <option>Argentino</option>
                                            <option>Americano</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-1 col-sm-1 control-label">Telefone</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Telefone" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Celular</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Celular" class="form-control">
                                        </div>     
                                        <label class="col-md-1 col-sm-1 control-label">E-mail</label>
                                        <div class="col-sm-3">
                                            <input type="text" placeholder="Email" class="form-control">
                                        </div>                                                                             
                                    </div>
                                </fieldset>
                                <fieldset title="Funcionais">
                                    <legend>Detalhes Proficional</legend>
                                    <div class="form-group">
                                        <label class="col-md-1 col-sm-1 control-label">Centro de Custo</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Centro de Custo" class="form-control">
                                        </div>
                                        <label class="col-sm-1 control-label">Dt. Admissão</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="DD/MM/AAAA" data-mask="99/99/9999" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Hrs Mensais</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Hrs" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Hrs Semanais</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Hrs" class="form-control">
                                        </div>     
                                        <label class="col-md-1 col-sm-1 control-label">Sindicato</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Sindicato" class="form-control">
                                        </div>    
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">Cargo</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Cargo" data-mask="" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Categoria</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Categoria" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Tipo de Pgnto</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Tipo" class="form-control">
                                        </div>     
                                        <label class="col-md-1 col-sm-1 control-label">Tipo de Adm</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Tipo" class="form-control">
                                        </div>    
                                        <label class="col-sm-1 control-label">Salário</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="R$ 999.999,99" data-mask="R$ 999.999,99" class="form-control">
                                        </div>                                                                         
                                    </div>
                                <div class="form-group">
                                    <label class="col-md-1 col-sm-1 control-label">Hrs Pericul.</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Hrs" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Hrs Ins Min</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Hrs" class="form-control">
                                        </div> 
                                        <label class="col-md-1 col-sm-1 control-label">Hrs Ins Med</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Hrs" class="form-control">
                                        </div> 
                                        <label class="col-md-1 col-sm-1 control-label">Hrs Ins Max</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Hrs" class="form-control">
                                        </div> 
                                </div>
                                    <div class="form-group">
                                        <label class="col-md-1 col-sm-1 control-label">Grau de Form.</label>
                                        <div class="col-sm-3">
                                            <input type="text" placeholder="Grau de Formação" data-mask="" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Vinculo RAIS</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Vinculo RAIS" data-mask="" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Turno</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Turno de Trabalho" data-mask="" class="form-control">
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset title="Documentais">
                                    <legend>Detalhes dos Doccumentos</legend>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">CPF</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="CPF" data-mask="" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">RG</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="RG" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">PIS</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="PIS" class="form-control">
                                        </div>     
                                        <label class="col-md-1 col-sm-1 control-label">Cart. Prof.</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Carteira Pofissional" class="form-control">
                                        </div>
                                    </div>   
                                    <div class="form-group">  
                                        <label class="col-md-1 col-sm-1 control-label">Serie C. Prof.</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Serie Pofissional" class="form-control">
                                        </div> 
                                        <label class="col-sm-1 control-label">Habilitação</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Habilitação" data-mask="" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Reservista</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Reservista" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Tit Eleitor</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Titulo de Eleitor" class="form-control">
                                        </div>     
                                    </div>  
                                    <div class="form-group">  
                                        <label class="col-md-1 col-sm-1 control-label">Zona Eleit</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Zona Eleitoral" class="form-control">
                                        </div> 
                                        <label class="col-sm-1 control-label">Sessão Eleti</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Sessão Eleitoral" data-mask="" class="form-control">
                                        </div>  
                                    </div>                                                                             
                                </fieldset>
                                <fieldset title="Beneficios">
                                    <legend>Detalhes dos Beneficios</legend>
                                    <div class="form-group">  
                                        <label class="col-md-1 col-sm-1 control-label">Seg de Vida</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Seguro de Vida" class="form-control">
                                        </div> 
                                        <label class="col-sm-1 control-label">Vale Refeição</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Vale Refeição" data-mask="" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Vale Alimentação</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Vale Refeição" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">C Assistencial</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Contr. Assistencial" class="form-control">
                                        </div>     
                                    </div>          
                                </fieldset>
                                <fieldset title="Outros">
                                    <legend>Outras Informações</legend>
                                    <div class="form-group">  
                                        <label class="col-md-1 col-sm-1 control-label">Seg de Vida</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Seguro de Vida" class="form-control">
                                        </div> 
                                        <label class="col-sm-1 control-label">Vale Refeição</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Vale Refeição" data-mask="" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Vale Alimentação</label>
                                        <div class="col-sm-2">
                                            <input type="text" placeholder="Vale Refeição" class="form-control">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">C Assistencial</label>
                                        <div class="col-sm-1">
                                            <input type="text" placeholder="Contr. Assistencial" class="form-control">
                                        </div>     
                                    </div>         
                                </fieldset>
                                <button class="btn btn-info finish">
                                    Cadastrar </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--body wrapper end-->
</section>
<!--pickers plugins-->
<script type="text/javascript" src="Scripts/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="Scripts/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="Scripts/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="Scripts/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="Scripts/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="Scripts/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

<!--pickers initialization-->
<script src="Scripts/pickers-init.js"></script> 
</asp:Content>

