<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KumariTicketManagementSystem._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-4">

        <div class="row mb-4">
            <div class="col">
                <div class="p-4 bg-white shadow-sm rounded">
                    <h1 class="text-primary mb-0">Kumari Cinemas</h1>
                    <p class="text-secondary lead mb-0">Ticket Management System</p>
                </div>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-header bg-white fw-bold">
                        Navigation Menu
                    </div>
                    <div class="card-body">
                        <div class="d-flex flex-wrap gap-2 mb-3">
                            <span class="bagde bg-secondary text-white p-2 rounded">Basic Forms (CRUD)</span>
                            <a href="Users.aspx" class="btn btn-outline-primary btn-sm">Users</a>
                            <a href="Movie.aspx" class="btn btn-outline-primary btn-sm">Movies</a>
                            <a href="Theater.aspx" class="btn btn-outline-primary btn-sm">Theaters</a>
                            <a href="Hall.aspx" class="btn btn-outline-primary btn-sm">Halls</a>
                            <a href="Showtime.aspx" class="btn btn-outline-primary btn-sm">Showtimes</a>
                            <a href="Ticket.aspx" class="btn btn-outline-primary btn-sm">Tickets</a>
                        </div>
                        <div class="d-flex flex-wrap gap-2">
                            <span class="bagde bg-dark text-white p-2 rounded">Complex Reports</span>
                            <a href="UserTicketReport.aspx" class="btn btn-outline-dark btn-sm">User Ticket Report</a>
                            <a href="TheaterMovieReport.aspx" class="btn btn-outline-dark btn-sm">Theater Movie Report</a>
                            <a href="OccupancyReport.aspx" class="btn btn-outline-dark btn-sm">Occupancy Report</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card text-center border-primary shadow-sm">
                    <div class="card-header bg-primary text-white">Total Users</div>
                    <div class="card-body">
                        <h2 class="card-title mb-0">
                            <asp:Repeater ID="rptUserCount" runat="server" DataSourceID="dsUserCount">
                                <ItemTemplate><%# Eval("TOTAL") %></ItemTemplate>
                            </asp:Repeater>
                        </h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center border-success shadow-sm">
                    <div class="card-header bg-success text-white">Total Movies</div>
                    <div class="card-body">
                        <h2 class="card-title mb-0">
                            <asp:Repeater ID="rptMovieCount" runat="server" DataSourceID="dsMovieCount">
                                <ItemTemplate><%# Eval("TOTAL") %></ItemTemplate>
                            </asp:Repeater>
                        </h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center border-warning shadow-sm">
                    <div class="card-header bg-warning text-dark">Total Theaters</div>
                    <div class="card-body">
                        <h2 class="card-title mb-0">
                            <asp:Repeater ID="rptTheaterCount" runat="server" DataSourceID="dsTheaterCount">
                                <ItemTemplate><%# Eval("TOTAL") %></ItemTemplate>
                            </asp:Repeater>
                        </h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center border-info shadow-sm">
                    <div class="card-header bg-info text-dark">Tickets Sold (Paid)</div>
                    <div class="card-body">
                        <h2 class="card-title mb-0">
                            <asp:Repeater ID="rptTicketCount" runat="server" DataSourceID="dsTicketCount">
                                <ItemTemplate><%# Eval("TOTAL") %></ItemTemplate>
                            </asp:Repeater>
                        </h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header bg-white fw-bold">Tickets by Status</div>
                    <div class="card-body pb-3">
                        <div class="d-flex align-items-end justify-content-around" style="height: 180px;">
                            <asp:Repeater ID="rptTicketStatus" runat="server" DataSourceID="dsTicketStatus">
                                <ItemTemplate>
                                    <div class="d-flex flex-column align-items-center">
                                        <small class="text-muted fw-bold mb-1"><%# Eval("CNT") %></small>
                                        <div class="bg-primary rounded-top shadow-sm" style='width: 40px; height: <%# Math.Min(Convert.ToInt32(Eval("CNT")) * 15, 140) %>px;' title='<%# Eval("STATUS") %> : <%# Eval("CNT") %>'></div>
                                        <span class="small mt-2 text-truncate text-center" style="max-width: 80px;" title='<%# Eval("STATUS") %>'><%# Eval("STATUS") %></span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header bg-white fw-bold">Movies by Genre</div>
                    <div class="card-body pb-3">
                        <div class="d-flex align-items-end justify-content-around" style="height: 180px;">
                            <asp:Repeater ID="rptGenre" runat="server" DataSourceID="dsGenre">
                                <ItemTemplate>
                                    <div class="d-flex flex-column align-items-center">
                                        <small class="text-muted fw-bold mb-1"><%# Eval("CNT") %></small>
                                        <div class="bg-success rounded-top shadow-sm" style='width: 40px; height: <%# Math.Min(Convert.ToInt32(Eval("CNT")) * 20, 140) %>px;' title='<%# Eval("GENRE") %> : <%# Eval("CNT") %>'></div>
                                        <span class="small mt-2 text-truncate text-center" style="max-width: 80px;" title='<%# Eval("GENRE") %>'><%# Eval("GENRE") %></span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm h-100">
                    <div class="card-header bg-white fw-bold">Theaters by City</div>
                    <div class="card-body pb-3">
                        <div class="d-flex align-items-end justify-content-around" style="height: 190px;">
                            <asp:Repeater ID="rptCity" runat="server" DataSourceID="dsCity">
                                <ItemTemplate>
                                    <div class="d-flex flex-column align-items-center">
                                        <small class="text-muted fw-bold mb-1"><%# Eval("CNT") %></small>
                                        <div class="bg-info rounded-top shadow-sm" style='width: 40px; height: <%# Math.Min(Convert.ToInt32(Eval("CNT")) * 25, 140) %>px;' title='<%# Eval("CITY") %> : <%# Eval("CNT") %>'></div>
                                        <span class="small mt-2 text-truncate text-center" style="max-width: 80px;" title='<%# Eval("CITY") %>'><%# Eval("CITY") %></span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Data Sources -->
        <asp:SqlDataSource ID="dsUserCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL FROM USERS" />
        <asp:SqlDataSource ID="dsMovieCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL FROM MOVIE" />
        <asp:SqlDataSource ID="dsTheaterCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL FROM THEATER" />
        <asp:SqlDataSource ID="dsTicketCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL FROM TICKET WHERE PAY_STATUS = 'PAID'" />
        <asp:SqlDataSource ID="dsTicketStatus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT STATUS, COUNT(*) AS CNT FROM TICKET GROUP BY STATUS ORDER BY STATUS" />
        <asp:SqlDataSource ID="dsGenre" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT GENRE, COUNT(*) AS CNT FROM MOVIE GROUP BY GENRE ORDER BY CNT DESC" />
        <asp:SqlDataSource ID="dsCity" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT CITY, COUNT(*) AS CNT FROM THEATER GROUP BY CITY ORDER BY CNT DESC" />
    </form>
</body>
</html>
