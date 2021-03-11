using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

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
            MessageBoxButtons buttons = MessageBoxButtons.OK;
            DialogResult result;
            String warning = "Error";
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
                result = MessageBox.Show("Restaurant Id Required!!", warning, buttons);
            }
            else if (restaurantName == "")
            {
                result = MessageBox.Show("Restaurant Name Required!!", warning, buttons);
            }
            else if (restaurantAddress == "")
            {
                result = MessageBox.Show("Restaurant Address Required!!", warning, buttons);
            }
            else if (restaurantOwner == "")
            {
                result = MessageBox.Show("Restaurant Owner name Required!!", warning, buttons);
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
                    result = MessageBox.Show("Invalid Phone number!! Please enter valid number", warning, buttons);
                }
                catch (Exception ex)
                {
                    result = MessageBox.Show(ex.Message, warning, buttons);
                }
            }
        }
    }
}