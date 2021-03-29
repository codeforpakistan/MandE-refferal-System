using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_refer
{
    public partial class SiteMaster : MasterPage
    {
        SqlConnection conn = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            int count = 0;

            string notif;
            string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            conn = new SqlConnection(ConnectionString);
            conn.Open();
            using (var sqlCommand = new SqlCommand())
                {
                    sqlCommand.Connection = conn;
                    sqlCommand.CommandText = "Select * from tblReferralNotification";
                    sqlCommand.CommandType = System.Data.CommandType.Text;
                    sqlCommand.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
                    da.Fill(dt);
                    count = Convert.ToInt32(dt.Rows.Count.ToString());
                    foreach (DataRow row in dt.Rows)
                    {
                        string val = row["view"].ToString();
                        if (val == "False") {
                            LabelNotficationNo.Text = count.ToString();
                            Labenotificationcount.Text = count.ToString();
                            LabelnotifID.Text = row["NID"].ToString();
                           LabelReferralID.Text= row["ReferralID"].ToString();
                            r1.DataSource = dt;
                            r1.DataBind();
                        }
                     
                     }
                conn.Close();
                }
            }

        
       
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
       
            string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            conn = new SqlConnection(ConnectionString);
            conn.Open();
                using (var sqlCommand = new SqlCommand())
                {
                    sqlCommand.Connection = conn;
                    sqlCommand.CommandText = "Delete  [dbo].[tblReferralNotification]  where NID=@nid";
                    sqlCommand.CommandType = System.Data.CommandType.Text;
                    sqlCommand.Parameters.AddWithValue("@nid", LabelnotifID.Text);
                    sqlCommand.ExecuteNonQuery();
                }
            conn.Close();
            Response.Redirect(String.Format("ProjectReferralDetails.aspx?ReferralID={0}", LabelReferralID.Text));

        }
    }
    }