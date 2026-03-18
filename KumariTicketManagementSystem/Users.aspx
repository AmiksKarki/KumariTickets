<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="KumariTicketManagementSystem.Users" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5 p-4 bg-white shadow-sm rounded">
        <h2 class="text-primary border-bottom pb-2 mb-3">User Management</h2>
        <div class="mb-4">
            <a href="Default.aspx" class="btn btn-outline-secondary btn-sm">&#8592; Back to Home</a>
        </div>

        <div class="table-responsive mb-4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped table-hover align-middle">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-outline-primary m-1" />
                    <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" />
                    <asp:BoundField DataField="FULL_NAME" HeaderText="Full Name" SortExpression="FULL_NAME" />
                    <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                    <asp:BoundField DataField="CONTACT_NUM" HeaderText="Contact Num" SortExpression="CONTACT_NUM" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="Address" SortExpression="ADDRESS" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="GENDER" HeaderText="Gender" SortExpression="GENDER" />
                    <asp:BoundField DataField="REG_DATE" HeaderText="Reg Date" SortExpression="REG_DATE" DataFormatString="{0:d}" />
                </Columns>
                <HeaderStyle CssClass="table-dark" />
            </asp:GridView>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USER_ID&quot; = :USER_ID" InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USER_ID&quot;, &quot;FULL_NAME&quot;, &quot;USERNAME&quot;, &quot;EMAIL&quot;, &quot;CONTACT_NUM&quot;, &quot;ADDRESS&quot;, &quot;DOB&quot;, &quot;GENDER&quot;, &quot;REG_DATE&quot;) VALUES (:USER_ID, :FULL_NAME, :USERNAME, :EMAIL, :CONTACT_NUM, :ADDRESS, :DOB, :GENDER, :REG_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USER_ID&quot;, &quot;FULL_NAME&quot;, &quot;USERNAME&quot;, &quot;EMAIL&quot;, &quot;CONTACT_NUM&quot;, &quot;ADDRESS&quot;, &quot;DOB&quot;, &quot;GENDER&quot;, &quot;REG_DATE&quot; FROM &quot;USERS&quot;" UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;FULL_NAME&quot; = :FULL_NAME, &quot;USERNAME&quot; = :USERNAME, &quot;EMAIL&quot; = :EMAIL, &quot;CONTACT_NUM&quot; = :CONTACT_NUM, &quot;ADDRESS&quot; = :ADDRESS, &quot;DOB&quot; = :DOB, &quot;GENDER&quot; = :GENDER, &quot;REG_DATE&quot; = :REG_DATE WHERE &quot;USER_ID&quot; = :USER_ID">
            <DeleteParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="FULL_NAME" Type="String" />
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT_NUM" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="GENDER" Type="String" />
                <asp:Parameter Name="REG_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FULL_NAME" Type="String" />
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT_NUM" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="GENDER" Type="String" />
                <asp:Parameter Name="REG_DATE" Type="DateTime" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="card card-body bg-light border-0">
            <h5 class="card-title">Add New User</h5>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="row g-3 align-items-center">
                        <div class="col-md-4">
                            <label class="form-label">USER_ID:</label>
                            <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">FULL_NAME:</label>
                            <asp:TextBox ID="FULL_NAMETextBox" runat="server" Text='<%# Bind("FULL_NAME") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">USERNAME:</label>
                            <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">EMAIL:</label>
                            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">CONTACT_NUM:</label>
                            <asp:TextBox ID="CONTACT_NUMTextBox" runat="server" Text='<%# Bind("CONTACT_NUM") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">ADDRESS:</label>
                            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">DOB:</label>
                            <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">GENDER:</label>
                            <asp:TextBox ID="GENDERTextBox" runat="server" Text='<%# Bind("GENDER") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">REG_DATE:</label>
                            <asp:TextBox ID="REG_DATETextBox" runat="server" Text='<%# Bind("REG_DATE") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-12 mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" CssClass="btn btn-success btn-sm px-4" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm px-4" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="+ Insert New Data" CssClass="btn btn-primary" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
