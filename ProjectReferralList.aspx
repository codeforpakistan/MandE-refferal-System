<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectReferralList.aspx.cs" Inherits="Project_refer.ProjectReferralList" %>
<asp:content id="BodyContent" contentplaceholderid="MainContent" runat="server">

    
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Referral List</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>SubHead Name & Location</th>
                  <th>Apparent Issue</th>
                  <th>Distric</th>
                  <th>Sector</th>
                </tr>
                </thead>
                <tbody>
                     <asp:Repeater ID="r1" runat="server">
                          <ItemTemplate>
                <tr>
                    
                  <td><a href="ProjectReferralDetails.aspx?ReferralID=<%#Eval("ReferralID")%>"><%#Eval("SubHeadNameLocation") %></a></td>
                  <td><%#Eval("Apparent_Issue") %></td>
                  <td><%#Eval("District") %></td>
                  <td><%#Eval("Department") %></td>
                </tr>
                        </ItemTemplate>
                    </asp:Repeater>
              
            
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

 </asp:content>
