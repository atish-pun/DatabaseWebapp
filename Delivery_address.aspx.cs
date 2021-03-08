using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseCW
{
    public partial class Delivery_address : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [Obsolete]
        protected void InsertBTN_Click(object sender, EventArgs e)
        {
            
                String deliveryid = didTXT.Text;
                String deliverylocation = dlocationTXT.Text;
                String deliverytime = dtimeTXT.Text;
                deliveryid = deliveryid.Trim();
                deliverylocation = deliverylocation.Trim();
                deliverytime = deliverytime.Trim();

                if (deliveryid == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Delivery Id Required!!" + "');", true);
                }
                else if (deliverylocation == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Delivery Location Required!!" + "');", true);
                }
                else if (deliverytime == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Delivery Time Required!!" + "');", true);
                }
              
                else
                {
                    try {
                        int deliverycharge = int.Parse(dchargeTXT.Text);
                        OracleConnection deliveryconnection = new OracleConnection("Data Source = ATU; User ID = lal_kumar_pun; password = lal; Unicode=True");
                        deliveryconnection.Open();
                        String query = "INSERT into DELIVERY_ADDRESS values('" + deliveryid + "','" + deliverylocation + "','" + deliverytime + "','" + deliverycharge + "')";
                        OracleCommand cmd = new OracleCommand(query, deliveryconnection);
                        cmd.ExecuteNonQuery();
                        deliveryconnection.Close();
                        Response.Redirect("~/Delivery_address.aspx");
                        didTXT.Text = "";
                        dlocationTXT.Text = "";
                        dtimeTXT.Text = "";
                        dchargeTXT.Text = "";
                   
                    }
                    catch (FormatException)
                    {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + "Wrong input format for Delivery Charge" + "');", true);
                }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Alter", "alert('" + ex.Message + "');", true);
                    }

                }         
        }
    }
}