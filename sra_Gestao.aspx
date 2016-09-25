<%@ Page Title="Busca GPE" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="sra_Gestao.aspx.vb" Inherits="PortalCase.sra_Gestao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="wrapper">
    <div class="row">
        <div class="col-sm-12">
            <form runat="server">
                <section class="panel">
                    <header class="panel-heading">
                         Busca Padrão por Registro
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                        </span>
                    </header>
                    <div class="panel-body">
                        <div class="col-lg-2">
                            <asp:DropDownList runat="server" class="form-control m-bot1" ID="dlistIndice" Value=""></asp:DropDownList>
                        </div>
                        <div class="col-lg-5">
                            <div class="input-group m-bot5">
                                <asp:TextBox runat="server" Id="txtBusca" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-btn">
                                <asp:LinkButton ID="btnSeek" runat="server" class="btn btn-default" type="submit" >Buscar
                                </asp:LinkButton>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-1">
                            <asp:DropDownList runat="server" class="form-control m-bot1" id="dlistPageSize" Value=""></asp:DropDownList>
                        </div>
                        <div class="col-lg-2 btn-gap">
                            <asp:LinkButton runat="server" id="btnNovoFunc" class="btn btn-default tooltips" data-toggle="tooltip" data-placement="right" title="" data-original-title="Novo Funcionário" TabIndex="10"> Novo</asp:LinkButton>
                        </div>
                        <br /><br />
                        <div class="adv-table" runat="server" id="divGridView">                        
                                <asp:GridView ID="GVItens" runat="server" Autosize="True"  CssClass="table table-hover table-bordered" AllowPaging="True" 
                                PagerSettings-Mode="NumericFirstLast" AutoGenerateColumns="False" PageSize="10" DataKeyNames="SRA_FILIAL,SRA_MAT,SRA_NOME,SRA_CPF"
                                OnPageIndexChanging="GVItens_PageIndexChanging" OnRowDataBound="GVItensHover" onrowcommand="GVItens_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnDetalhes" runat="server"  CssClass="tooltips" data-toggle="tooltip" data-placement="right" 
                                                    title="" data-original-title="Visualizar" ImageUrl="~/images/details_open.png"
                                                    CommandName="btnVisualizar" CommandArgument='<%# CType(Container,GridViewRow).RowIndex %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SRA_FILIAL" HeaderText="Filial"></asp:BoundField>
                                        <asp:BoundField DataField="SRA_MAT" HeaderText="Matricula"></asp:BoundField>      
                                        <asp:BoundField DataField="SRA_NOME" HeaderText="Nome"></asp:BoundField>
                                        <asp:BoundField DataField="SRA_CPF" HeaderText="CPF"></asp:BoundField>
                                        <asp:BoundField DataField="SRA_ADMISSA" HeaderText="Dt. Admissão"></asp:BoundField>
                                        <asp:BoundField DataField="SRA_NASC" HeaderText="Dt. Nascimento"></asp:BoundField>
                                        <asp:BoundField DataField="SRA_CC" HeaderText="C. de Custo"></asp:BoundField>
                                        <asp:BoundField DataField="SRA_RG" HeaderText="RG"></asp:BoundField>
                                        <asp:BoundField DataField="SRA_SITFOLH" HeaderText="Situação"></asp:BoundField>
                                     </Columns>                                
                                    <PagerSettings Mode="NumericFirstLast"></PagerSettings>
                                    </asp:GridView>                            
                        </div>
                        <div class="alert alert-block alert-danger fade in" runat="server" visible="false" id="divX9">
                            <asp:Label runat="server" type="button" class="close close-sm" data-dismiss="alert">
                                <i class="fa fa-times"></i>
                            </asp:Label>   
                            <strong>Oh!</strong> Tente novamente.                                                                     
                        </div>
                    </div>
                </section>
            </form>
        </div>
    </div> 
    <div class="row">
        <div class="col-sm-12">
                <section class="panel" runat="server">
                    <header class="panel-heading">
                         Detalhes
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                        </span>
                    </header>
                    <div class="panel-body">
                    <div class="square-widget" runat="server" id="DetalhesField" visible="false">
                        <div class="widget-container">
                            <div class="stepy-tab">
                            </div>
                            <div id="default" class="form-horizontal" >
                                <fieldset title="Cadastrais">
                                    <legend>Informações Pessoais</legend>
                                    <div class="form-group">
                                        <label class="col-md-1 col-sm-1 control-label">Filial</label>
                                        <div class="col-sm-2">
                                            <input type="text" runat="server" ID="RA_FILIAL" class="form-control" onlyread="true">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Matricula</label>
                                        <div class="col-sm-1">
                                            <input type="text" runat="server" ID="RA_MAT" class="form-control" onlyread="true">
                                        </div>
                                        <label class="col-md-1 col-sm-1 control-label">Nome Completo</label>
                                        <div class="col-sm-4">
                                            <input type="text" runat="server" ID="RA_NOME" class="form-control" onlyread="true">
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
                                            <input type="text" runat="server" ID="RA_NASC" class="form-control" onlyread="true">
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
                                            <input type="text" runat="server" ID="RA_CC" class="form-control" onlyread="true">
                                        </div>
                                        <label class="col-sm-1 control-label">Dt. Admissão</label>
                                        <div class="col-sm-1">
                                            <input type="text" runat="server" ID="RA_ADMISSA" class="form-control" onlyread="true">
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
                                            <input type="text" runat="server" ID="RA_CIC" class="form-control" onlyread="true">
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
                                <Button class="btn btn-default finish">
                                    Fim </Button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>  
</div>

</asp:Content>