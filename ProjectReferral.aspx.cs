using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_refer
{
    public partial class ProjectReferral : Page
    {
        string PicPath;
        protected void Page_Load(object sender, EventArgs e)
        {
   
            if (Session["ImagePath"] != null)
            {
                
                PicPath =Session["ImagePath"].ToString();
            }
            if (!IsPostBack)
            {
                AddDefaultFirstRecord();
            }
        }
        private void AddDefaultFirstRecord()
        {

            //creating dataTable   
            DataTable dt = new DataTable();
            DataRow dr;
            dt.TableName = "ProjectReferral";
            dt.Columns.Add(new DataColumn("ADPNO", typeof(int)));
            dt.Columns.Add(new DataColumn("ProjectCode", typeof(int)));
            dt.Columns.Add(new DataColumn("ProjectName", typeof(string)));
            dt.Columns.Add(new DataColumn("AssignTo", typeof(string)));
            dt.Columns.Add(new DataColumn("ReferralName", typeof(string)));
            dt.Columns.Add(new DataColumn("ReferralDesignation", typeof(string)));
            dt.Columns.Add(new DataColumn("ReferralContact", typeof(int)));
            dt.Columns.Add(new DataColumn("ApparentIssue", typeof(string)));
            dt.Columns.Add(new DataColumn("Attachment", typeof(string)));
            dr = dt.NewRow();
            dt.Rows.Add(dr);
            //saving databale into viewstate   
            ViewState["ProjectReferral"] = dt;
            GridViewReferral.AutoGenerateColumns = true;
            //bind Gridview  
            GridViewReferral.DataSource = dt;
            GridViewReferral.DataBind();
        }
        private void AddNewRecordRowToGrid()
        {
            // check view state is not null  
            if (ViewState["ProjectReferral"] != null)
            {
                //get datatable from view state   
                DataTable dtCurrentTable = (DataTable)ViewState["ProjectReferral"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {

                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        
                        //add each row into data table  
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["ADPNO"] = Convert.ToInt32(TextBoxadpno.Text);
                        drCurrentRow["ProjectCode"] = Convert.ToInt32(TextBoxProjCode.Text);
                        drCurrentRow["ProjectName"] = TextBoxProjName.Text;
                        drCurrentRow["AssignTo"] = TextBoxAssignTo.Text;
                        drCurrentRow["ReferralName"] = TextBoxName.Text;
                        drCurrentRow["ReferralDesignation"] = TextBoxDesgination.Text;
                        drCurrentRow["ReferralContact"] = Convert.ToInt32(TextBoxContactNo.Text);
                        drCurrentRow["ApparentIssue"] = TextBoxApprentIssue.Text;
                        drCurrentRow["Attachment"] = PicPath;


                    }
                    //Remove initial blank row  
                    if (dtCurrentTable.Rows[0][0].ToString() == "")
                    {
                        dtCurrentTable.Rows[0].Delete();
                        dtCurrentTable.AcceptChanges();

                    }

                    //add created Rows into dataTable  
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //Save Data table into view state after creating each row  
                    ViewState["ProjectReferral"] = dtCurrentTable;
                    //Bind Gridview with latest Row  
                    GridViewReferral.DataSource = dtCurrentTable;
                    GridViewReferral.DataBind();
                    Labelrecordno.Text = dtCurrentTable.Rows.Count.ToString();

                }
            }
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            AddNewRecordRowToGrid();
            //bool _Status = false;
            //string _StatusDetails = null;
            //string refertype = "";
            //string referdetails ="";
            //string decision = "NO";
            //string purpose = "";

            //int referralBYID = 12;
            //DbOperation.tblReferral_Create(refertype, referdetails, decision, DateTime.Now.Date,
            //    DateTime.Now.Date, DateTime.Now.Date, purpose, Convert.ToInt32(TextBoxProjCode.Text), Convert.ToInt32(TextBoxProjCode.Text), referralBYID,
            //   referralBYID, DateTime.Now.Date, out _Status, out _StatusDetails);
            //if (_Status)
            //{

            //}
        }

        protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownListDivision.SelectedItem.Text== "Bannu Division")
            {

                DropDownListDistric.Items.Clear();
                DropDownListDistric.Items.Add("Select District");
                //DropDownListTehsil.Items.Clear();
                //DropDownListTehsil.Items.Add("Select Tehsil");
                //DropDownListTehsil.Items.Add("Select Tehsil");
                DropDownListDistric.Items.Add("Bannu District");
            DropDownListDistric.Items.Add("Lakki Marwat District");


            }
            if (DropDownListDivision.SelectedItem.Text == "Dera Ismail Khan Division")
            {
                DropDownListDistric.Items.Clear();
                DropDownListDistric.Items.Add("Select District");
                //DropDownListTehsil.Items.Clear();
                //DropDownListTehsil.Items.Add("Select Tehsil");
                DropDownListDistric.Items.Add("Dera Ismail Khan District");
                DropDownListDistric.Items.Add("Tank District");
                DropDownListDistric.Items.Add("South Waziristan District");


            }
            if (DropDownListDivision.SelectedItem.Text == "Hazara Division")
            {
                DropDownListDistric.Items.Clear();
                DropDownListDistric.Items.Add("Select District");
                //DropDownListTehsil.Items.Clear();
                //DropDownListTehsil.Items.Add("Select Tehsil");
                DropDownListDistric.Items.Add("Abbottabad District");
                DropDownListDistric.Items.Add("Battagram District");
                DropDownListDistric.Items.Add("Haripur District");
                DropDownListDistric.Items.Add("Upper Kohistan District");
                DropDownListDistric.Items.Add("Lower Kohistan District");
                DropDownListDistric.Items.Add("Mansehra District");
                DropDownListDistric.Items.Add("Torghar District");


            }
            if (DropDownListDivision.SelectedItem.Text == "Kohat Division")
            {
                DropDownListDistric.Items.Clear();
                DropDownListDistric.Items.Add("Select District");
                //DropDownListTehsil.Items.Clear();
                //DropDownListTehsil.Items.Add("Select Tehsil");
                DropDownListDistric.Items.Add("Hangu District");
                DropDownListDistric.Items.Add("Karak District");
                DropDownListDistric.Items.Add("Kohat District");

            }
         
            if (DropDownListDivision.SelectedItem.Text == "Malakand Division")
            {
                DropDownListDistric.Items.Clear();
                DropDownListDistric.Items.Add("Select District");
                //DropDownListTehsil.Items.Clear();
                //DropDownListTehsil.Items.Add("Select Tehsil");
                DropDownListDistric.Items.Add("Buner District");
                DropDownListDistric.Items.Add("Upper Chitral District");
                DropDownListDistric.Items.Add("Lower Chitral District");
                DropDownListDistric.Items.Add("Malakand District");
                DropDownListDistric.Items.Add("Lower Dir District");
                DropDownListDistric.Items.Add("Upper Dir District");
                DropDownListDistric.Items.Add("Shangla District");
                DropDownListDistric.Items.Add("Swat District");


            }
            if (DropDownListDivision.SelectedItem.Text == "Mardan Division")
            {
                DropDownListDistric.Items.Clear();
                DropDownListDistric.Items.Add("Select District");
                //DropDownListTehsil.Items.Clear();
                //DropDownListTehsil.Items.Add("Select Tehsil");
                DropDownListDistric.Items.Add("Mardan District");
                DropDownListDistric.Items.Add("Swabi District");
            }
        
            if (DropDownListDivision.SelectedItem.Text == "Peshawar Division")
            {
                DropDownListDistric.Items.Clear();
                DropDownListDistric.Items.Add("Select District");
                //DropDownListTehsil.Items.Clear();
                //DropDownListTehsil.Items.Add("Select Tehsil");
                DropDownListDistric.Items.Add("Charsadda District");
                DropDownListDistric.Items.Add("Peshawar District");
                DropDownListDistric.Items.Add("Nowshera District");
                DropDownListDistric.Items.Add("Mohmand District");
                DropDownListDistric.Items.Add("Khyber District");
                DropDownListDistric.Items.Add("Bajaur District");
                DropDownListDistric.Items.Add("Orakzai District");
                DropDownListDistric.Items.Add("Kurram District");
                DropDownListDistric.Items.Add("North waziristan District");

            }
           

        }


        protected void DropDownListTehsil_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void GridViewReferral_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}