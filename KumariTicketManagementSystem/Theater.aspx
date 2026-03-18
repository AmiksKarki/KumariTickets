<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Theater.aspx.cs" Inherits="KumariTicketManagementSystem.Theater" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Theater Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light" style="padding: 10px;">
    <form id="form1" runat="server" class="container mt-4 p-4 bg-white shadow-sm" style="border-radius: 5px;">
        <h2 class="text-primary border-bottom pb-2 mb-3">Theater Management</h2>
        <div class="mb-4">
            <a href="Default.aspx" class="btn btn-outline-secondary btn-sm">&#8592; Back to Home</a>
        </div>

        <div class="table-responsive mb-4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="THEATER_ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped table-hover">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-outline-primary m-1" />
                    <asp:BoundField DataField="THEATER_ID" HeaderText="THEATER_ID" ReadOnly="True" SortExpression="THEATER_ID" />
                    <asp:BoundField DataField="THEATER_NAME" HeaderText="THEATER_NAME" SortExpression="THEATER_NAME" />
                    <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                    <asp:BoundField DataField="CONTACT_NUM" HeaderText="CONTACT_NUM" SortExpression="CONTACT_NUM" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="MANAGER_NAME" HeaderText="MANAGER_NAME" SortExpression="MANAGER_NAME" />
                </Columns>
                <HeaderStyle CssClass="table-dark" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;THEATER_ID&quot;, &quot;THEATER_NAME&quot;, &quot;CITY&quot;, &quot;ADDRESS&quot;, &quot;CONTACT_NUM&quot;, &quot;EMAIL&quot;, &quot;MANAGER_NAME&quot; FROM &quot;THEATER&quot;"
            DeleteCommand="DELETE FROM &quot;THEATER&quot; WHERE &quot;THEATER_ID&quot; = :THEATER_ID"
            InsertCommand="INSERT INTO &quot;THEATER&quot; (&quot;THEATER_ID&quot;, &quot;THEATER_NAME&quot;, &quot;CITY&quot;, &quot;ADDRESS&quot;, &quot;CONTACT_NUM&quot;, &quot;EMAIL&quot;, &quot;MANAGER_NAME&quot;) VALUES (:THEATER_ID, :THEATER_NAME, :CITY, :ADDRESS, :CONTACT_NUM, :EMAIL, :MANAGER_NAME)"
            UpdateCommand="UPDATE &quot;THEATER&quot; SET &quot;THEATER_NAME&quot; = :THEATER_NAME, &quot;CITY&quot; = :CITY, &quot;ADDRESS&quot; = :ADDRESS, &quot;CONTACT_NUM&quot; = :CONTACT_NUM, &quot;EMAIL&quot; = :EMAIL, &quot;MANAGER_NAME&quot; = :MANAGER_NAME WHERE &quot;THEATER_ID&quot; = :THEATER_ID">
            <DeleteParameters>
                <asp:Parameter Name="THEATER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="THEATER_ID" Type="Decimal" />
                <asp:Parameter Name="THEATER_NAME" Type="String" />
                <asp:Parameter Name="CITY" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="CONTACT_NUM" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="MANAGER_NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="THEATER_NAME" Type="String" />
                <asp:Parameter Name="CITY" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="CONTACT_NUM" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="MANAGER_NAME" Type="String" />
                <asp:Parameter Name="THEATER_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="card card-body bg-light border-0">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="THEATER_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="row g-2">
                        <div class="col-md-3">
                            <label>THEATER_ID:</label>
                            <asp:TextBox ID="THEATER_IDTextBox" runat="server" Text='<%# Bind("THEATER_ID") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>THEATER_NAME:</label>
                            <asp:TextBox ID="THEATER_NAMETextBox" runat="server" Text='<%# Bind("THEATER_NAME") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>CITY:</label>
                            <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3">
                            <label>ADDRESS:</label>
                            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-3 mt-2">
                            <label>CONTACT_NUM:</label>
                            <asp:TextBox ID="CONTACT_NUMTextBox" runat="server" Text='<%# Bind("CONTACT_NUM") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4 mt-2">
                            <label>EMAIL:</label>
                            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4 mt-2">
                            <label>MANAGER_NAME:</label>
                            <asp:TextBox ID="MANAGER_NAMETextBox" runat="server" Text='<%# Bind("MANAGER_NAME") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-12 mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" CssClass="btn btn-success btn-sm" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="+ Add Theater" CssClass="btn btn-primary btn-sm" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
