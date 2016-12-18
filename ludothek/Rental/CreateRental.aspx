<%@ Page Title="Ausleihen" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRental.aspx.cs" Inherits="ludothek.Rental.CreateRental"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Ausleihe erfassen.</h2>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Spiel" CssClass="col-md-2 control-label">Spiel</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="Spiel" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Spiel"
                    CssClass="text-danger" ErrorMessage="Es muss ein Spiel ausgewählt werden." />
            </div>
    </div>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AusleiheBeginn" CssClass="col-md-2 control-label">Beginn der Ausleihe</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AusleiheBeginn" CssClass="form-control" ReadOnly="true"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="AusleiheBeginn"
                    CssClass="text-danger" ErrorMessage="Das Startdatum der Ausleihe muss eingegeben werden." />
            </div>
     </div>
     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AusleiheEnde" CssClass="col-md-2 control-label">Ende der Ausleihe</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AusleiheEnde" CssClass="form-control enddate" ReadOnly="true"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="AusleiheEnde"
                    CssClass="text-danger" ErrorMessage="Das Enddatum der Ausleihe muss eingegeben werden." />
            </div>          
     </div>

</asp:Content>
