<%@ Page Title="Ausleihen" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRental.aspx.cs"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Neue Ausleihe.</h3>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Spielnummer" CssClass="col-md-2 control-label">Spielnummer</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Spielnummer" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Spielnummer"
                    CssClass="text-danger" ErrorMessage="Spielnummer muss eingegeben werden." />
            </div>
        </div>

</asp:Content>
