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

    public partial class _Default : Page
    {
        SqlConnection conn = null;

        public int appcount { get; set; }
    public int unappcount { get; set; }
        public int Agriculture { get; set; }
        public int AUQAF { get; set; }
        public int BoardRevenue { get; set; }
        public int DistrictADP { get; set; }
        public int DrinkingWaterandSanitation { get; set; }
        public int ElementarySecondaryEducation { get; set; }
        public int EnergyPower { get; set; }
    public int Environment { get; set; }
    public int EstablishmentAdministration { get; set; }
public int ExciseTaxation{ get; set; } 
 public int Finance { get; set; }
public int Food { get; set; }
public int Health { get; set; }
public int HigherEducation { get; set; }
public int Home { get; set; }
public int Housing { get; set; }
public int Industries { get; set; }
public int Information { get; set; }
public int Labour { get; set; }
public int LawJustice { get; set; } 
 public int LocalGovernment { get; set; }
public int MinesMinerals { get; set; } 
 public int MULTISECTORALDEVELOPMENT { get; set; }
        public int PopulationWelfare { get; set; }
public int ReliefRehabilitation { get; set; } 
 public int Roads { get; set; }
public int SocialWelfare { get; set; }
public int SpecialInitiatives { get; set; }
public int SportsCulture { get; set; } 
 public int STIT { get; set; } 
 public int Transport { get; set; }
public int UrbanDevelopment { get; set; }
public int Water { get; set; }
protected void Page_Load(object sender, EventArgs e)
        {
            appcount = 0;
            unappcount = 0;
            Agriculture = 0;
            AUQAF = 0;
            BoardRevenue = 0;
            DistrictADP = 0;
            DrinkingWaterandSanitation = 0;
            ElementarySecondaryEducation = 0;
            EnergyPower = 0;
            Environment = 0;
            EstablishmentAdministration = 0;
            ExciseTaxation = 0;
            Finance = 0;
            Food = 0;
            Health = 0;
            HigherEducation = 0;
            Home = 0;
            Housing = 0;
            Industries = 0;
            Information = 0;
            Labour = 0;
            LawJustice = 0;
            LocalGovernment = 0;
            MinesMinerals = 0;
            MULTISECTORALDEVELOPMENT = 0;
            PopulationWelfare = 0;
            ReliefRehabilitation = 0;
            Roads = 0;
            SocialWelfare = 0;
            SpecialInitiatives = 0;
            SportsCulture = 0;
            STIT = 0;
            Transport = 0;
            UrbanDevelopment = 0;
            Water = 0;
            string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            conn = new SqlConnection(ConnectionString);
            conn.Open();
                using (var sqlCommand = new SqlCommand())
                {
                    sqlCommand.Connection = conn;
                    sqlCommand.CommandText = "Select * from [dbo].[tblReferral] ";
                    sqlCommand.CommandType = System.Data.CommandType.Text;
                    sqlCommand.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
                    da.Fill(dt);
                   
                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["Status"].ToString() == "True")
                            {
                            
                                appcount++;
                            }
                            else
                            {
                                unappcount++;
                            }
                        if (row["Department"].ToString() == "Agriculture")
                        {

                            Agriculture++;
                        }
                 
                        if (row["Department"].ToString() == "AUQAF")
                        {

                            AUQAF++;
                        }
                 
                        if (row["Department"].ToString() == "Board Revenue")
                        {

                            BoardRevenue++;
                        }

                        if (row["Department"].ToString() == "District ADP")
                        {

                            DistrictADP++;
                        }
                        if (row["Department"].ToString() == "Drinking Water and Sanitation")
                        {

                            DrinkingWaterandSanitation++;
                        }
                        if (row["Department"].ToString() == "Elementary & Secondary Education")
                        {

                            ElementarySecondaryEducation++;
                        }
                        if (row["Department"].ToString() == "Energy & Power")
                        {

                            EnergyPower++;
                        }
                        if (row["Department"].ToString() == "Environment")
                        {

                            Environment++;
                        }
                        if (row["Department"].ToString() == "Establishment & Administration")
                        {

                            EstablishmentAdministration++;
                        }
                        if (row["Department"].ToString() == "Excise & Taxation")
                        {

                            ExciseTaxation++;
                        }
                        if (row["Department"].ToString() == "Finance")
                        {

                            Finance++;
                        }
                        if (row["Department"].ToString() == "Food")
                        {

                            Food++;
                        }
                        if (row["Department"].ToString() == "Health")
                        {

                            Health++;
                        }
                        if (row["Department"].ToString() == "Higher Education")
                        {

                            HigherEducation++;
                        }
                        if (row["Department"].ToString() == "Home")
                        {

                            Home++;
                        }
                        if (row["Department"].ToString() == "Housing")
                        {

                            Housing++;
                        }
                        if (row["Department"].ToString() == "Industries")
                        {

                            Industries++;
                        }
                        if (row["Department"].ToString() == "Information")
                        {

                            Information++;
                        }
                        if (row["Department"].ToString() == "Labour")
                        {

                            Labour++;
                        }
                        if (row["Department"].ToString() == "Law & Justice")
                        {

                            LawJustice++;
                        }
                        if (row["Department"].ToString() == "Local Government")
                        {

                            LocalGovernment++;
                        }
                        if (row["Department"].ToString() == "Mines & Minerals")
                        {

                            MinesMinerals++;
                        }
                        if (row["Department"].ToString() == "MULTI SECTORAL DEVELOPMENT")
                        {

                            MULTISECTORALDEVELOPMENT++;
                        }
                        if (row["Department"].ToString() == "Population Welfare")
                        {

                            PopulationWelfare++;
                        }
                        if (row["Department"].ToString() == "Relief & Rehabilitation")
                        {

                            ReliefRehabilitation++;
                        }
                        if (row["Department"].ToString() == "Roads")
                        {

                            Roads++;
                        }
                        if (row["Department"].ToString() == "Social Welfare")
                        {

                            SocialWelfare++;
                        }
                        if (row["Department"].ToString() == "Special Initiatives")
                        {

                            SpecialInitiatives++;
                        }
                        if (row["Department"].ToString() == "Sports, Culture, Tourism, Archaeology & Youth Affairs")
                        {

                            SportsCulture++;
                        }
                        if (row["Department"].ToString() == "ST&IT")
                        {

                            STIT++;
                        }
                        if (row["Department"].ToString() == "Transport")
                        {

                            Transport++;
                        }
                        if (row["Department"].ToString() == "Urban Development")
                        {

                            UrbanDevelopment++;
                        }
                        if (row["Department"].ToString() == "Water")
                        {

                            Water++;
                        }
                 


                    }
                }
          

            //GridViewReferral.Attributes.Add("style", "word-break:break-all; word-wrap:break-word");

        }
        protected void lnkView_Click(object sender, EventArgs e)
        {
             string Id = (sender as LinkButton).CommandArgument;
            Response.Redirect(String.Format("ProjectReferralDetails.aspx?ReferralID={0}", Id));
        }
        protected void GridViewReferral_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType != DataControlRowType.DataRow)
            //{
            //    return;
            //}
            //var rowData = ((DataRowView)e.Row.DataItem).Row;
            //var lblImages = e.Row.FindControl("lblImages") as Label;
            //foreach (var image in rowData["Attachment"].ToString().Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries))
            //{
            //    var img = new Image();
            //    img.ImageUrl = this.ResolveClientUrl("~/Upload/" + image);
            //    img.Height=50;
            //    img.Width = 70;
            //    lblImages.Controls.Add(img);
            //}
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewReferral_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void GridViewReferral_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Chart1_Load(object sender, EventArgs e)
        {

        }
    }
}