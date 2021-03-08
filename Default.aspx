<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DatabaseCW._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Good Food</h1>
        <p >GoodFood, a virtual company, available in web and mobile platforms is opened to provide online food ordering and delivery system.
GoodFood has many restaurants registered into its system. Customers can browse
through restaurants or their favourite dishes to check price as well as availability of
dishes.</p>
        </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Customer</h2>
            <p>
                Customers can order many dishes from single restaurant or can order different
dishes from different restaurants. They can even order same item. example Momo from different restaurants.
            </p>
            <p>
                <a class="btn btn-default" href="Customer_details.aspx">Learn More &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
             <h2>Location</h2>
            <p>
                It is located at Lakeside Pokhara, Nepal.
            </p>
        </div>
        <div class="col-md-4">
            <h2>Loyalty</h2>
            <p>
               There is provision of Loyalty Points associated with selective dishes for selected day
or duration. The Loyalty Points gets accommodated over course of time and can be
used to get Free Dishes.
            </p>
             <p>
               <a class="btn btn-default" href="Loyalty_details.aspx">Learn More &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
