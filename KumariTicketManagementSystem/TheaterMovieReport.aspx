<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheaterMovieReport.aspx.cs" Inherits="KumariTicketManagementSystem.TheaterMovieReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Theater Movie Report</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light" style="padding-top:15px;">
    <form id="form1" runat="server" class="container bg-white p-4 shadow-sm" style="border-radius: 6px;">
        <h2 class="text-primary border-bottom pb-2">Theater City Hall - Movie Report</h2>
        <div class="mb-3">
            <a href="Default.aspx" class="btn btn-outline-secondary btn-sm">&#8592; Back to Home</a>
        </div>
        <p class="text-muted" style="font-size: 15px;"><em>For any theater, show the details of movies and showtimes.</em></p>

        <div class="card mb-4 bg-light border-0">
            <div class="card-body d-flex align-items-center flex-wrap" style="gap: 12px;">
                <label class="fw-bold mb-0">Select Theater:</label>
                <asp:DropDownList ID="ddlTheater" runat="server" AppendDataBoundItems="True" DataSourceID="dsTheaters" DataTextField="DISPLAY_NAME" DataValueField="THEATER_ID" CssClass="form-select form-select-sm" style="width: auto;">
                    <asp:ListItem Text="-- Select a Theater --" Value="" />
                </asp:DropDownList>
                <asp:Button ID="btnShow" runat="server" Text="Show Movies" CssClass="btn btn-primary btn-sm" />
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsResults" CssClass="table table-bordered table-striped table-hover align-middle" EmptyDataText="No movies found for the selected theater.">
                <Columns>
                    <asp:BoundField DataField="TITLE" HeaderText="Movie Title" />
                    <asp:BoundField DataField="GENRE" HeaderText="Genre" />
                    <asp:BoundField DataField="LANGUAGE" HeaderText="Language" />
                    <asp:BoundField DataField="DURATION" HeaderText="Duration (min)" />
                    <asp:BoundField DataField="RATING" HeaderText="Rating" />
                    <asp:BoundField DataField="HALL_NUMBER" HeaderText="Hall" />
                    <asp:BoundField DataField="HALL_TYPE" HeaderText="Hall Type" />
                    <asp:BoundField DataField="CAPACITY" HeaderText="Capacity" />
                    <asp:BoundField DataField="SHOW_DATE" HeaderText="Show Date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="SHOW_TIME" HeaderText="Show Time" />
                    <asp:BoundField DataField="SHOW_SLOT" HeaderText="Slot" />
                    <asp:BoundField DataField="BASE_PRICE" HeaderText="Base Price" DataFormatString="{0:N2}" />
                    <asp:BoundField DataField="IS_HOLIDAY" HeaderText="Holiday" />
                </Columns>
                <HeaderStyle CssClass="table-dark" />
            </asp:GridView>
        </div>

        <!-- Data source for dropdown -->
        <asp:SqlDataSource ID="dsTheaters" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT THEATER_ID, THEATER_NAME || ' (' || CITY || ')' AS DISPLAY_NAME FROM THEATER ORDER BY THEATER_NAME" />

        <!-- Data source for results -->
        <asp:SqlDataSource ID="dsResults" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT DISTINCT M.TITLE, M.GENRE, M.LANGUAGE, M.DURATION, M.RATING, H.HALL_NUMBER, H.HALL_TYPE, H.CAPACITY, S.SHOW_DATE, S.SHOW_TIME, S.SHOW_SLOT, S.BASE_PRICE, S.IS_HOLIDAY FROM USER_MOV_SHOWTIME UMS JOIN MOVIE M ON UMS.MOVIE_ID = M.MOVIE_ID JOIN HALL H ON UMS.HALL_ID = H.HALL_ID JOIN SHOWTIME S ON UMS.SHOWTIME_ID = S.SHOWTIME_ID WHERE UMS.THEATER_ID = :tid ORDER BY S.SHOW_DATE, S.SHOW_TIME">
            <SelectParameters>
                <asp:ControlParameter Name="tid" ControlID="ddlTheater" PropertyName="SelectedValue" Type="Decimal" ConvertEmptyStringToNull="True" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
