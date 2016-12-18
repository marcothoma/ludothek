<%@ Page Title="Ausleihen" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rentals.aspx.cs" Inherits="ludothek.Rental.Rentals" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Ausleihen Übersicht.</h2>

    <asp:UpdatePanel ID="UpdateGridView" runat="server">
        <ContentTemplate>
            <h2>Aktuelle Ausleihen</h2>
            <asp:GridView ID="GridViewRentals" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowCommand="GridViewRentals_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Verlängern" ShowHeader="True" Text="+ 1 Woche" ControlStyle-BackColor="Silver" ControlStyle-BorderStyle="None" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#6644AA" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#EE4444" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:Label ID="ErrorLabel" runat="server" Text=""></asp:Label>
            <h2>Ausleihen-Archiv</h2>
            <asp:GridView ID="GridViewRentalHistory" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#6644AA" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#EE4444" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
