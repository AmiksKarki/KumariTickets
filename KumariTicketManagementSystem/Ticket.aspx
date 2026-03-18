<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="KumariTicketManagementSystem.Ticket" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light" style="padding-top: 10px;">
    <form id="form1" runat="server" class="container mt-4 p-4 bg-white shadow-sm" style="border-radius: 6px;">
        <h2 class="text-primary border-bottom pb-2 mb-3">Ticket Management</h2>
        <div class="mb-4">
            <a href="Default.aspx" class="btn btn-outline-secondary btn-sm">&#8592; Back to Home</a>
        </div>

        <div class="table-responsive mb-4" style="margin-left: -5px; margin-right: -5px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TICKET_ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped table-hover mt-2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-outline-primary m-1" />
                    <asp:BoundField DataField="TICKET_ID" HeaderText="TICKET_ID" ReadOnly="True" SortExpression="TICKET_ID" />
                    <asp:BoundField DataField="SEAT_NUMBER" HeaderText="SEAT_NUMBER" SortExpression="SEAT_NUMBER" />
                    <asp:BoundField DataField="ROW_NUMBER" HeaderText="ROW_NUMBER" SortExpression="ROW_NUMBER" />
                    <asp:BoundField DataField="SEAT_TYPE" HeaderText="SEAT_TYPE" SortExpression="SEAT_TYPE" />
                    <asp:BoundField DataField="BOOKED_AT" HeaderText="BOOKED_AT" SortExpression="BOOKED_AT" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                    <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE" />
                    <asp:BoundField DataField="PAY_STATUS" HeaderText="PAY_STATUS" SortExpression="PAY_STATUS" />
                    <asp:BoundField DataField="PAID_AT" HeaderText="PAID_AT" SortExpression="PAID_AT" />
                    <asp:BoundField DataField="PAY_METHOD" HeaderText="PAY_METHOD" SortExpression="PAY_METHOD" />
                </Columns>
                <HeaderStyle CssClass="table-dark" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;TICKET_ID&quot;, &quot;SEAT_NUMBER&quot;, &quot;ROW_NUMBER&quot;, &quot;SEAT_TYPE&quot;, &quot;BOOKED_AT&quot;, &quot;STATUS&quot;, &quot;PRICE&quot;, &quot;PAY_STATUS&quot;, &quot;PAID_AT&quot;, &quot;PAY_METHOD&quot; FROM &quot;TICKET&quot;"
            DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKET_ID&quot; = :TICKET_ID"
            InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKET_ID&quot;, &quot;SEAT_NUMBER&quot;, &quot;ROW_NUMBER&quot;, &quot;SEAT_TYPE&quot;, &quot;BOOKED_AT&quot;, &quot;STATUS&quot;, &quot;PRICE&quot;, &quot;PAY_STATUS&quot;, &quot;PAID_AT&quot;, &quot;PAY_METHOD&quot;) VALUES (:TICKET_ID, :SEAT_NUMBER, :ROW_NUMBER, :SEAT_TYPE, :BOOKED_AT, :STATUS, :PRICE, :PAY_STATUS, :PAID_AT, :PAY_METHOD)"
            UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;SEAT_NUMBER&quot; = :SEAT_NUMBER, &quot;ROW_NUMBER&quot; = :ROW_NUMBER, &quot;SEAT_TYPE&quot; = :SEAT_TYPE, &quot;BOOKED_AT&quot; = :BOOKED_AT, &quot;STATUS&quot; = :STATUS, &quot;PRICE&quot; = :PRICE, &quot;PAY_STATUS&quot; = :PAY_STATUS, &quot;PAID_AT&quot; = :PAID_AT, &quot;PAY_METHOD&quot; = :PAY_METHOD WHERE &quot;TICKET_ID&quot; = :TICKET_ID">
            <DeleteParameters>
                <asp:Parameter Name="TICKET_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TICKET_ID" Type="Decimal" />
                <asp:Parameter Name="SEAT_NUMBER" Type="String" />
                <asp:Parameter Name="ROW_NUMBER" Type="String" />
                <asp:Parameter Name="SEAT_TYPE" Type="String" />
                <asp:Parameter Name="BOOKED_AT" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="PRICE" Type="Decimal" />
                <asp:Parameter Name="PAY_STATUS" Type="String" />
                <asp:Parameter Name="PAID_AT" Type="DateTime" />
                <asp:Parameter Name="PAY_METHOD" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SEAT_NUMBER" Type="String" />
                <asp:Parameter Name="ROW_NUMBER" Type="String" />
                <asp:Parameter Name="SEAT_TYPE" Type="String" />
                <asp:Parameter Name="BOOKED_AT" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="PRICE" Type="Decimal" />
                <asp:Parameter Name="PAY_STATUS" Type="String" />
                <asp:Parameter Name="PAID_AT" Type="DateTime" />
                <asp:Parameter Name="PAY_METHOD" Type="String" />
                <asp:Parameter Name="TICKET_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="card card-body bg-light border-0 mt-3" style="padding: 15px;">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="TICKET_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="row g-2 align-items-center">
                        <div class="col-md-3">
                            <label>TICKET_ID:</label>
                            <asp:TextBox ID="TICKET_IDTextBox" runat="server" Text='<%# Bind("TICKET_ID") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>SEAT_NUMBER:</label>
                            <asp:TextBox ID="SEAT_NUMBERTextBox" runat="server" Text='<%# Bind("SEAT_NUMBER") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>ROW_NUMBER:</label>
                            <asp:TextBox ID="ROW_NUMBERTextBox" runat="server" Text='<%# Bind("ROW_NUMBER") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>SEAT_TYPE:</label>
                            <asp:TextBox ID="SEAT_TYPETextBox" runat="server" Text='<%# Bind("SEAT_TYPE") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>BOOKED_AT:</label>
                            <asp:TextBox ID="BOOKED_ATTextBox" runat="server" Text='<%# Bind("BOOKED_AT") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>STATUS:</label>
                            <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>PRICE:</label>
                            <asp:TextBox ID="PRICETextBox" runat="server" Text='<%# Bind("PRICE") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>PAY_STATUS:</label>
                            <asp:TextBox ID="PAY_STATUSTextBox" runat="server" Text='<%# Bind("PAY_STATUS") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>PAID_AT:</label>
                            <asp:TextBox ID="PAID_ATTextBox" runat="server" Text='<%# Bind("PAID_AT") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>PAY_METHOD:</label>
                            <asp:TextBox ID="PAY_METHODTextBox" runat="server" Text='<%# Bind("PAY_METHOD") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-12 mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save Data" CssClass="btn btn-success btn-sm px-3" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm px-3" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="+ Add Ticket" CssClass="btn btn-primary btn-sm" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
