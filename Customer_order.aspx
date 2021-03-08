<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_order.aspx.cs" MasterPageFile="~/Site.Master" Inherits="DatabaseCW.Customer_order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class ="RestaurantHeadings">
        <h1>Keep track on Customer Orders</h1>
        </div>
            <div class ="Dish_field">
            <asp:Label class="Labels" ID="CusName" runat="server" Text="Customer Name: "></asp:Label>
            <asp:DropDownList class="TextField" ID="DropDownListCusName" runat="server" DataSourceID="orderData" DataTextField="CUSTOMER_NAME" DataValueField="CUSTOMER_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="orderData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString6 %>" ProviderName="<%$ ConnectionStrings:ConnectionString6.ProviderName %>" SelectCommand="SELECT CUSTOMER_NAME, CUSTOMER_ID FROM CUSTOMER"></asp:SqlDataSource>
            <br /><br />
            <asp:Label class="Labels" ID="CusId" runat="server" Text="Customer Id: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox class="TextField" ID="cusIdtxt" runat="server"></asp:TextBox>
            </div>
            <asp:GridView class= "GridData" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ORDER_ID" DataSourceID="customerOrderData" CellPadding="0" BorderStyle="None">
            <EditRowStyle Height="0px" Width="0px" Wrap="True" />
            <HeaderStyle BackColor="#5D7B9D" ForeColor="White" font-size="12px" Height="27px" /> 
                <Columns>
                    <asp:BoundField DataField="ORDER_ID" HeaderText="ORDER_ID" ReadOnly="True" SortExpression="ORDER_ID" />
                    <asp:BoundField DataField="DISH_CODE" HeaderText="DISH_CODE" SortExpression="DISH_CODE" />
                    <asp:BoundField DataField="DISH_NAME" HeaderText="DISH_NAME" SortExpression="DISH_NAME" />
                    <asp:BoundField DataField="ORDER_QUANTITY" HeaderText="ORDER_QUANTITY" SortExpression="ORDER_QUANTITY" />
                    <asp:BoundField DataField="LINE_TOTAL" HeaderText="LINE_TOTAL" SortExpression="LINE_TOTAL" />
                    <asp:BoundField DataField="DELIVERY_LOCATION" HeaderText="DELIVERY_LOCATION" SortExpression="DELIVERY_LOCATION" />
                </Columns>
                <RowStyle ForeColor="#BCC6CC" Height="27px" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>
            <asp:SqlDataSource ID="customerOrderData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString6 %>" ProviderName="<%$ ConnectionStrings:ConnectionString6.ProviderName %>" SelectCommand="SELECT DETAILS_ORDER.ORDER_ID, ORDER_DISHES.DISH_CODE, DISH.DISH_NAME, ORDER_DISHES.ORDER_QUANTITY, ORDER_DISHES.LINE_TOTAL, DELIVERY_ADDRESS.DELIVERY_LOCATION FROM DETAILS_ORDER, ORDER_DISHES, DISH, DELIVERY_ADDRESS WHERE DETAILS_ORDER.ORDER_ID = ORDER_DISHES.ORDER_ID AND ORDER_DISHES.DISH_CODE = DISH.DISH_CODE AND DETAILS_ORDER.DELIVERY_ID = DELIVERY_ADDRESS.DELIVERY_ID AND (DETAILS_ORDER.CUSTOMER_ID = :DropDownListCusName)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListCusName" Name="DropDownListCusName" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
      </asp:Content>
