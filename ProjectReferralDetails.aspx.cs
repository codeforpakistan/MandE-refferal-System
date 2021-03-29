using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_refer
{
    public partial class ProjectReferralDetails : System.Web.UI.Page
    {
        SqlConnection conn = null;
        public int ProjectCode { get; set; }
        public string division { get; set; }
        public string district { get; set; }
        public string tehsil { get; set; }
        public string sector { get; set; }
        public string subheadnamelocation { get; set; }
        public string referraldate { get; set; }
        public string apparent_issue { get; set; }
        public string name { get; set; }
        public string contact { get; set; }
        public string designation { get; set; }
        public string email { get; set; }
        public string descision { get; set; }
        public string comments { get; set; }
        public string status { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["ReferralID"] != null)
            {
              string refid=  Request.QueryString["ReferralID"];
                string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
                conn = new SqlConnection(ConnectionString);
                conn.Open();
                using (var sqlCommand = new SqlCommand())
                    {
                        sqlCommand.Connection = conn;
                        sqlCommand.CommandText = "Select * from [dbo].[tblReferral]  where ReferralID=@rid ";
                        sqlCommand.CommandType = System.Data.CommandType.Text;
                        sqlCommand.Parameters.AddWithValue("@rid", refid);
                        sqlCommand.ExecuteNonQuery();
                        DataTable dt = new DataTable();
                        SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
                        da.Fill(dt);
                        foreach (DataRow row in dt.Rows)
                        {
                            contact = row["Contact"].ToString();
                            name = row["Name"].ToString();
                            designation = row["Desgination"].ToString();
                            apparent_issue = row["Apparent_Issue"].ToString();
                            comments = row["Comments"].ToString();
                            descision = row["Decision"].ToString();
                            status = row["Status"].ToString();
                            referraldate = row["ReferralDate"].ToString();
                            foreach (var image in row["Attachment"].ToString().Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries))
                            {
                                var img = new Image();
                                img.ImageUrl =  this.ResolveClientUrl("~/Upload/" + image);
                            img.Height = 400;
                            img.Width = 400;
                            //img.ID = "zoom";

                            img.Attributes.Add("class", "col-sm-4 img-responsive");
                                LabelAttachment.Controls.Add(img);
                            }
                            ProjectCode= Convert.ToInt32( row["ProjectCode"].ToString());
                            subheadnamelocation= row["SubHeadNameLocation"].ToString();
                            email= row["Email"].ToString();
                            division= row["Division"].ToString();
                            district= row["District"].ToString();
                            tehsil= row["Tehsil"].ToString();
                            sector= row["Department"].ToString();

                        }
                    
                }
            }

        }
    }
}