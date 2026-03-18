<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="KumariTicketManagementSystem.Movie" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light" style="padding-top:15px;">
    <form id="form1" runat="server" class="container mt-3 p-4 bg-white shadow-sm" style="border-radius: 8px;">
        <h2 class="text-primary border-bottom pb-2 mb-3">Movie Management</h2>
        <div class="mb-3">
            <a href="Default.aspx" class="btn btn-outline-secondary btn-sm">&#8592; Back to Home</a>
        </div>

        <div style="overflow-x: auto; margin-bottom: 20px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MOVIE_ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover mt-2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-outline-primary m-1" />
                    <asp:BoundField DataField="MOVIE_ID" HeaderText="MOVIE_ID" ReadOnly="True" SortExpression="MOVIE_ID" />
                    <asp:BoundField DataField="TITLE" HeaderText="TITLE" SortExpression="TITLE" />
                    <asp:BoundField DataField="DURATION" HeaderText="DURATION" SortExpression="DURATION" />
                    <asp:BoundField DataField="LANGUAGE" HeaderText="LANGUAGE" SortExpression="LANGUAGE" />
                    <asp:BoundField DataField="GENRE" HeaderText="GENRE" SortExpression="GENRE" />
                    <asp:BoundField DataField="RELEASE_DATE" HeaderText="RELEASE_DATE" SortExpression="RELEASE_DATE" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                    <asp:BoundField DataField="DIRECTOR" HeaderText="DIRECTOR" SortExpression="DIRECTOR" />
                    <asp:BoundField DataField="CAST_INFO" HeaderText="CAST_INFO" SortExpression="CAST_INFO" />
                    <asp:BoundField DataField="RATING" HeaderText="RATING" SortExpression="RATING" />
                    <asp:BoundField DataField="IS_NEW" HeaderText="IS_NEW" SortExpression="IS_NEW" />
                </Columns>
                <HeaderStyle CssClass="table-dark" />
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;MOVIE_ID&quot;, &quot;TITLE&quot;, &quot;DURATION&quot;, &quot;LANGUAGE&quot;, &quot;GENRE&quot;, &quot;RELEASE_DATE&quot;, &quot;DESCRIPTION&quot;, &quot;DIRECTOR&quot;, &quot;CAST_INFO&quot;, &quot;RATING&quot;, &quot;IS_NEW&quot; FROM &quot;MOVIE&quot;"
            DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIE_ID&quot; = :MOVIE_ID"
            InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIE_ID&quot;, &quot;TITLE&quot;, &quot;DURATION&quot;, &quot;LANGUAGE&quot;, &quot;GENRE&quot;, &quot;RELEASE_DATE&quot;, &quot;DESCRIPTION&quot;, &quot;DIRECTOR&quot;, &quot;CAST_INFO&quot;, &quot;RATING&quot;, &quot;IS_NEW&quot;) VALUES (:MOVIE_ID, :TITLE, :DURATION, :LANGUAGE, :GENRE, :RELEASE_DATE, :DESCRIPTION, :DIRECTOR, :CAST_INFO, :RATING, :IS_NEW)"
            UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;TITLE&quot; = :TITLE, &quot;DURATION&quot; = :DURATION, &quot;LANGUAGE&quot; = :LANGUAGE, &quot;GENRE&quot; = :GENRE, &quot;RELEASE_DATE&quot; = :RELEASE_DATE, &quot;DESCRIPTION&quot; = :DESCRIPTION, &quot;DIRECTOR&quot; = :DIRECTOR, &quot;CAST_INFO&quot; = :CAST_INFO, &quot;RATING&quot; = :RATING, &quot;IS_NEW&quot; = :IS_NEW WHERE &quot;MOVIE_ID&quot; = :MOVIE_ID">
            <DeleteParameters>
                <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
                <asp:Parameter Name="TITLE" Type="String" />
                <asp:Parameter Name="DURATION" Type="Decimal" />
                <asp:Parameter Name="LANGUAGE" Type="String" />
                <asp:Parameter Name="GENRE" Type="String" />
                <asp:Parameter Name="RELEASE_DATE" Type="DateTime" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="DIRECTOR" Type="String" />
                <asp:Parameter Name="CAST_INFO" Type="String" />
                <asp:Parameter Name="RATING" Type="String" />
                <asp:Parameter Name="IS_NEW" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TITLE" Type="String" />
                <asp:Parameter Name="DURATION" Type="Decimal" />
                <asp:Parameter Name="LANGUAGE" Type="String" />
                <asp:Parameter Name="GENRE" Type="String" />
                <asp:Parameter Name="RELEASE_DATE" Type="DateTime" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="DIRECTOR" Type="String" />
                <asp:Parameter Name="CAST_INFO" Type="String" />
                <asp:Parameter Name="RATING" Type="String" />
                <asp:Parameter Name="IS_NEW" Type="String" />
                <asp:Parameter Name="MOVIE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="p-3 border mt-3" style="background-color: #f8f9fa;">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIE_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="row g-2">
                        <div class="col-md-4">
                            MOVIE_ID: <asp:TextBox ID="MOVIE_IDTextBox" runat="server" Text='<%# Bind("MOVIE_ID") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            TITLE: <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            DURATION: <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            LANGUAGE: <asp:TextBox ID="LANGUAGETextBox" runat="server" Text='<%# Bind("LANGUAGE") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            GENRE: <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            RELEASE_DATE: <asp:TextBox ID="RELEASE_DATETextBox" runat="server" Text='<%# Bind("RELEASE_DATE") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            DIRECTOR: <asp:TextBox ID="DIRECTORTextBox" runat="server" Text='<%# Bind("DIRECTOR") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-4">
                            CAST_INFO: <asp:TextBox ID="CAST_INFOTextBox" runat="server" Text='<%# Bind("CAST_INFO") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-2">
                            RATING: <asp:TextBox ID="RATINGTextBox" runat="server" Text='<%# Bind("RATING") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-2">
                            IS_NEW: <asp:TextBox ID="IS_NEWTextBox" runat="server" Text='<%# Bind("IS_NEW") %>' CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-12">
                            DESCRIPTION: <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' TextMode="MultiLine" CssClass="form-control form-control-sm" />
                        </div>
                        <div class="col-md-12 mt-2">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add Movie" CssClass="btn btn-success btn-sm" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" />
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="+ Insert New Movie" CssClass="btn btn-primary btn-sm" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
