using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseCW
{
    public partial class Loyalty_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void Insertbtn_Click(object sender, EventArgs e)
        {
            String LoyaltyId = LidTXT.Text;
            String LoyaltyDiscription = LdescriptionTXT.Text;
            String Dishcode = DishcodeDropDown.Text;
            String RestaurantId = RestaurantIdDropDown.Text;
            LoyaltyId = LoyaltyId.Trim();
            Dishcode = Dishcode.Trim();
            LoyaltyDiscription = LoyaltyDiscription.Trim();
            RestaurantId = RestaurantId.Trim();

            if (LoyaltyId == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Loyalty Id Required!!" + "');", true);
            }
            else if (Dishcode == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Dishcode Required!!" + "');", true);
            }
            else if (RestaurantId == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "RestaurantId Required!!" + "');", true);
            }
            else
            {
                try
                {
                    int LoyaltyScore = int.Parse(LscoreTXT.Text);
                    OracleConnection Restaurantconnection = new OracleConnection("Data Source = ATU; User ID = lal_kumar_pun; password = lal; Unicode=True");
                    Restaurantconnection.Open();
                    String query = "INSERT into LOYALTY_POINT values('" + LoyaltyId + "','" + LoyaltyScore + "','" + LoyaltyDiscription + "','" + Dishcode + "','" + RestaurantId + "')";
                    OracleCommand cmd = new OracleCommand(query, Restaurantconnection);
                    cmd.ExecuteNonQuery();
                    Restaurantconnection.Close();
                    Response.Redirect("~/Loyalty_details.aspx");
                    LidTXT.Text = "";
                    LdescriptionTXT.Text = "";
                    DishcodeDropDown.Text = "";
                    RestaurantIdDropDown.Text = "";
                    LscoreTXT.Text = "";

                }
                catch (FormatException)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Invalid Loyalty score!! Please enter valid number" + "');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + ex.Message + "');", true);
                }
            }
        }
    }
}