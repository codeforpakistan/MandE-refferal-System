<%@ Page Title="DashBoard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectReferralWizard.aspx.cs" Inherits="Project_refer.ProjectReferralWizard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
   
    <style>
    .text-center th {
        text-align: center;
    }
            .style1
        {
            width: 258px;
        }
        .style2
        {
            width: 168px;
        }
        .style3
        {
            text-decoration: underline;
            text-align: left;
            color: #9966FF;
        }
   .pulse{
         animation-name: color;
  animation-duration: 2s;
  animation-iteration-count: infinite;
   }
   @keyframes color {
  0% {
    color: white;
  }
  50% {
    color: #e59292;
  }
  100% {
    color: red;
  }
}
</style>
<form id="form1" runat="server">
  
         <!--Multi Step Wizard Start-->
   <div id="rms-wizard" class="rms-wizard">
   <!--Wizard Container-->
    <div class="rms-container">
       <!--Wizard Header-->
        <div class="rms-wizard-header">
            <h2 class="title">Project Referral</h2>
        </div>
        <!--Wizard Header Close--> 
        <div class="rms-form-wizard">
           <!--Wizard Step Navigation Start-->
            <div class="rms-step-section" data-step-counter="false" data-step-image="false">
                <ul class="rms-multistep-progressbar"> 
                    <li class="rms-step rms-current-step">
                        <span class="step-icon"><i class="fa fa-globe" aria-hidden="true"></i></span>
                        <span class="step-title">Location</span>
                        <span class="step-info">select Location </span>
                    </li> 
                    <li class="rms-step ">
                        <span class="step-icon ml10"><i class="fa fa-credit-card" aria-hidden="true"></i></span>
                        <span class="step-title">Referral By</span>
                        <span class="step-info">Enter Information</span>
                    </li>
                    <li class="rms-step ">
                        <span class="step-icon"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                        <span class="step-title">Attachment</span>
                        <span class="step-info">Upload Images </span>
                    </li>
                     <li class="rms-step ">
                        <span class="step-icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                        <span class="step-title">Assign TO</span>
                        <span class="step-info">Information about project</span>
                    </li>
                    <li class="rms-step ">
                        <span class="step-icon"><i class="fa fa-file-text" aria-hidden="true"></i></span>
                        <span class="step-title">Finish</span>
                        <span class="step-info">Review Form</span>
                    </li>
                </ul>
            </div>
            <!--Wizard Navigation Close-->
            <!--Wizard Content Section Start-->
            <div class="rms-content-section">
                <div class="rms-content-box rms-current-section">
                    <div class="rms-content-area"> 
                        <div class="rms-content-title">
                            <div class="leftside-title"><b> <i class="fa fa-globe" aria-hidden="true"></i> Location</b> </div>
                            <div class="step-label">Step 1 - 5</div>
                        </div>
                        <div class="rms-content-body"> 
                            <div class="row">
                                <div class="col-md-8">
                            <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Select District</label>
                                            <div class="inpt-group">
                                                 <asp:DropDownList ID="DropDownListDistrict" class="form-control" runat="server" OnDataBound="DistrictList_DataBound" AutoPostBack="True" DataSourceID="SqlDataSourceDistrict" DataTextField="District" DataValueField="District" OnSelectedIndexChanged="DropDownListDistrict_SelectedIndexChanged" >
