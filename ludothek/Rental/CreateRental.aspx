<%@ Page Title="Ausleihen" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRental.aspx.cs" Inherits="ludothek.Rental.CreateRental"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Ausleihe erfassen.</h2>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="GameOne" CssClass="col-md-2 control-label">Spiel</asp:Label>
            <div class="col-md-10">       
               <asp:DropDownList ID="GameOne" runat="server" class="form-control"></asp:DropDownList>
               <asp:CustomValidator 
                   ID="FreeGame"
                   runat="server"                   
                   ControlToValidate="GameOne" 
                   OnServerValidate="FreeGame_ServerValidate"
                   ForeColor="Red"
               ></asp:CustomValidator>
                <asp:Label ID="ErrorLabel" runat="server" Text=""></asp:Label>
            </div>
        </div>
    <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AusleiheBeginn" CssClass="col-md-2 control-label">Beginn der Ausleihe</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AusleiheBeginn" CssClass="form-control" ReadOnly="true"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="AusleiheBeginn"
                    CssClass="text-danger" ErrorMessage="Das Startdatum der Ausleihe muss eingegeben werden." />
               <asp:CompareValidator
                    id="CompareValidator1" runat="server" 
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="AusleiheBeginn" 
                    ErrorMessage="Bitte gib ein gültiges Datum ein">
                </asp:CompareValidator>
            </div>
     </div>
     <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AusleiheEnde" CssClass="col-md-2 control-label">Ende der Ausleihe</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="AusleiheEnde" CssClass="form-control enddate" ReadOnly="true" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="AusleiheEnde"
                    CssClass="text-danger" ErrorMessage="Das Enddatum der Ausleihe muss eingegeben werden." />
                <asp:CompareValidator
                    id="dateValidator" runat="server" 
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="AusleiheEnde" 
                    ErrorMessage="Bitte gib ein gültiges Datum ein">
                </asp:CompareValidator>
            </div>          
     </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Ausleihe erfassen" CssClass="btn btn-default" ID="newRentalButton" OnClick="newRentalButton_Click" />
            </div>
        </div>

</asp:Content>
