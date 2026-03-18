<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTicketReport.aspx.cs" Inherits="KumariTicketManagementSystem.UserTicketReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Ticket Report</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5 p-4 bg-white shadow-sm rounded">
        <h2 class="text-primary border-bottom pb-2 mb-3">User Ticket Report</h2>
        <div class="mb-3">
            <a href="Default.aspx" class="btn btn-outline-secondary btn-sm">&#8592; Back to Home</a>
        </div>
        <p class="text-muted"><em>For any user, show details of the user and the tickets bought during the last 6 months.</em></p>

        <div class="card mb-4 bg-light border-0">
            <div class="card-body d-flex align-items-center gap-3">
                <label class="fw-bold mb-0">Select User:</label>
                <asp:DropDownList ID="ddlUser" runat="server" AppendDataBoundItems="True" DataSourceID="dsUsers" DataTextField="FULL_NAME" DataValueField="USER_ID" CssClass="form-select w-auto">
                    <asp:ListItem Text="-- Select a User --" Value="" />
                </asp:DropDownList>
                <asp:Button ID="btnShow" runat="server" Text="Show Tickets" CssClass="btn btn-primary" />
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsResults" CssClass="table table-bordered table-striped table-hover align-middle" EmptyDataText="No tickets found for the selected user in the last 6 months.">
                <Columns>
                    <asp:BoundField DataField="FULL_NAME" HeaderText="User Name" />
                    <asp:BoundField DataField="EMAIL" HeaderText="Email" />
                    <asp:BoundField DataField="CONTACT_NUM" HeaderText="Contact" />
                    <asp:BoundField DataField="MOVIE_TITLE" HeaderText="Movie" />
                    <asp:BoundField DataField="THEATER_NAME" HeaderText="Theater" />
                    <asp:BoundField DataField="HALL_NUMBER" HeaderText="Hall" />
                    <asp:BoundField DataField="SHOW_DATE" HeaderText="Show Date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="SHOW_TIME" HeaderText="Time" />
                    <asp:BoundField DataField="SEAT_NUMBER" HeaderText="Seat" />
                    <asp:BoundField DataField="PRICE" HeaderText="Price" DataFormatString="{0:N2}" />
                    <asp:BoundField DataField="STATUS" HeaderText="Status" />
                    <asp:BoundField DataField="PAY_STATUS" HeaderText="Pay Status" />
                    <asp:BoundField DataField="BOOKED_AT" HeaderText="Booking Date" DataFormatString="{0:d}" />
                </Columns>
                <HeaderStyle CssClass="table-dark" />
            </asp:GridView>
        </div>

        <!-- Data source for dropdown -->
        <asp:SqlDataSource ID="dsUsers" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT USER_ID, FULL_NAME FROM USERS ORDER BY FULL_NAME" />

        <!-- Data source for results -->
        <asp:SqlDataSource ID="dsResults" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT U.FULL_NAME, U.EMAIL, U.CONTACT_NUM, M.TITLE AS MOVIE_TITLE, T.THEATER_NAME, H.HALL_NUMBER, S.SHOW_DATE, S.SHOW_TIME, S.SHOW_SLOT, TK.SEAT_NUMBER, TK.SEAT_TYPE, TK.PRICE, TK.STATUS, TK.PAY_STATUS, TK.PAY_METHOD, TK.BOOKED_AT FROM USERS U JOIN USER_TICKET UT ON U.USER_ID = UT.USER_ID JOIN TICKET TK ON UT.TICKET_ID = TK.TICKET_ID JOIN SHOWTIME S ON UT.SHOWTIME_ID = S.SHOWTIME_ID JOIN HALL H ON UT.HALL_ID = H.HALL_ID JOIN THEATER T ON UT.THEATER_ID = T.THEATER_ID JOIN MOVIE M ON UT.MOVIE_ID = M.MOVIE_ID WHERE U.USER_ID = :p_userid AND TK.BOOKED_AT >= ADD_MONTHS(SYSDATE, -6) ORDER BY TK.BOOKED_AT DESC">
            <SelectParameters>
                <asp:ControlParameter Name="p_userid" ControlID="ddlUser" PropertyName="SelectedValue" Type="Decimal" ConvertEmptyStringToNull="True" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