<%--                                                 <asp:ListItem Selected="True">Select District</asp:ListItem>--%>
                                                 </asp:DropDownList>
                                                <asp:Label ID="LabelValidateDistrict" runat="server" ></asp:Label>
                                                 <asp:SqlDataSource ID="SqlDataSourceDistrict" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [District] FROM [tblDistrict]"></asp:SqlDataSource>
                                             </div>
                                            </div>
                                        </div>
                                    </div>
                                       <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Division</label>
                                            <div class="inpt-group"> 
                                               <asp:TextBox ID="TextBoxDivision" class="form-control"  runat="server" ReadOnly="True" >Division</asp:TextBox> 
                                           <%--     <asp:DropDownList ID="DropDownListDivision" class="form-control"   ReadOnly="True" runat="server" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged">
                                                 </asp:DropDownList>--%>    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Select Tehsil</label>
                                            <div class="inpt-group">
                                                 <asp:DropDownList ID="DropDownListTehsil" class="form-control" runat="server" OnDataBound="TehsilList_DataBound"  DataSourceID="SqlDataSourceTehsil" DataTextField="Tehsil" DataValueField="Tehsil" OnSelectedIndexChanged="DropDownListTehsil_SelectedIndexChanged" >
                                                 </asp:DropDownList>    
                                                  <asp:Label ID="LabelValidateTehsil" runat="server" ></asp:Label>
                                                 <asp:SqlDataSource ID="SqlDataSourceTehsil" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Tehsil] FROM [tblTehsil] WHERE ([District] = @District)">
                                                     <SelectParameters>
                                                         <asp:ControlParameter ControlID="DropDownListDistrict" Name="District" PropertyName="SelectedValue" Type="String" />
                                                     </SelectParameters>
                                                 </asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                   <%-- <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Enter village council</label>
                                            <div class="inpt-group">--%>
                                                 <asp:DropDownList ID="DropDownListvillagecouncil" class="form-control" runat="server" Visible="False">
                                                 <asp:ListItem Selected="True">Select village council</asp:ListItem>
                                                 </asp:DropDownList>
                                             <%--   </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                   <%-- <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Select Department</label>
                                            <div class="inpt-group">--%>
                                                <asp:DropDownList ID="DropDownListDepartment" class="form-control" runat="server" Visible="False">
                                                 <asp:ListItem Selected="True">Select Department</asp:ListItem>
                                                 <asp:ListItem>Administration</asp:ListItem>
                                                 <asp:ListItem>Energy & Power</asp:ListItem>
                                                 <asp:ListItem>Housing</asp:ListItem>
                                                 <asp:ListItem>Minerals Development</asp:ListItem>
                                                 <asp:ListItem>Agriculture</asp:ListItem>
                                                 <asp:ListItem>Environment</asp:ListItem>
                                                 <asp:ListItem>Industries</asp:ListItem>
                                                 <asp:ListItem>Planning & Development</asp:ListItem>
                                                 <asp:ListItem>Auqaf</asp:ListItem>
                                                 <asp:ListItem>Excise & Taxation</asp:ListItem>
                                                 <asp:ListItem>Information</asp:ListItem>
                                                 <asp:ListItem>Communication & Works</asp:ListItem>
                                                 <asp:ListItem>Finance</asp:ListItem>
                                                  <asp:ListItem>Irrigation</asp:ListItem>
                                                  <asp:ListItem>Sports & Tourism</asp:ListItem>
                                                  <asp:ListItem>Elementary & Secondary Education</asp:ListItem>
                                                  <asp:ListItem>Food</asp:ListItem>
                                                  <asp:ListItem>Law</asp:ListItem>
                                                  <asp:ListItem>Transport</asp:ListItem>
                                                  <asp:ListItem>Health</asp:ListItem>
                                                  <asp:ListItem>Local Government</asp:ListItem>
                                                  <asp:ListItem>Zakat & Ushr</asp:ListItem>
                                                  </asp:DropDownList>  
                                                  <asp:Label ID="LabelListDepartment" runat="server" ></asp:Label>
                                              <%--  </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                    
                                </div> 
                            </div> 
                        </div> 
                    </div>
                </div>
                <div class="rms-content-box">
                     <div class="rms-content-area">
                        <div class="rms-content-title">
                            <div class="leftside-title"><b> <i class="fa fa-credit-card" aria-hidden="true"></i> Referral By</b></div>
                            <div class="step-label">Step 3 - 5</div>
                           
                        </div>
                        <div class="rms-content-body"> 
                            <div class="row">
                                <div class="col-md-8">
                               <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Name</label>
                                            <div class="inpt-group">
                                                   <asp:TextBox ID="TextBoxName" class="form-control" placeholder="Enter Name"  runat="server"></asp:TextBox>        
                                                  <asp:RequiredFieldValidator id="RequiredFieldValidatorName" runat="server" SetFocusOnError="true" ControlToValidate="TextBoxName"
                                                    ErrorMessage="Name is required field."  ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                      <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Desgination</label>
                                            <div class="inpt-group">
                                                   <asp:TextBox ID="TextBoxDesgination" class="form-control" placeholder="Enter Desgination"  runat="server"></asp:TextBox>            
                                                  <asp:RequiredFieldValidator id="RequiredFieldValidatorDesgination" runat="server" SetFocusOnError="true" ControlToValidate="TextBoxDesgination"
                                                    ErrorMessage="Desgination is required field."  ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                      <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Contact No</label>
                                            <div class="inpt-group">
                                                 <asp:TextBox ID="TextBoxContactNo" class="form-control" placeholder="Enter Contact Number"  runat="server" ></asp:TextBox>          
                                                 <asp:RequiredFieldValidator id="RequiredFieldValidatorContactNo" runat="server"  ControlToValidate="TextBoxContactNo"
                                                    ErrorMessage="Contact No is required field."  ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorContactNo" runat="server" ErrorMessage="Enter valid Phone number" 
                                                    ControlToValidate="TextBoxContactNo" ForeColor="Red" ValidationExpression= "^([0-9\(\)\/\+ \-]*)$"></asp:RegularExpressionValidator>
                                               
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Apparent Issue</label>
                                            <div class="inpt-group">
                                                 <asp:TextBox ID="TextBoxApprentIssue"  runat="server" TextMode="MultiLine"  placeholder="Enter ..." style="width: 100%; Height:61px; "  ></asp:TextBox>       
                                                     <asp:RequiredFieldValidator id="RequiredFieldValidatorApprentIssue" runat="server"  ControlToValidate="TextBoxApprentIssue"
                                                    ErrorMessage="Apparent Issue is required field." SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div> 
                        </div> 
                    </div> 
                </div>
                <div class="rms-content-box">
                    <div class="rms-content-area">
                       <div class="rms-content-title">
                           <div class="leftside-title"><b> <i class="fa fa-paperclip" aria-hidden="true"></i> Attachment</b></div>
                           <div class="step-label">Step 4 - 5 </div>
                       </div>
                       <div class="rms-content-body"> 
                           <div class="row">
                               <div class="col-md-8">
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="style1">
                                             <asp:FileUpload   id="File1"  accept="image/*"  runat="server" />

                                            </td>
                                            <td>
                                                <asp:Label ID="lblmsg" class="pulse"  runat="server" ></asp:Label>
                                            </td>
                                        </tr>
                                     </table>
                                    <div id="showimage">
                                    </div>
                               </div> 
                           </div> 
                       </div> 
                   </div> 
               </div>
                                <div class="rms-content-box">
                     <div class="rms-content-area">
                        <div class="rms-content-title">
                            <div class="leftside-title"><b> <i class="fa fa-user" aria-hidden="true"></i> Assign To</b></div>
                            <div class="step-label">Step 2 - 5</div> 
                        </div>
                         <div class="rms-content-body"> 
                             <div class="row">
                                 <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">AssignTo</label>
                                            <div class="inpt-group">
                                                 <asp:TextBox ID="TextBoxAssignTo" class="form-control" runat="server" ReadOnly="True">asadkhan27536@gmail.com</asp:TextBox>  
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                  <%--  <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Project Code</label>
                                            <div class="inpt-group">--%>
                                                 <asp:TextBox ID="TextBoxProjCode" class="form-control" Visible="False"   runat="server" ReadOnly="True" >2468</asp:TextBox> 
                                               <%--  <asp:Label ID="Labelprojcode" runat="server"  Visible="False"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Project Name</label>
                                            <div class="inpt-group">--%>
                                                 <asp:TextBox ID="TextBoxProjName" class="form-control" Visible="False"  runat="server" ReadOnly="True" >BRT Bus</asp:TextBox>             
                                           <%--     </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                       <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">Comments/approval Of The Secretary of government Khyber Pakhtunkhwa</label>
                                            <div class="inpt-group">
                                                 <asp:TextBox ID="TextBoxComments"  runat="server" TextMode="MultiLine"  placeholder="Enter ..." style="width: 100%; Height:61px; "  ></asp:TextBox>       
                                              <asp:RequiredFieldValidator id="RequiredFieldValidatorComments" runat="server"  SetFocusOnError="true" ControlToValidate="TextBoxComments"
                                                    ErrorMessage="Comment is required field."  ForeColor="Red"></asp:RequiredFieldValidator>    
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                      <div class="row">
                                        <div class="col-md-12">
                                            <div class="inpt-form-group"> 
                                                <label for="username">SubHead Name and Location</label>
                                            <div class="inpt-group">
                                                 <asp:TextBox ID="TextBoxSubheadnameLocation" class="form-control"   runat="server"  ></asp:TextBox>  
                                                  <asp:RequiredFieldValidator id="RequiredFieldValidatorSubheadnameLocation" runat="server"  ControlToValidate="TextBoxSubheadnameLocation"
                                                    ErrorMessage="SubHead Name and Location is required field." SetFocusOnError="true"  ForeColor="Red"></asp:RequiredFieldValidator> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                             </div> 
                        </div> 
                    </div> 
                </div>
                <div class="rms-content-box">
                    <div class="rms-content-area">
                        <div class="rms-content-title">
                            <div class="leftside-title"><b> <i class="fa fa-file-text" aria-hidden="true"></i> Confirm</b> Details</div>
                            <div class="step-label">Step 5 - 5</div> 
                        </div>
                        <div class="rms-content-body"> 
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="desc-container">
                                                <div class="desc-table">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="desc-label">Division</td>
                                                                <td class="desc-val">
                                                                <asp:Label ID="LabelDivision" runat="server"  ></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="desc-label">Distric</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelDistrict" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="desc-label">Tehsil</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelTehsil" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr> 
                                                           <%-- <tr>
                                                                <td class="desc-label">village council</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelVC" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>--%>
                                                            <tr>
                                                                <td class="desc-label">Department</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelDepartment" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="desc-label">AssignTO</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelAssignTo" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="desc-label">ProjectCode</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelProjectCode" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="desc-label">Project Name</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelProjectName" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                                <td class="desc-label">Comments/approval Of The Secretary of government Khyber Pakhtunkhwa</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelComment" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="desc-label">SubHead Name & Location</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelSubHead" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="desc-label">Name</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelName" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="desc-label">Designation</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelDesignation" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="desc-label">Contact</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelContact" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="desc-label">Apparent Issue</td>
                                                                <td class="desc-val">
                                                                    <asp:Label ID="LabelApparentIssue" runat="server"  ></asp:Label>
                                                                </td>
                                                            </tr> 
                                                            <tr>
                                                                <td class="desc-label">Attachemnt</td>
                                                                <td class="desc-val">
                                                                   <div id="dvPreview">

                                                                   </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div> 
                            </div> 
                        </div> 
                    </div> 
                </div>
            </div>
            <!--Wizard Content Section Close-->
            <!--Wizard Footer section Start-->
            <div class="rms-footer-section" style="left: 0px; top: 0px">
                <div class="button-section">
                    <span class="next">
                        <a href="javascript:void(0)" onclick="show()" id="summary"  class="btn">Next Step
                            <small>Your information</small>
                        </a>
                    </span>
                    <span class="prev">
                        <a href="javascript:void(0)"  class="btn" >Previous Step
                             <small>Your information</small>
                        </a>
                    </span>
                    <span class="submit">
                        <a href="javascript:void(0)" class="btn" onServerClick="btnsubmit_Click"   runat="server" >Submit
                             <small>Your information</small>
                        </a>
                    </span> 

                </div>
            </div>
            <!--Wizard Footer Close-->
        </div>
    </div>
    <!--Wizard Container Close-->
    </div>
    <!--Multi Step Wizard Close-->  
  
 <asp:Label ID="Labelnotif" runat="server"></asp:Label>
    </form>
         


    <script src="/Scripts/jquery-3.3.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#MainContent_File1").change(function () {
              var previewimages = $("#showimage");
              previewimages.html("");
                $($(this)[0].files).each(function () {
                         var file = $(this);
                         var reader = new FileReader();
                 reader.onload = function (e) {
                         var img = $("<img />");
                         img.attr("style", "height:150px;width: 150px;");
                         img.attr("src", e.target.result);
                         previewimages.append(img);

                 }

                    reader.readAsDataURL(file[0]);
                });
                  var previewimages2 = $("#dvPreview");
                   previewimages2.html("");
                $($(this)[0].files).each(function () {
                         var file = $(this);
                         var reader = new FileReader();
                         reader.onload = function (e) {
                          var img = $("<img />");
                          img.attr("style", "height:100px;width: 100px;");
                           img.attr("src", e.target.result);
                            previewimages2.append(img);
                         }
                            reader.readAsDataURL(file[0]);
                });
            });
        });
    </script>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <script>
        function showContent() {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "progressBar": true,
                "preventDuplicates": false,
                "positionClass": "toast-top-right",
                "showDuration": "400",
                "hideDuration": "1000",
                "timeOut": "7000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr["success"]("Submit Successfully");

        }
    </script>
   <script  type ="text/javascript" >
       var cnt=0;
        function show() {
            cnt = parseInt(cnt) + parseInt(1);
            console.log(cnt);
            if (cnt ==4) {
                var div = document.getElementById('<%=TextBoxDivision.ClientID%>').value;
                var dis = document.getElementById('<%=DropDownListDistrict.ClientID%>').value;
                var teh = document.getElementById('<%=DropDownListTehsil.ClientID%>').value;
<%--                var vc = document.getElementById('<%=DropDownListvillagecouncil.ClientID%>').value;--%>
<%--                var dep = document.getElementById('<%=DropDownListDepartment.ClientID%>').value;--%>
                var ass = document.getElementById('<%=TextBoxAssignTo.ClientID%>').value;
<%--                var projcode = document.getElementById('<%=TextBoxProjCode.ClientID%>').value;--%>
<%--                var projname = document.getElementById('<%=TextBoxProjName.ClientID%>').value;--%>
                var comment = document.getElementById('<%=TextBoxComments.ClientID%>').value;
                var SubHead = document.getElementById('<%=TextBoxSubheadnameLocation.ClientID%>').value;
                var name = document.getElementById('<%=TextBoxName.ClientID%>').value;
                var desg = document.getElementById('<%=TextBoxDesgination.ClientID%>').value;
                var con = document.getElementById('<%=TextBoxContactNo.ClientID%>').value;
                var ap = document.getElementById('<%=TextBoxApprentIssue.ClientID%>').value;

                document.getElementById('<%=LabelDivision.ClientID %>').innerHTML = div;
                document.getElementById('<%=LabelDistrict.ClientID %>').innerHTML = dis;
                document.getElementById('<%=LabelTehsil.ClientID %>').innerHTML = teh;
<%--                document.getElementById('<%=LabelVC.ClientID %>').innerHTML = vc;--%>
<%--                document.getElementById('<%=LabelDepartment.ClientID %>').innerHTML = dep;--%>
                document.getElementById('<%=LabelAssignTo.ClientID %>').innerHTML = ass;
<%--                document.getElementById('<%=LabelProjectCode.ClientID %>').innerHTML = projcode;--%>
<%--                document.getElementById('<%=LabelProjectName.ClientID %>').innerHTML = projname;--%>
                document.getElementById('<%=LabelComment.ClientID %>').innerHTML = comment;
                document.getElementById('<%=LabelSubHead.ClientID %>').innerHTML = SubHead;
                document.getElementById('<%=LabelName.ClientID %>').innerHTML = name;
                document.getElementById('<%=LabelDesignation.ClientID %>').innerHTML = desg;
                document.getElementById('<%=LabelContact.ClientID %>').innerHTML = con;
                document.getElementById('<%=LabelApparentIssue.ClientID %>').innerHTML = ap;
               

                //var dvPreview = document.getElementById("dvPreview");
                //var loop = sessionStorage.getItem("ImgPath" + i);
                //for (var i = 0; i < loop; i++) {
                //    var img = document.createElement("IMG");
                //    img.height = "100";
                //    img.width = "100";
                //    img.src = sessionStorage.getItem("ImgPath" + i);
                //    dvPreview.appendChild(img);
                //}

            }
       }

</script>
</asp:Content>


                                       