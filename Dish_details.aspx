﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dish_details.aspx.cs" MasterPageFile="~/Site.Master" Inherits="DatabaseCW.Dish_details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class ="RestaurantHeadings">
        <h1>Insertion of Dish Details</h1>
    </div>
        <div class ="Dish_field">
        <asp:Label class="Labels" ID="Dish_code" runat="server" Text="Dish code:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox class="TextField" ID="Dish_codeTXT" runat="server"></asp:TextBox><br /><br />
        <asp:Label class="Labels" ID="Dish_name" runat="server" Text="Dish name:"></asp:Label>&nbsp;&nbsp;&nbsp;
        <asp:TextBox class="TextField" ID="Dish_nameTXT" runat="server"></asp:TextBox><br /><br />
        <asp:Label class="Labels" ID="Dish_rate" runat="server" Text="Dish rate:"></asp:Label>&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox class="TextField" ID="Dish_rateTXT" runat="server"></asp:TextBox><br /><br />
        <asp:Label class="Labels" ID="Local_name" runat="server" Text="Local name:"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox class="TextField" ID="Local_nameTXT" runat="server"></asp:TextBox><br />
        <asp:Button class="InsertBTN" runat="server" Text="Insert" OnClick="InsertBTN_Click" />
        </div>
        <asp:GridView class= "GridData" ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="DISH_CODE" DataSourceID="LalDataBase" CellPadding="0" BorderStyle="None">
            <EditRowStyle Height="0px" Width="0px" Wrap="True" />
            <HeaderStyle BackColor="#5D7B9D" ForeColor="White" font-size="12px" Height="27px" />   
            <Columns>
                <asp:BoundField DataField="DISH_CODE" HeaderText="DISH_CODE" ReadOnly="True" SortExpression="DISH_CODE" />
                <asp:BoundField DataField="DISH_NAME" HeaderText="DISH_NAME" SortExpression="DISH_NAME" />
                <asp:BoundField DataField="DISH_RATE" HeaderText="DISH_RATE" SortExpression="DISH_RATE" />
                <asp:BoundField DataField="LOCAL_NAME" HeaderText="LOCAL_NAME" SortExpression="LOCAL_NAME" />
            </Columns>
            <RowStyle ForeColor="#BCC6CC" Height="27px" HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
        <asp:SqlDataSource ID="LalDataBase" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" DeleteCommand="
DELETE FROM DISH where (DISH_CODE = :dish_code)" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="Select * from Dish" UpdateCommand="UPDATE DISH SET DISH_NAME = :dish_name, DISH_RATE = :dish_rate, LOCAL_NAME = :local_name WHERE (DISH_CODE = :dish_code)">
            <DeleteParameters>
                <asp:Parameter Name="dish_code" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="dish_name" />
                <asp:Parameter Name="dish_rate" />
                <asp:Parameter Name="local_name" />
                <asp:Parameter Name="dish_code" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Content>
