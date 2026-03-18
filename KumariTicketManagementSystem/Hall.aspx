<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hall.aspx.cs" Inherits="KumariTicketManagementSystem.Hall" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hall Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light" style="padding-top:20px;">
    <form id="form1" runat="server" class="container bg-white shadow-sm p-3 mb-5 rounded" style="max-width: 800px;">
        <h2 class="text-primary border-bottom pb-2">Hall Management</h2>
        <div class="mb-3 mt-2">
            <a href="Default.aspx" class="btn btn-outline-secondary btn-sm">&#8592; Back to Home</a>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="HALL_ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped mt-3">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-outline-primary m-1" />
                <asp:BoundField DataField="HALL_ID" HeaderText="ID" ReadOnly="True" SortExpression="HALL_ID" />
                <asp:BoundField DataField="HALL_NUMBER" HeaderText="Hall Number" SortExpression="HALL_NUMBER" />
                <asp:BoundField DataField="CAPACITY" HeaderText="Capacity" SortExpression="CAPACITY" />
                <asp:BoundField DataField="HALL_TYPE" HeaderText="Hall Type" SortExpression="HALL_TYPE" />
            </Columns>
            <HeaderStyle CssClass="table-dark" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;HALL_ID&quot;, &quot;HALL_NUMBER&quot;, &quot;CAPACITY&quot;, &quot;HALL_TYPE&quot; FROM &quot;HALL&quot;"
            DeleteCommand="DELETE FROM &quot;HALL&quot; WHERE &quot;HALL_ID&quot; = :HALL_ID"
            InsertCommand="INSERT INTO &quot;HALL&quot; (&quot;HALL_ID&quot;, &quot;HALL_NUMBER&quot;, &quot;CAPACITY&quot;, &quot;HALL_TYPE&quot;) VALUES (:HALL_ID, :HALL_NUMBER, :CAPACITY, :HALL_TYPE)"
            UpdateCommand="UPDATE &quot;HALL&quot; SET &quot;HALL_NUMBER&quot; = :HALL_NUMBER, &quot;CAPACITY&quot; = :CAPACITY, &quot;HALL_TYPE&quot; = :HALL_TYPE WHERE &quot;HALL_ID&quot; = :HALL_ID">
            <DeleteParameters>
                <asp:Parameter Name="HALL_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="HALL_ID" Type="Decimal" />
                <asp:Parameter Name="HALL_NUMBER" Type="String" />
                <asp:Parameter Name="CAPACITY" Type="Decimal" />
                <asp:Parameter Name="HALL_TYPE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="HALL_NUMBER" Type="String" />
                <asp:Parameter Name="CAPACITY" Type="Decimal" />
                <asp:Parameter Name="HALL_TYPE" Type="String" />
                <asp:Parameter Name="HALL_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="card card-body mt-3 border-0 bg-light">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="HALL_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="row g-2 align-items-center">
                        <div class="col-auto">
                            <label>ID:</label>
                            <asp:TextBox ID="HALL_IDTextBox" runat="server" Text='<%# Bind("HALL_ID") %>' CssClass="form-control form-control-sm" Width="80px" />
                        </div>
                        <div class="col-auto">
                            <label>Hall Num:</label>
                            <asp:TextBox ID="HALL_NUMBERTextBox" runat="server" Text='<%# Bind("HALL_NUMBER") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-auto">
                            <label>Capacity:</label>
                            <asp:TextBox ID="CAPACITYTextBox" runat="server" Text='<%# Bind("CAPACITY") %>' CssClass="form-control form-control-sm" Width="100px" />
                        </div>
                        <div class="col-auto">
                            <label>Type:</label>
                            <asp:TextBox ID="HALL_TYPETextBox" runat="server" Text='<%# Bind("HALL_TYPE") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-12 mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Create Hall" CssClass="btn btn-success btn-sm" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="+ Insert New Hall" CssClass="btn btn-primary btn-sm" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
