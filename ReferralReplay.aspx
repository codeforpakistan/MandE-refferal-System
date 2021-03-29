<%@ Page Title="Referral Replay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReferralReplay.aspx.cs" Inherits="Project_refer.ReferralReplay" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    <form id="form1" runat="server">
    <div class="box box-default">
            <div class="panel-heading" style="color: white;
    background-color: #669933;
    border-color: #ddd;">
                          Replay to Referral
                        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                  <label>ADP NO</label>
                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="Enter ..."  runat="server"></asp:TextBox>  
                    </div>                
              <!-- /.form-group -->
                <div class="form-group">
                  <label>project Code</label>
                    <asp:TextBox ID="TextBox2" class="form-control" placeholder="Enter ..."  runat="server"></asp:TextBox>  
                    </div>
              <!-- /.form-group -->
                 <div class="form-group">
                  <label>project Name</label>
                    <asp:TextBox ID="TextBox3" class="form-control" placeholder="Enter ..." style="width: 100%" runat="server"></asp:TextBox>  
                    </div>
            </div>
            <!-- /.col -->
            <div class="col-md-6">
               <div class="form-group">
                  <label>Replay By</label>
         
                      <asp:DropDownList ID="ReferTypeDropDownList" class="form-control" runat="server">
                <asp:ListItem>DMO1</asp:ListItem>
                 <asp:ListItem>DMO3</asp:ListItem>
                 <asp:ListItem>DMO4</asp:ListItem>
                 <asp:ListItem>DMO5</asp:ListItem>
                  <asp:ListItem>DMO6</asp:ListItem>
                 <asp:ListItem>DMO7</asp:ListItem>
                   </asp:DropDownList>
                </div>
              <!-- /.form-group -->
               <div class="form-group">
                  <label>Replay Details</label>
&nbsp;<textarea class="form-control" rows="3" placeholder="Enter ..." style="width: 100%"></textarea>
                </div>
              <!-- /.form-group -->
                 
               <div class="form-group">
                  <label>Attachment </label>
                      <asp:FileUpload ID="FileUpload1" runat="server" Width="529px"/>
                   </div>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <asp:Button ID="btnsubmit" runat="server" BackColor="#3C8DBC" ForeColor="White" Height="36px" style="margin-top: 17" Text="Submit" Width="152px" OnClick="btnsubmit_Click" BorderStyle="None" />
        </div>
      </div>
    <div class="panel panel-default">
                        <div class="panel-heading" style="color: white;
    background-color: #669933;
    border-color: #ddd;">
                         No Record(s) Found
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6"> 
               
              
                 
                             
                                    <asp:GridView ID="GridViewReferralReplay" runat="server" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="30px" CellPadding="10" Height="60px"  Width="1228px" AutoGenerateColumns="False">
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#c3d8f1" Font-Bold="True" ForeColor="#8b9fc8" />
                                        <PagerStyle BackColor="White" ForeColor="#000000" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                    </asp:GridView>
                                   
               
              
                 
                             
                                </div>
                               
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
           </form>
</asp:Content>
                                       