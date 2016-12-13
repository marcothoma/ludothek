<%@ Page Title="Ausleihen" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRental.aspx.cs" Inherits="ludothek.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Neue Ausleihe.</h3>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">E-Mail</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="Das E-Mail-Feld ist erforderlich." />
            </div>
        </div>

</asp:Content>
