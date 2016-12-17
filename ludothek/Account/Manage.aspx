<%@ Page Title="Konto verwalten" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="ludothek.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="form-horizontal">
        <h4>Benutzerdaten bearbeiten</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="NameBearbeiten" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="NameBearbeiten" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="NameBearbeiten"
                    CssClass="text-danger" ErrorMessage="Das Name-Feld ist erforderlich." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="VornameBearbeiten" CssClass="col-md-2 control-label">Vorname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="VornameBearbeiten" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="VornameBearbeiten"
                    CssClass="text-danger" ErrorMessage="Das Vorname-Feld ist erforderlich." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TelefonBearbeiten" CssClass="col-md-2 control-label">Telefon</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="TelefonBearbeiten" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="TelefonBearbeiten"
                    CssClass="text-danger" ErrorMessage="Das Telefon-Feld ist erforderlich." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="TelefonBearbeiten" ValidationExpression="\d+" 
                    CssClass="text-danger" ErrorMessage="Im Telefon-Feld dürfen nur Zahlen eingeben." />

            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="EmailBearbeiten" CssClass="col-md-2 control-label">E-Mail</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="EmailBearbeiten" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailBearbeiten"
                    CssClass="text-danger" ErrorMessage="Das E-Mail-Feld ist erforderlich." /> 
                <asp:RegularExpressionValidator runat="server" ControlToValidate="EmailBearbeiten" ValidationExpression="([-.]*\w+)+@([-.]*\w+)+\.([.]*\w+)+" 
                    CssClass="text-danger" ErrorMessage="Bitte geben Sie eine gültige E-Mail-Adresse an." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="SaveUserClick" Text="Speichern" CssClass="btn btn-default" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Passwort ändern</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>Kennwort:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                </dl>
            </div>
        </div>
    </div>

</asp:Content>
