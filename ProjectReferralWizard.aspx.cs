using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Project_refer
{
    public partial class ProjectReferralWizard : System.Web.UI.Page
    {
        SqlConnection conn = null;
        protected string toEmail, EmailSubj, EmailMsg;
        public static string Pass, FromEmailid, HostAdd;
        string ReferralID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TextBoxName.Text))
            {
                RequiredFieldValidatorName.ErrorMessage = "";
            }
            else if (!string.IsNullOrWhiteSpace(TextBoxDesgination.Text))
            {
                RequiredFieldValidatorDesgination.ErrorMessage = "";
            }
            else if (!string.IsNullOrWhiteSpace(TextBoxContactNo.Text))
            {
                RequiredFieldValidatorContactNo.ErrorMessage = "";
            }
            else if (!string.IsNullOrWhiteSpace(TextBoxApprentIssue.Text))
            {
                RequiredFieldValidatorApprentIssue.ErrorMessage = "";
            }
            else if (!string.IsNullOrWhiteSpace(TextBoxSubheadnameLocation.Text))
            {
                RequiredFieldValidatorSubheadnameLocation.ErrorMessage = "";
            }
            else if (!string.IsNullOrWhiteSpace(TextBoxComments.Text))
            {
                RequiredFieldValidatorComments.ErrorMessage = "";
            }

            LabelDepartment.Text = "Administration";
            LabelProjectCode.Text = "24932";
            LabelProjectName.Text = "BRT";
            File1.Attributes["multiple"] = "multiple";
            lblmsg.Text = "Only first three image will upload";
      

        }
      
        protected void TehsilList_DataBound(object sender, EventArgs e)
        {
            DropDownListTehsil.Items.Insert(0, new ListItem("--Select Tehsil--", "0"));
            DropDownListTehsil.SelectedIndex = 0;

        }
        protected void DistrictList_DataBound(object sender, EventArgs e)
        {
            DropDownListDistrict.Items.Insert(0, new ListItem("--Select District--", "0"));
            DropDownListDistrict.SelectedIndex = 0;

        }

        protected void DropDownListTehsil_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListTehsil.SelectedIndex >= 1)
            {
                LabelValidateTehsil.Text = "";


            }

        }


        public static void Email_Without_Attachment(String ToEmail, String Subj, string Message)
    {
        //Reading sender Email credential from web.config file
        HostAdd = ConfigurationManager.AppSettings["Host"].ToString();
        FromEmailid = ConfigurationManager.AppSettings["FromMail"].ToString();
        Pass = ConfigurationManager.AppSettings["Password"].ToString();

       //creating the object of MailMessage
        MailMessage mailMessage = new MailMessage();
        mailMessage.From = new MailAddress(FromEmailid); //From Email Id
        mailMessage.Subject = Subj; //Subject of Email
        mailMessage.Body = Message; //body or message of Email
        mailMessage.IsBodyHtml = true;
        //Adding Multiple recipient email id logic
       string[] Multi =ToEmail.Split(' '); //spiliting input Email id string with comma(|)
       foreach (string Multiemailid in Multi)
       {
           mailMessage.To.Add(new MailAddress(Multiemailid)); //adding multi reciver's Email Id
       }
        SmtpClient smtp = new SmtpClient(); // creating object of smptpclient
        smtp.Host = HostAdd; //host of emailaddress for example smtp.gmail.com etc

        //network and security related credentials
        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = mailMessage.From.Address;
        NetworkCred.Password = Pass;
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mailMessage); //sending Email
    }
            protected void btnsubmit_Click(object sender, EventArgs e)
        {

            if (DropDownListDistrict.SelectedIndex <= 0)
            {
                LabelValidateDistrict.Text = "Select District !!!";
                LabelValidateDistrict.ForeColor = System.Drawing.Color.Red;
                DropDownListDistrict.Focus();
            }

            else if (DropDownListTehsil.SelectedIndex <= 0)
            {
                LabelValidateTehsil.Text = "Select Tehsil !!!";
                LabelValidateTehsil.ForeColor = System.Drawing.Color.Red;
                DropDownListTehsil.Focus();
            }
            else if (string.IsNullOrWhiteSpace(TextBoxName.Text))
            {
                RequiredFieldValidatorName.ErrorMessage = "Enter Name !!!";
                TextBoxName.Focus();
            }
            else if (string.IsNullOrWhiteSpace(TextBoxDesgination.Text))
            {
                RequiredFieldValidatorDesgination.ErrorMessage = "Enter Designation !!!";
                TextBoxDesgination.Focus();
            }
            else if (string.IsNullOrWhiteSpace(TextBoxContactNo.Text))
            {
                RequiredFieldValidatorContactNo.ErrorMessage = "Enter Contact No !!!";
                TextBoxDesgination.Focus();
            }
            else if (string.IsNullOrWhiteSpace(TextBoxApprentIssue.Text))
            {
                RequiredFieldValidatorApprentIssue.ErrorMessage = "Enter Apprent Issue!!!";
                TextBoxApprentIssue.Focus();
            }
            else if (string.IsNullOrWhiteSpace(TextBoxComments.Text))
            {
                RequiredFieldValidatorComments.ErrorMessage = "Enter Comment!!!";
                TextBoxComments.Focus();
            }
            else if (string.IsNullOrWhiteSpace(TextBoxSubheadnameLocation.Text))
            {
                RequiredFieldValidatorSubheadnameLocation.ErrorMessage = "Enter SubHead Name & Location!!!";
                TextBoxSubheadnameLocation.Focus();
            }
            else
            {
                var images = new List<string>();
                int filelenght = Request.Files.Count;
                if (filelenght > 3)
                {
                    for (int i = 0; i < 3; i++)
                    {
                        HttpPostedFile fu = Request.Files[i];

                        if (fu.ContentLength > 0)
                        {

                            try
                            {
                                string fileName = Path.GetFileName(fu.FileName);
                                fu.SaveAs(Server.MapPath("~/Upload/") + fileName);
                                string imagePath = fileName;
                                images.Add(imagePath);
                                lblmsg.Text = "Files have been Uploaded";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                            }
                            catch (Exception ex)
                            {
                                lblmsg.Text = "File Could not be uploaded" + ex.Message;
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                            }

                        }

                    }
                }
                else
                {
                    for (int i = 0; i < Request.Files.Count; i++)
                    {
                        HttpPostedFile fu = Request.Files[i];
                        if (fu.ContentLength > 0)
                        {
                            try
                            {
                                string fileName = Path.GetFileName(fu.FileName);
                                fu.SaveAs(Server.MapPath("~/Upload/") + fileName);
                                string imagePath = fileName;
                                images.Add(imagePath);
                                lblmsg.Text = "Files have been Uploaded";
                                lblmsg.ForeColor = System.Drawing.Color.Green;
                            }
                            catch (Exception ex)
                            {
                                lblmsg.Text = "File Could not be uploaded" + ex.Message;
                                lblmsg.ForeColor = System.Drawing.Color.Red;
                            }
                        }

                    }
                }

                string[] authors = { "Agriculture", "AUQAF", "Board Revenue", "District ADP", "Drinking Water and Sanitation", "Elementary & Secondary Education", "Energy & Power", "Environment", "Establishment & Administration", "Excise & Taxation", "Finance", "Food", "Health", "Higher Education", "Home", "Housing", "Industries", "Information", "Labour", "Law & Justice", "Local Government", "Mines & Minerals", "MULTI SECTORAL DEVELOPMENT", "Population Welfare", "Relief & Rehabilitation", "Roads", "Social Welfare", "Special Initiatives", "Sports, Culture, Tourism, Archaeology & Youth Affairs", "ST&IT", "Transport", "Urban Development", "Water" };

                // Create a Random object  
                Random rand = new Random();
                // Generate a random index less than the size of the array.  
                int index = rand.Next(authors.Length);
                // Display the result.  
              string dep = authors[index].ToString();
                string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
                conn = new SqlConnection(ConnectionString);
                conn.Open();
                using (var sqlCommand = new SqlCommand())
                    {
                        sqlCommand.Connection = conn;
                        sqlCommand.CommandText = "INSERT INTO [dbo].[tblReferral] ([UserID],[ProjectCode],[Division],[District],[Tehsil],[Department],[SubHeadNameLocation],[ReferralDate],[Apparent_Issue],[Name],[Desgination],[Contact],[Email],[Comments] ,[Attachment])VALUES(@userid,@ProjectCode,@Division,@Distric,@Tehsil,@Department,@SubHeadNameLocation,@SendingDate,@Apparent_Issue,@Name,@Desgination,@Contact,@Email,@Comment,@Attachment);" + "select scope_identity();";
                        sqlCommand.CommandType = System.Data.CommandType.Text;
                        sqlCommand.Parameters.AddWithValue("@ProjectCode", Convert.ToInt32(TextBoxProjCode.Text.Trim()));
                        sqlCommand.Parameters.AddWithValue("@Division", TextBoxDivision.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@Distric", DropDownListDistrict.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@Tehsil", DropDownListTehsil.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@userid", 1223);
                        sqlCommand.Parameters.AddWithValue("@Department", dep);
                        sqlCommand.Parameters.AddWithValue("@SubHeadNameLocation", TextBoxSubheadnameLocation.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@SendingDate", DateTime.Now.ToShortDateString());
                        sqlCommand.Parameters.AddWithValue("@Apparent_Issue", TextBoxApprentIssue.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@Name", TextBoxName.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@Desgination", TextBoxDesgination.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@Contact", Convert.ToInt32(TextBoxContactNo.Text.Trim()));
                        sqlCommand.Parameters.AddWithValue("@Email", TextBoxAssignTo.Text);
                        sqlCommand.Parameters.AddWithValue("@SubHead", TextBoxSubheadnameLocation.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@Comment", TextBoxComments.Text.Trim());
                        sqlCommand.Parameters.AddWithValue("@Attachment", string.Join("|", images.ToArray()));
                        var Referralid = sqlCommand.ExecuteScalar();
                        //sqlCommand.ExecuteNonQuery();
                        conn.Close();
                        ReferralID = Referralid.ToString();
                }
                conn = new SqlConnection(ConnectionString);
                conn.Open();
                using (var sqlCommand2 = new SqlCommand())
                    {
                        sqlCommand2.Connection = conn;
                        sqlCommand2.CommandText = "INSERT INTO [dbo].[tblReferralNotification] ([UserID],[ReferralID],[Msg])VALUES(110,@referralid,@msg)";
                        sqlCommand2.CommandType = System.Data.CommandType.Text;
                        sqlCommand2.Parameters.AddWithValue("@referralid", ReferralID.ToString());
                        sqlCommand2.Parameters.AddWithValue("@msg", "Project Referral ");
                        sqlCommand2.ExecuteNonQuery();
                    }

                conn.Close();
                toEmail = TextBoxAssignTo.Text;
                EmailSubj = "Project Referral Notification";
                EmailMsg = "You have new Notication Check your Dashboard";
                //passing parameter to Email Method
                Email_Without_Attachment(toEmail, EmailSubj, EmailMsg);
                Labelnotif.Text = "<body onload=\"showContent()\"></body>";
                DropDownListDistrict.SelectedIndex = 0;
                TextBoxDivision.Text = "Division";
                TextBoxName.Text = "";
                TextBoxDesgination.Text = "";
                TextBoxContactNo.Text = "";
                TextBoxApprentIssue.Text = "";
                TextBoxComments.Text = "";
                TextBoxSubheadnameLocation.Text = "";
                TextBoxAssignTo.Text = "";
                
                //Server.Transfer("ProjectReferralWizard.aspx", false);



            }
        }
        protected void  DropDownListDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelValidateDistrict.Text = "";
            DropDownListTehsil.Items.Insert(0, new ListItem("--Select Tehsil--", "0"));
            DropDownListTehsil.SelectedIndex = 0;
            if ( DropDownListDistrict.SelectedItem.Text == "Bannu" || DropDownListDistrict.SelectedItem.Text == "Lakki Marwat"
                || DropDownListDistrict.SelectedItem.Text == "North Waziristan")
            {
                TextBoxDivision.Text="Bannu";
            }
            if ( DropDownListDistrict.SelectedItem.Text == "D.I.Khan" || DropDownListDistrict.SelectedItem.Text == "Tank"
                || DropDownListDistrict.SelectedItem.Text == "South Waziristan")
            {
                TextBoxDivision.Text= "D.I.Khan";
            }
            if ( DropDownListDistrict.SelectedItem.Text == "Abbottabad" || DropDownListDistrict.SelectedItem.Text == "Battagram"
                || DropDownListDistrict.SelectedItem.Text == "Haripur" || DropDownListDistrict.SelectedItem.Text == "Kohistan (Lower)"
                || DropDownListDistrict.SelectedItem.Text == "Kolai Palas Kohistan" || DropDownListDistrict.SelectedItem.Text == "Mansehra"  
                || DropDownListDistrict.SelectedItem.Text == "Torghar" || DropDownListDistrict.SelectedItem.Text == "Kohistan (Upper)")
            {
                TextBoxDivision.Text= "Hazara";
            }
            if ( DropDownListDistrict.SelectedItem.Text == "Hangu" || DropDownListDistrict.SelectedItem.Text == "Karak"
                || DropDownListDistrict.SelectedItem.Text == "Kohat" || DropDownListDistrict.SelectedItem.Text == "Khuram"
                || DropDownListDistrict.SelectedItem.Text == "Orakzai")
            {
                TextBoxDivision.Text= "Kohat";
            }
            if ( DropDownListDistrict.SelectedItem.Text == "Lower Chitral" || DropDownListDistrict.SelectedItem.Text == "Lower Dir"
                || DropDownListDistrict.SelectedItem.Text == "Malakand" || DropDownListDistrict.SelectedItem.Text == "Swat"
                || DropDownListDistrict.SelectedItem.Text == "Upper Chitral"|| DropDownListDistrict.SelectedItem.Text == "Upper Dir"
                || DropDownListDistrict.SelectedItem.Text == "Bajaur"|| DropDownListDistrict.SelectedItem.Text == "Buner")
            {
                TextBoxDivision.Text= "Malakand";
            }
            if ( DropDownListDistrict.SelectedItem.Text == "Mardan" || DropDownListDistrict.SelectedItem.Text == "Swabi")
            {
                TextBoxDivision.Text= "Mardan";
            }


            if ( DropDownListDistrict.SelectedItem.Text == "Peshawar" || DropDownListDistrict.SelectedItem.Text == "Charsadda"
                || DropDownListDistrict.SelectedItem.Text == "Nowshera" || DropDownListDistrict.SelectedItem.Text == "Khyber"
                || DropDownListDistrict.SelectedItem.Text == "Mohmand")
            {
                TextBoxDivision.Text= "Peshawar";
            }
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
            //    img.Height = 50;
            //    img.Width = 70;
            //    lblImages.Controls.Add(img);
            //}
        }

    }
}