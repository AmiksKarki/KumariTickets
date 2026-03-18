<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Showtime.aspx.cs" Inherits="KumariTicketManagementSystem.Showtime" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Showtime Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light" style="padding-top: 15px;">
    <form id="form1" runat="server" class="container bg-white p-4 shadow-sm" style="border-radius: 4px;">
        <h2 class="text-primary border-bottom pb-1">Showtime Management</h2>
        <div class="mb-3 mt-3">
            <a href="Default.aspx" class="btn btn-outline-secondary btn-sm">&#8592; Back to Home</a>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SHOWTIME_ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped table-hover mt-3">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-outline-primary m-1" />
                <asp:BoundField DataField="SHOWTIME_ID" HeaderText="ID" ReadOnly="True" SortExpression="SHOWTIME_ID" />
                <asp:BoundField DataField="SHOW_DATE" HeaderText="SHOW_DATE" SortExpression="SHOW_DATE" DataFormatString="{0:d}" />
                <asp:BoundField DataField="SHOW_TIME" HeaderText="SHOW_TIME" SortExpression="SHOW_TIME" />
                <asp:BoundField DataField="SHOW_SLOT" HeaderText="SHOW_SLOT" SortExpression="SHOW_SLOT" />
                <asp:BoundField DataField="BASE_PRICE" HeaderText="BASE_PRICE" SortExpression="BASE_PRICE" />
                <asp:BoundField DataField="IS_HOLIDAY" HeaderText="HOLIDAY(Y/N)" SortExpression="IS_HOLIDAY" />
            </Columns>
            <HeaderStyle CssClass="table-dark" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;SHOWTIME_ID&quot;, &quot;SHOW_DATE&quot;, &quot;SHOW_TIME&quot;, &quot;SHOW_SLOT&quot;, &quot;BASE_PRICE&quot;, &quot;IS_HOLIDAY&quot; FROM &quot;SHOWTIME&quot;"
            DeleteCommand="DELETE FROM &quot;SHOWTIME&quot; WHERE &quot;SHOWTIME_ID&quot; = :SHOWTIME_ID"
            InsertCommand="INSERT INTO &quot;SHOWTIME&quot; (&quot;SHOWTIME_ID&quot;, &quot;SHOW_DATE&quot;, &quot;SHOW_TIME&quot;, &quot;SHOW_SLOT&quot;, &quot;BASE_PRICE&quot;, &quot;IS_HOLIDAY&quot;) VALUES (:SHOWTIME_ID, :SHOW_DATE, :SHOW_TIME, :SHOW_SLOT, :BASE_PRICE, :IS_HOLIDAY)"
            UpdateCommand="UPDATE &quot;SHOWTIME&quot; SET &quot;SHOW_DATE&quot; = :SHOW_DATE, &quot;SHOW_TIME&quot; = :SHOW_TIME, &quot;SHOW_SLOT&quot; = :SHOW_SLOT, &quot;BASE_PRICE&quot; = :BASE_PRICE, &quot;IS_HOLIDAY&quot; = :IS_HOLIDAY WHERE &quot;SHOWTIME_ID&quot; = :SHOWTIME_ID">
            <DeleteParameters>
                <asp:Parameter Name="SHOWTIME_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SHOWTIME_ID" Type="Decimal" />
                <asp:Parameter Name="SHOW_DATE" Type="DateTime" />
                <asp:Parameter Name="SHOW_TIME" Type="String" />
                <asp:Parameter Name="SHOW_SLOT" Type="String" />
                <asp:Parameter Name="BASE_PRICE" Type="Decimal" />
                <asp:Parameter Name="IS_HOLIDAY" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SHOW_DATE" Type="DateTime" />
                <asp:Parameter Name="SHOW_TIME" Type="String" />
                <asp:Parameter Name="SHOW_SLOT" Type="String" />
                <asp:Parameter Name="BASE_PRICE" Type="Decimal" />
                <asp:Parameter Name="IS_HOLIDAY" Type="String" />
                <asp:Parameter Name="SHOWTIME_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div class="card bg-light border-0 p-3 mt-3">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="SHOWTIME_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="row g-2">
                        <div class="col-md-4">
                            <label>ID:</label>
                            <asp:TextBox ID="SHOWTIME_IDTextBox" runat="server" Text='<%# Bind("SHOWTIME_ID") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label>Date:</label>
                            <asp:TextBox ID="SHOW_DATETextBox" runat="server" Text='<%# Bind("SHOW_DATE") %>' CssClass="form-control form-control-sm" TextMode="Date" />
                        </div>
                        <div class="col-md-4">
                            <label>Time:</label>
                            <asp:TextBox ID="SHOW_TIMETextBox" runat="server" Text='<%# Bind("SHOW_TIME") %>' CssClass="form-control form-control-sm" TextMode="Time" />
                        </div>
                        <div class="col-md-4">
                            <label>Slot:</label>
                            <asp:TextBox ID="SHOW_SLOTTextBox" runat="server" Text='<%# Bind("SHOW_SLOT") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label>Base Price:</label>
                            <asp:TextBox ID="BASE_PRICETextBox" runat="server" Text='<%# Bind("BASE_PRICE") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label>Is Holiday (Y/N):</label>
                            <asp:TextBox ID="IS_HOLIDAYTextBox" runat="server" Text='<%# Bind("IS_HOLIDAY") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-12 mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save Showtime" CssClass="btn btn-success btn-sm" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="+ Add Showtime" CssClass="btn btn-primary btn-sm" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
