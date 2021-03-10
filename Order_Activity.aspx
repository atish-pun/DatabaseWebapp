<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order_Activity.aspx.cs" MasterPageFile="~/Site.Master" Inherits="DatabaseCW.Order_Activity" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class ="RestaurantHeadings">
        <h1>Customers Dish Ordered history</h1>
     </div>
    <div class ="Dish_field">
         <asp:Label class="Labels" ID="CusName" runat="server" Text="Customer Name: "></asp:Label>
            <asp:DropDownList class="TextField" ID="DropDownListCusName" runat="server" DataSourceID="orderData" DataTextField="CUSTOMER_NAME" DataValueField="CUSTOMER_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="orderData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT CUSTOMER_NAME, CUSTOMER_ID FROM CUSTOMER"></asp:SqlDataSource>
            <br /><br />
            <asp:Label class="Labels" ID="CusId" runat="server" Text="Customer Id: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox class="TextField" ID="cusIdtxt" runat="server"></asp:TextBox><br /><br />
            <asp:Label class="Labels" ID="dateId" runat="server" Text="Select Month: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList class="TextField" ID="DropDownListDateTime" runat="server" AutoPostBack="True" AppendDataBoundItems="True">
                <asp:ListItem Text = "Select Month" Value =""></asp:ListItem>
                <asp:ListItem Value=1>January</asp:ListItem>
                <asp:ListItem Value=2>February</asp:ListItem>
                <asp:ListItem Value=3>March</asp:ListItem>
                <asp:ListItem Value=4>April</asp:ListItem>
                <asp:ListItem Value=5>May</asp:ListItem>
                <asp:ListItem Value=6>June</asp:ListItem>
                <asp:ListItem Value=7>July</asp:ListItem>
                <asp:ListItem Value=8>August</asp:ListItem>
                <asp:ListItem Value=9>September</asp:ListItem>
                <asp:ListItem Value=10>October</asp:ListItem>
                <asp:ListItem Value=11>November</asp:ListItem>
                <asp:ListItem Value=12>December</asp:ListItem>
         </asp:DropDownList>
         <asp:SqlDataSource ID="DateChooseOrderDishes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="select Date_time from Details_order"></asp:SqlDataSource>
    </div>
     <asp:GridView class= "GridData" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="0" BorderStyle="None" DataSourceID="OrderActivity">
            <Columns>
                <asp:BoundField DataField="TOTAL_DISH_ORDERED" HeaderText="TOTAL_DISH_ORDERED" SortExpression="TOTAL_DISH_ORDERED" />
                <asp:BoundField DataField="RESTAURANT_NAME" HeaderText="RESTAURANT_NAME" SortExpression="RESTAURANT_NAME" />
            </Columns>
            <EditRowStyle Height="0px" Width="0px" Wrap="True" />
            <HeaderStyle BackColor="#5D7B9D" ForeColor="White" font-size="12px" Height="27px" /> 
                <RowStyle ForeColor="#BCC6CC" Height="27px" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>
     <asp:SqlDataSource ID="OrderActivity" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT COUNT (ORDER_DISHES.DISH_CODE) AS TOTAL_DISH_ORDERED, RESTAURANT.RESTAURANT_NAME FROM ORDER_DISHES JOIN RESTAURANT ON RESTAURANT.RESTAURANT_ID = ORDER_DISHES.RESTAURANT_ID JOIN DETAILS_ORDER ON DETAILS_ORDER.ORDER_ID = ORDER_DISHES.ORDER_ID WHERE DETAILS_ORDER.CUSTOMER_ID = :DropDownListCusName AND extract(month FROM DETAILS_ORDER.DATE_TIME) = :DropDownListDateTime GROUP BY RESTAURANT.RESTAURANT_NAME ORDER BY TOTAL_DISH_ORDERED DESC">
         <SelectParameters>
             <asp:ControlParameter ControlID="DropDownListCusName" Name="DropDownListCusName" PropertyName="SelectedValue" />
             <asp:ControlParameter ControlID="DropDownListDateTime" Name="DropDownListDateTime" PropertyName="SelectedValue" />
         </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>
