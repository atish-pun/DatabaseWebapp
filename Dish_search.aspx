    <%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dish_search.aspx.cs" Inherits="DatabaseCW.Dish_search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class ="RestaurantHeadings">
        <h1>Keep track on Restaurant for Dishes</h1>
        </div>
            <div class ="Dish_field">
            <asp:Label class="Labels" ID="CusName" runat="server" Text="Customer Name: "></asp:Label>
            <asp:DropDownList class="TextField" ID="DropDownListCusName" runat="server" DataSourceID="orderData" DataTextField="CUSTOMER_NAME" DataValueField="CUSTOMER_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="orderData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString6 %>" ProviderName="<%$ ConnectionStrings:ConnectionString6.ProviderName %>" SelectCommand="SELECT CUSTOMER_NAME, CUSTOMER_ID FROM CUSTOMER"></asp:SqlDataSource>
            <br /><br />
            <asp:Label class="Labels" ID="CusId" runat="server" Text="Customer Id: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox class="TextField" ID="cusIdtxt" runat="server"></asp:TextBox><br /><br />
            <asp:Label class="Labels" ID="DishName" runat="server" Text="Dish Name: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList class="TextField" ID="DropDownListDishName" runat="server" DataSourceID="DishSearchDropDown" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" DataTextField="DISH_NAME" DataValueField="DISH_CODE">
            </asp:DropDownList>
                <asp:SqlDataSource ID="DishSearchDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="select * from dish"></asp:SqlDataSource>
            <br /><br />
            <asp:Label class="Labels" ID="DishCode" runat="server" Text="Dish Code: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox class="TextField" ID="dishcodetxt" runat="server"></asp:TextBox>
            </div>
    <asp:GridView class= "GridData" ID="GridView1" runat="server" DataSourceID="Dish_searchdata" AutoGenerateColumns="False" CellPadding="0" BorderStyle="None">
        <EditRowStyle Height="0px" Width="0px" Wrap="True" />
        <HeaderStyle BackColor="#5D7B9D" ForeColor="White" font-size="12px" Height="27px" />
        <Columns>
            <asp:BoundField DataField="RESTAURANT_ID" HeaderText="RESTAURANT_ID" SortExpression="RESTAURANT_ID" />
            <asp:BoundField DataField="RESTAURANT_NAME" HeaderText="RESTAURANT_NAME" SortExpression="RESTAURANT_NAME" />
            <asp:BoundField DataField="OWNER" HeaderText="OWNER" SortExpression="OWNER" />
            <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
            <asp:BoundField DataField="DISH_RATE" HeaderText="DISH_RATE" SortExpression="DISH_RATE" />
        </Columns>
        <RowStyle ForeColor="#BCC6CC" Height="27px" HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:GridView>
    <asp:SqlDataSource ID="Dish_searchdata" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT RESTAURANT_DISHES.RESTAURANT_ID, RESTAURANT.RESTAURANT_NAME, RESTAURANT.OWNER, RESTAURANT.ADDRESS, DISH.DISH_RATE FROM RESTAURANT_DISHES, RESTAURANT, DISH WHERE RESTAURANT_DISHES.RESTAURANT_ID = RESTAURANT.RESTAURANT_ID AND (RESTAURANT_DISHES.DISH_CODE = DISH.DISH_CODE) AND (RESTAURANT_DISHES.DISH_CODE = :DropDownListDishName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListDishName" Name="DropDownListDishName" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
      

