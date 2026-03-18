<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OccupancyReport.aspx.cs" Inherits="KumariTicketManagementSystem.OccupancyReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Occupancy Report</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light" style="padding-top:10px;">
    <form id="form1" runat="server" class="container bg-white p-4 shadow-sm" style="border-radius: 5px;">
        <h2 class="text-primary border-bottom pb-2">Movie Theater Occupancy Report</h2>
        <div class="mb-3">
            <a href="Default.aspx" class="btn btn-outline-secondary btn-sm">&#8592; Back to Home</a>
        </div>
        <p class="text-muted" style="margin-bottom: 20px;"><em>For any movie, show the top 3 theater city halls with maximum seat occupancy (only PAID tickets counted).</em></p>

        <div class="card mb-4 bg-light border-0">
            <div class="card-body d-flex align-items-center" style="gap: 15px;">
                <label class="fw-bold mb-0">Select Movie:</label>
                <asp:DropDownList ID="ddlMovie" runat="server" AppendDataBoundItems="True" DataSourceID="dsMovies" DataTextField="TITLE" DataValueField="MOVIE_ID" CssClass="form-select form-select-sm" style="width: auto;">
                    <asp:ListItem Text="-- Select a Movie --" Value="" />
                </asp:DropDownList>
                <asp:Button ID="btnShow" runat="server" Text="Show Top Theaters" CssClass="btn btn-primary btn-sm" />
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsResults" CssClass="table table-bordered table-striped mt-2 table-hover align-middle" EmptyDataText="No occupancy data found for the selected movie.">
                <Columns>
                    <asp:BoundField DataField="RANK_NUM" HeaderText="Rank" />
                    <asp:BoundField DataField="THEATER_NAME" HeaderText="Theater" />
                    <asp:BoundField DataField="CITY" HeaderText="City" />
                    <asp:BoundField DataField="HALL_NUMBER" HeaderText="Hall" />
                    <asp:BoundField DataField="HALL_TYPE" HeaderText="Hall Type" />
                    <asp:BoundField DataField="CAPACITY" HeaderText="Capacity" />
                    <asp:BoundField DataField="TICKETS_SOLD" HeaderText="Tickets Sold" />
                    <asp:BoundField DataField="OCCUPANCY_PCT" HeaderText="Occupancy %" DataFormatString="{0:N2}%" />
                </Columns>
                <HeaderStyle CssClass="table-dark" />
            </asp:GridView>
        </div>

        <!-- Data source for dropdown -->
        <asp:SqlDataSource ID="dsMovies" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT MOVIE_ID, TITLE FROM MOVIE ORDER BY TITLE" />

        <!-- Data source for results: top 3 theaters by occupancy % for a movie (only PAID tickets) -->
        <asp:SqlDataSource ID="dsResults" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM (SELECT ROWNUM AS RANK_NUM, A.* FROM (SELECT T.THEATER_NAME, T.CITY, H.HALL_NUMBER, H.HALL_TYPE, H.CAPACITY, COUNT(TK.TICKET_ID) AS TICKETS_SOLD, ROUND((COUNT(TK.TICKET_ID) * 100) / H.CAPACITY, 2) AS OCCUPANCY_PCT FROM USER_TICKET UT JOIN THEATER T ON UT.THEATER_ID = T.THEATER_ID JOIN TICKET TK ON UT.TICKET_ID = TK.TICKET_ID JOIN HALL H ON UT.HALL_ID = H.HALL_ID WHERE UT.MOVIE_ID = :mid AND TK.PAY_STATUS = 'PAID' GROUP BY T.THEATER_NAME, T.CITY, H.HALL_NUMBER, H.HALL_TYPE, H.CAPACITY ORDER BY OCCUPANCY_PCT DESC) A WHERE ROWNUM &lt;= 3)">
            <SelectParameters>
                <asp:ControlParameter Name="mid" ControlID="ddlMovie" PropertyName="SelectedValue" Type="Decimal" ConvertEmptyStringToNull="True" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
