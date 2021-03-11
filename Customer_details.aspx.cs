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
    public partial class Customer_details : System.Web.UI.Page
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
                result = MessageBox.Show("Customer Id Required!!", warning, buttons);
            }
            else if (customerName == "")
            {
                result = MessageBox.Show("Customer Name Required!!", warning, buttons);
            }
            else if (customerGender == "")
            {
                result = MessageBox.Show("Customer Gender Required!!", warning, buttons);
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