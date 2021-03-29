<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectReferralDetails.aspx.cs" Inherits="Project_refer.ProjectReferralDetails" %>
<asp:content id="BodyContent" contentplaceholderid="MainContent" runat="server">
    <style>
.nav-tabs-custom>.nav-tabs>li>.ref, .nav-tabs-custom>.nav-tabs>li>.ref {
    background: #d81b60;
    margin: 0;
}

.nav-tabs-custom>.nav-tabs>li>.ref {
    color: white;
    border-radius: 0;
}.nav-tabs-custom>.nav-tabs>li>.basic, .nav-tabs-custom>.nav-tabs>li>.basic {
    background: #00a65a;
    margin: 0;
}

.nav-tabs-custom>.nav-tabs>li>.basic {
    color: white;
    border-radius: 0;
}.nav-tabs-custom>.nav-tabs>li>.att, .nav-tabs-custom>.nav-tabs>li>.att {
    background: #dd4b39;
    margin: 0;
}

.nav-tabs-custom>.nav-tabs>li>.att {
    color: white;
    border-radius: 0;
}
    </style>
    <div class="col-md-12">
         <div class="box"style=" border: 1px solid #cdcdcd;" >
            <div class="box-header" style="color: white;  background-color: #205081;  border-color: #ddd;">
              <h3 class="box-title">Project Referral Information</h3>
            </div>
          <div class="nav-tabs-custom" style="box-shadow: none;">
            <ul class="nav nav-tabs">
              <li class="active"><a class="btn btn-app basic" href="#Location" data-toggle="tab" aria-expanded="true"><i class="glyphicon glyphicon-info-sign"></i>Basic Info</a></li>
              <li class=""><a href="#ReferralBy" class="btn btn-app ref" data-toggle="tab" aria-expanded="false"><i class="glyphicon glyphicon-user"></i>Referral By</a></li>
              <li class=""><a href="#Attachments" class="btn btn-app att" data-toggle="tab" aria-expanded="false"><i class="glyphicon glyphicon-film"></i>Attachments</a></li>
          
            </ul>
            <div class="tab-content">
           <div class="tab-pane active" id="Location">
            <div class="box-header with-border">
              <h3 class="box-title">Referral Description</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <dl class="dl-horizontal">
                <dt>Apparent Issue:</dt>
                <dd><%=apparent_issue %></dd>
                <dt>Division:</dt>
                <dd><%=division %></dd>
                <dt>District:</dt>
                <dd><%=district %></dd>
                <dt>Tehsil:</dt>
                <dd><%=tehsil %></dd>
                <dt>Sector:</dt>
                <dd><%=sector %></dd>
                <dt>Project Code:</dt>
                <dd><%=ProjectCode %></dd>
                  <dt>Subhead Name & Location:</dt>
                <dd><%=subheadnamelocation %></dd>
                  <dt>Referral Date:</dt>
                <dd><%=referraldate %></dd>

              </dl>
            </div>
            <!-- /.box-body -->
          </div>
           <div class="tab-pane" id="ReferralBy">
            <div class="box-header with-border">
              <h3 class="box-title">Referral By Identity</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <dl class="dl-horizontal">
                <dt>Name:</dt>
                <dd><%=name %></dd>
                <dt>Contact:</dt>
                <dd><%=contact %></dd>
                <dt>Designation:</dt>
                <dd><%=designation %></dd>
                  <dt>Assign To:</dt>
                <dd><%=email %></dd>
                <dt>Comments/approval Of The Secretary of government Khyber Pakhtunkhwa:</dt>
                <dd><%=comments %></dd>
   
              </dl>
            </div>
            <!-- /.box-body -->
          </div>
              <div class="tab-pane" id="Attachments">

                  <div class="row margin-bottom">
                        <asp:Label ID="LabelAttachment" runat="server"  ></asp:Label>
                  <!-- /.row -->
                  </div>
      <!-- /.tab-pane -->
            </div>
              </div>
                  
            <!-- /.tab-content -->
          </div>
             </div>
          <!-- /.nav-tabs-custom -->
        </div>

 </asp:content>