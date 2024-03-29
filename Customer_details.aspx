﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_details.aspx.cs" MasterPageFile="~/Site.Master" Inherits="DatabaseCW.Customer_details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class ="RestaurantHeadings">
        <h1>Insertion of Customer Details</h1>
        </div>
        <div class ="Dish_field">
        <asp:Label class="Labels" ID="Cid" runat="server" Text="Customer Id:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox class="TextField" ID="CidTXT" runat="server"></asp:TextBox><br /><br />
        <asp:Label class="Labels" ID="Cname" runat="server" Text="Customer Name:"></asp:Label>
        <asp:TextBox class="TextField" ID="CnameTXT" runat="server"></asp:TextBox><br /><br />
        <asp:Label class="Labels" ID="Cphone" runat="server" Text="Phone number:"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox class="TextField" ID="CphoneTXT" runat="server"></asp:TextBox><br /><br />
        <asp:Label class="Labels" ID="Cemail" runat="server" Text="Email:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox class="TextField" ID="CemailTXT" runat="server"></asp:TextBox><br /><br />
        <asp:Label class="Labels" ID="CAge" runat="server" Text="Age:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox class="TextField" ID="CageTXT" runat="server"></asp:TextBox><br /><br />
        <asp:Label class="Labels" ID="Cgender" runat="server" Text="Gender:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox class="TextField" ID="CgenderTXT" runat="server"></asp:TextBox>
        <asp:Button class="InsertBTN" ID="InsertBTN" runat="server" Text="Insert" OnClick="InsertBTN_Click" /><br />  
        </div>
            <asp:GridView class= "GridData" ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="CUSTOMER_ID" DataSourceID="CustomerData" CellPadding="0" BorderStyle="None">
            <EditRowStyle Height="0px" Width="0px" Wrap="True" />
            <HeaderStyle BackColor="#5D7B9D" ForeColor="White" font-size="12px" Height="27px" /> 
                <Columns>
                    <asp:BoundField DataField="CUSTOMER_ID" HeaderText="CUSTOMER_ID" ReadOnly="True" SortExpression="CUSTOMER_ID" />
                    <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="CUSTOMER_NAME" SortExpression="CUSTOMER_NAME" />
                    <asp:BoundField DataField="CUSTOMER_PHONE_NO" HeaderText="CUSTOMER_PHONE_NO" SortExpression="CUSTOMER_PHONE_NO" />
                    <asp:BoundField DataField="CUSTOMER_EMAIL" HeaderText="CUSTOMER_EMAIL" SortExpression="CUSTOMER_EMAIL" />
                    <asp:BoundField DataField="AGE" HeaderText="AGE" SortExpression="AGE" />
                    <asp:BoundField DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER" />
                </Columns>
                <RowStyle ForeColor="#BCC6CC" Height="27px" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>

            <asp:SqlDataSource ID="CustomerData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="select * from Customer" DeleteCommand="DELETE FROM CUSTOMER WHERE (CUSTOMER_ID = :customer_id)" UpdateCommand="UPDATE CUSTOMER SET CUSTOMER_NAME = :CUSTOMER_NAME, CUSTOMER_PHONE_NO = :CUSTOMER_PHONE_NO, CUSTOMER_EMAIL = :CUSTOMER_EMAIL, AGE = :AGE, GENDER = :GENDER WHERE (CUSTOMER_ID = :CUSTOMER_ID)">
                <DeleteParameters>
                    <asp:Parameter Name="customer_id" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CUSTOMER_NAME" />
                    <asp:Parameter Name="CUSTOMER_PHONE_NO" />
                    <asp:Parameter Name="CUSTOMER_EMAIL" />
                    <asp:Parameter Name="AGE" />
                    <asp:Parameter Name="GENDER" />
                    <asp:Parameter Name="CUSTOMER_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
</asp:Content>
