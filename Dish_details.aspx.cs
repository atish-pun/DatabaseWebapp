using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;

namespace DatabaseCW
{
    public partial class Dish_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void InsertBTN_Click(object sender, EventArgs e)
        {

            String dishCode = Dish_codeTXT.Text;
            String dishName = Dish_nameTXT.Text;
            String dishLocal = Local_nameTXT.Text;
            dishCode = dishCode.Trim();
            dishName = dishName.Trim();
            dishLocal = dishLocal.Trim();

            if (dishCode == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Dish Code Required!!" + "');", true);
            }
            else if (dishName == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Dish Name Required!!" + "');", true);
            }
            else
            {
                try
                {
                    int dishRate = int.Parse(Dish_rateTXT.Text);
                    OracleConnection dishconnection = new OracleConnection("Data Source = ATU; User ID = lal_kumar_pun; password = lal; Unicode=True");
                    dishconnection.Open();
                    String query = "INSERT into DISH values('" + dishCode + "','" + dishName + "','" + dishRate + "','" + dishLocal + "')";
                    OracleCommand cmd = new OracleCommand(query, dishconnection);
                    cmd.ExecuteNonQuery();
                    dishconnection.Close();
                    Response.Redirect("~/Dish_details.aspx");
                    Dish_codeTXT.Text = "";
                    Dish_nameTXT.Text = "";
                    Dish_rateTXT.Text = "";
                    Local_nameTXT.Text = "";

                }
                catch (FormatException)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Invalid Dish rate!! Please enter valid Price" + "');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + ex.Message + "');", true);
                }
            }
        }
    }
}