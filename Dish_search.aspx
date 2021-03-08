    <%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dish_search.aspx.cs" Inherits="DatabaseCW.Dish_search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList><br />
    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList><br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="Dish_searchdata"></asp:GridView>
    <asp:SqlDataSource ID="Dish_searchdata" runat="server"></asp:SqlDataSource>
</asp:Content>
      

