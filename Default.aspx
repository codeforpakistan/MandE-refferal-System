<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project_refer._Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .text-center th {
        text-align: center;
    }
    .highcharts-figure, .highcharts-data-table table {
  min-width: 320px; 
  max-width: 660px;
  margin: 1em auto;
}
    text.highcharts-credits {
    display: none;
}
.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
  padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
  padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}
.highcharts-data-table tr:hover {
  background: #f1f7ff;
}
</style>
    <form id="form1" runat="server">
      <div class="row">
        <div class="col-md-12">
              <div class="box">
            <div class="box-header with-border" style="left: 0px; top: 2px">
              <h3 class="box-title">
                  
                 Project Referrals</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">  
                <div id="container"></div>
              </div>
            </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </form>
 <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script>// Create the chart
Highcharts.chart('container', {
  chart: {
    type: 'pie'
  },
  title: {
    text: 'Project Referral'
  },
  subtitle: {
    text: ''
  },

  accessibility: {
    announceNewData: {
      enabled: true
    },
    //point: {
    //  valueSuffix: '%'
    //}
  },

  plotOptions: {
    series: {
      dataLabels: {
        enabled: true,
        format: '{point.name}: {point.y}'
      }
    }
  },

  tooltip: {
    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b> of total<br/>'
  },

  series: [
    {
      name: "No of Approved & Un-Approved",
      colorByPoint: true,
      data: [
        {
          name: "Approved Referral",
          y: <%=appcount %>,
          drilldown: "Sector"
          },

        {
          name: "Un-Approved Referral",
          y: <%=unappcount %>,
          drilldown: "Sector"
        }
       
      ]
    }
  ],
  drilldown: {
      series: [

      {
        name: "Sector",
        id: "Sector",
        data: [
          [
            "Agriculture",
                 <%=Agriculture %>

            ],
          [
            "AUQAF",
             <%=AUQAF %>
            ],
            [
            "District ADP",
             <%=DistrictADP %>
            ],
            [
            "Drinking Water and Sanitation",
             <%=DrinkingWaterandSanitation %>
            ],
            [
            "Elementary & Secondary Education",
             <%=ElementarySecondaryEducation %>
            ],
            [
            "Energy & Power",
             <%=EnergyPower %>
            ],
            [
            "Environment",
             <%=Environment %>
            ],
            [
            "Establishment & Administration",
            <%=EstablishmentAdministration %>
            ],
            [
            "Excise & Taxation",
            <%=ExciseTaxation %>
            ],
            [
            "Finance",
            <%=Finance %>
            ],
            [
            "Food",
             <%=Food %>
            ],
            [
            "Health",
             <%=Health %>
            ],
            [
            "Higher Education",
             <%=HigherEducation %>
            ],
            [
            "Home",
             <%=Home %>
            ],
            [
            "Housing",
             <%=Housing %>
            ],
            [
            "Industries",
             <%=Industries %>
            ],
            [
            "Information",
             <%=Information %>
            ],
            [
            "Labour",
             <%=Labour %>
            ],
            [
            "Law & Justice",
             <%=LawJustice %>
            ],
            [
            "Local Government",
             <%=LocalGovernment %>
            ], 
            [
            "Mines & Minerals",
             <%=MinesMinerals %>
            ],
            [
            "MULTI SECTORAL DEVELOPMENT",
             <%=MULTISECTORALDEVELOPMENT %>
            ],
            [
            "Population Welfare",
             <%=PopulationWelfare %>
            ],
            [
            "Relief & Rehabilitation",
             <%=ReliefRehabilitation %>
            ],
            [
            "Roads",
            <%=Roads %>
            ],
            [
            "Social Welfare",
             <%=SocialWelfare %>
            ],
            [
            "Special Initiatives",
             <%=SpecialInitiatives %>
            ],
            [
            "Sports, Culture, Tourism, Archaeology & Youth Affairs",
             <%=SportsCulture %>
            ],
            [
            "ST&IT",
             <%=STIT %>
            ],
            [
            "Transport",
             <%=Transport %>
            ],
            [
            "Urban Development",
             <%=UrbanDevelopment %>
            ],
            [
            "Water",
             <%=Water %>
            ],
              ],
              point: {
                  events :{
                      click: function (e) {
                          //alert(e.point.name);
                          window.open("ProjectReferralList.aspx?Sector="+e.point.name);
                      }
                  }
                }
        
          },
     
    ]
  }
});</script>
</asp:Content>
