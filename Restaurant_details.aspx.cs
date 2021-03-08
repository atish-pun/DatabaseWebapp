using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseCW
{
    public partial class Resturant_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void InsertBTN_Click(object sender, EventArgs e)
        {
          
            String restaurantId = RidTXT.Text;
            String restaurantName = RnameTXT.Text;
            String restaurantAddress = RaddressTXT.Text;
            String restaurantOwner = ROwnerTXT.Text;
            restaurantId = restaurantId.Trim();
            restaurantName = restaurantName.Trim();
            restaurantAddress = restaurantAddress.Trim();
            restaurantOwner = restaurantOwner.Trim();

            if (restaurantId == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Restaurant Id Required!!" + "');", true);
            }
            else if (restaurantName == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Restaurant Name Required!!" + "');", true);
            }
            else if (restaurantAddress == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Restaurant Address Required!!" + "');", true);
            }
            else if (restaurantOwner == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Restaurant Owner name Required!!" + "');", true);
            }
            else
            {
                try
                {
                    Int64 restaurantPh = Int64.Parse(RphoneTXT.Text);
                    OracleConnection Restaurantconnection = new OracleConnection("Data Source = ATU; User ID = lal_kumar_pun; password = lal; Unicode=True");
                    Restaurantconnection.Open();
                    String query = "INSERT into RESTAURANT values('" + restaurantId + "','" + restaurantName + "','" + restaurantAddress + "','" + restaurantPh + "','" + restaurantOwner + "')";
                    OracleCommand cmd = new OracleCommand(query, Restaurantconnection);
                    cmd.ExecuteNonQuery();
                    Restaurantconnection.Close();
                    Response.Redirect("~/Restaurant_details.aspx");
                    RidTXT.Text = "";
                    RnameTXT.Text = "";
                    RaddressTXT.Text = "";
                    RphoneTXT.Text = "";

                }
                catch (FormatException)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Invalid Phone number!! Please enter valid number" + "');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + ex.Message + "');", true);
                }
            }
        }
    }
}