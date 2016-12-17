<%@ Page Title="Registrieren" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ludothek.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Neues Konto erstellen</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="Das Name-Feld ist erforderlich." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Vorname" CssClass="col-md-2 control-label">Vorname</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Vorname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Vorname"
                    CssClass="text-danger" ErrorMessage="Das Vorname-Feld ist erforderlich." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Telefon" CssClass="col-md-2 control-label">Telefon</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Telefon" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Telefon"
                    CssClass="text-danger" ErrorMessage="Das Telefon-Feld ist erforderlich." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Telefon" ValidationExpression="\d+" 
                    CssClass="text-danger" ErrorMessage="Im Telefon-Feld dürfen nur Zahlen eingeben." />

            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">E-Mail</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="Das E-Mail-Feld ist erforderlich." /> 
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Email" ValidationExpression="([-.]*\w+)+@([-.]*\w+)+\.([.]*\w+)+" 
                    CssClass="text-danger" ErrorMessage="Bitte geben Sie eine gültige E-Mail-Adresse an." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Kennwort</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="Das Kennwortfeld ist erforderlich." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Kennwort bestätigen</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Das Feld zum Bestätigen des Kennworts ist erforderlich." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Das Kennwort stimmt nicht mit dem Bestätigungskennwort überein." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrieren" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
