<%@ Page Title="Ausleihen" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rentals.aspx.cs"  %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Ausleihen Übersicht.</h3>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Spielanzeige" CssClass="col-md-2 control-label">Spielanzeige</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Spielanzeige" CssClass="form-control" />
            </div>
        </div>

</asp:Content>
