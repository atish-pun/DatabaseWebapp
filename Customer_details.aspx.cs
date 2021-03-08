using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseCW
{
    public partial class Customer_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void InsertBTN_Click(object sender, EventArgs e)
        {

            String customerId = CidTXT.Text;
            String customerName = CnameTXT.Text;
            String customerAge = CageTXT.Text;
            String customerEmail = CemailTXT.Text;
            string customerGender = CgenderTXT.Text;
            customerId = customerId.Trim();
            customerName = customerName.Trim();
            customerAge = customerAge.Trim();
            customerEmail = customerEmail.Trim();

            if (customerId == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Customer Id Required!!" + "');", true);
            }
            else if (customerName == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Customer Name Required!!" + "');", true);
            }
            else if (customerGender == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Customer Gender Required!!" + "');", true);
            }
            else
            {
                try
                {
                    Int64 customerPh = Int64.Parse(CphoneTXT.Text);
                    OracleConnection Customerconnection = new OracleConnection("Data Source = ATU; User ID = lal_kumar_pun; password = lal; Unicode=True");
                    Customerconnection.Open();
                    String query = "INSERT into CUSTOMER values('" + customerId + "','" + customerName + "','" + customerPh + "','" + customerEmail + "','" + customerAge + "','" + customerGender + "')";
                    OracleCommand cmd = new OracleCommand(query, Customerconnection);
                    cmd.ExecuteNonQuery();
                    Customerconnection.Close();
                    Response.Redirect("~/Customer_details.aspx");
                    CidTXT.Text = "";
                    CnameTXT.Text = "";
                    CageTXT.Text = "";
                    CemailTXT.Text = "";
                    CgenderTXT.Text = "";
                    CphoneTXT.Text = "";

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