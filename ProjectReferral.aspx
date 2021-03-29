<%@ Page Title="DashBoard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectReferral.aspx.cs" Inherits="Project_refer.ProjectReferral" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       <style>
    .text-center th {
        text-align: center;
    }
</style>
    <div class="panel panel-default">
                        <div class="panel-heading" style="color: white;
    background-color: #669933;
    border-color: #ddd;">
                           Refer to
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form id="form1" runat="server">
                                        <div class="form-group">
                                        <div class="form-group">      
                                            <label>Location</label>       
                                                              <div class="box-footer">
                                                                  </div>
          
              <div class="row">
                <div class="col-xs-4">
                     <asp:DropDownList ID="DropDownListDivision" class="form-control" runat="server" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Selected="True">Select Division</asp:ListItem>
                <asp:ListItem>Bannu Division</asp:ListItem>
                 <asp:ListItem>Dera Ismail Khan Division</asp:ListItem>
                 <asp:ListItem>Hazara Division</asp:ListItem>
                 <asp:ListItem>Kohat Division</asp:ListItem>
                 <asp:ListItem>Malakand Division</asp:ListItem>
                 <asp:ListItem>Peshawar Division</asp:ListItem>
                 <asp:ListItem>Mardan Division</asp:ListItem>
                   </asp:DropDownList>    
                </div>
                <div class="col-xs-4">
                  <asp:DropDownList ID="DropDownListDistric" class="form-control" runat="server" AutoPostBack="True" >
                    <asp:ListItem Selected="True">Select Distric</asp:ListItem>
                   </asp:DropDownList>  
                </div>
                <div class="col-xs-4">
                                                  <asp:TextBox ID="TextBoxTehsil" placeholder="Enter Tehsil"  class="form-control" runat="server" ></asp:TextBox>  
                </div>
              </div>
                                            </div>
                                         <div class="form-group">
                  <label>Department</label>
                                              <div class="row">
                <div class="col-xs-6">
                      <asp:DropDownList ID="DropDownListDepartment" class="form-control" runat="server">
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
                    </div>
                                                  </div>
                    </div>
                                                    <div class="form-group">
                  <label>Assign TO</label>
                 <div class="row">
                <div class="col-xs-6">
                           <asp:TextBox ID="TextBoxAssignTo" class="form-control" runat="server" ReadOnly="True">Example@yahoo.com</asp:TextBox>  
                    </div>
     </div>
                            </div>   
  <div class="form-group">
                  <label>ADP NO</label>
       <div class="row">
                <div class="col-xs-6">
                    <asp:TextBox ID="TextBoxadpno" class="form-control"   runat="server" ReadOnly="True" >112233</asp:TextBox>  
                    </div>       
           </div>
           </div>
                <!-- text input -->
                <div class="form-group">
                  <label>Project Code</label>
                     <div class="row">
                <div class="col-xs-6">
                    <asp:TextBox ID="TextBoxProjCode" class="form-control"  runat="server" ReadOnly="True" >2468</asp:TextBox>  
                   </div>
                         </div>
                    </div>
                    <div class="form-group">
                  <label>Project Name</label>
                     <div class="row">
                <div class="col-xs-6">
                    <asp:TextBox ID="TextBoxProjName" class="form-control"   runat="server" ReadOnly="True" >BRT Bus</asp:TextBox>  
                   </div>
                         </div>
                    </div> 

                                        </div>
                    <div class="form-group">
                                                <label for="username">SubHead Name and Location</label>
                     <div class="row">
                <div class="col-xs-6">
                    <asp:TextBox ID="TextBoxsubheadnameandLocation" class="form-control"   runat="server"  ></asp:TextBox>  
                   </div>
                         </div>
                    </div>

                                        <div class="form-group">
                  <label>Referral BY</label>
  <div class="row">
                <div class="col-xs-3">
                    <asp:TextBox ID="TextBoxName" class="form-control" placeholder="Enter Name"  runat="server"></asp:TextBox>  
                </div>
                <div class="col-xs-4">
                    <asp:TextBox ID="TextBoxDesgination" class="form-control" placeholder="Enter Desgination"  runat="server"></asp:TextBox>  
                </div>
                <div class="col-xs-5">
                    <asp:TextBox ID="TextBoxContactNo" class="form-control" placeholder="Enter Contact Number"  runat="server"></asp:TextBox>  
                </div>
              </div>                  </div>
             
                <!-- textarea -->
                <div class="form-group">
                 
                  <label>Apparent Issue</label>
                     <div class="row">
                <div class="col-xs-12">
                    <asp:TextBox ID="TextBoxApprentIssue" runat="server" TextMode="MultiLine"  placeholder="Enter ..." style="width: 100%; Height:61px; "></asp:TextBox>
                    </div>
                         </div>

                </div>
               <div class="form-group">
                  <label>Attachment </label>
 <iframe id="uploadFrame" frameborder="0" scrolling="no" src="ImageUpload.aspx" style="width: 1050px; height: 138px">
                                                        </iframe>             </div>
                  <div class="box-footer">
                  
                 
                      <asp:Button ID="btnsubmit" runat="server" BackColor="#3C8DBC" ForeColor="White" Height="36px" style="margin-top: 17" Text="Submit" Width="152px" OnClick="btnsubmit_Click" BorderStyle="None" Font-Size="15px" />
              </div>    
 
                                     
                                </div>
                               
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
   <div class="panel panel-default">
                        <div class="panel-heading" style="color: white;
    background-color: #669933;
    border-color: #ddd;">
                            <asp:Label ID="Labelrecordno" runat="server" Text="No"></asp:Label> Record(s) Found
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6"> 
                                    <asp:GridView ID="GridViewReferral" runat="server" AllowPaging="True" AllowSorting="True" BackColor="White" HeaderStyle-CssClass="text-center" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="30px" CellPadding="10" Height="120px"  Width="1290px" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateSelectButton="True" HorizontalAlign="Center" >
                                        <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#C3D8F1" Font-Bold="True" ForeColor="#8B9FC8" Font-Size="15px" Height="40px"  HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                        <PagerStyle BackColor="White" ForeColor="#000000" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" Height="40px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:GridView>
                                </div>
                               
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>

                                    </form>
    </div>
</asp:Content>


                                       