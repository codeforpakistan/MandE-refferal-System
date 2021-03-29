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

    public partial class ProjectReferralList : System.Web.UI.Page
    {
        SqlConnection conn = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Sector"] != null)
            {
                string Sector = Request.QueryString["Sector"];
                string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
                conn = new SqlConnection(ConnectionString);
                conn.Open();
                    using (var sqlCommand = new SqlCommand())
                    {
                        sqlCommand.Connection = conn;
                        sqlCommand.CommandText = "Select * from [dbo].[tblReferral] where Department=@sector";
                        sqlCommand.CommandType = System.Data.CommandType.Text;
                        sqlCommand.Parameters.AddWithValue("@sector", Sector);
                        sqlCommand.ExecuteNonQuery();
                        DataTable dt = new DataTable();
                        SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
                        da.Fill(dt);
                      
                            r1.DataSource = dt;
                            r1.DataBind();
                    }
                conn.Close();
            }
        }
    }
}