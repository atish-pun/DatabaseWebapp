using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Windows.Forms;

namespace DatabaseCW
{
    public partial class Dish_details : System.Web.UI.Page
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
            String dishCode = Dish_codeTXT.Text;
            String dishName = Dish_nameTXT.Text;
            String dishLocal = Local_nameTXT.Text;
            dishCode = dishCode.Trim();
            dishName = dishName.Trim();
            dishLocal = dishLocal.Trim();

            if (dishCode == "")
            {
                result = MessageBox.Show("Dish Code Required!!", warning, buttons);
            }
            else if (dishName == "")
            {
                result = MessageBox.Show("Dish Name Required!!", warning, buttons);
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
                    result = MessageBox.Show("Invalid Dish rate!! Please enter valid Price", warning, buttons);
                }
                catch (Exception ex)
                {
                    result = MessageBox.Show(ex.Message, warning, buttons);
                }
            }
        }
    }
}