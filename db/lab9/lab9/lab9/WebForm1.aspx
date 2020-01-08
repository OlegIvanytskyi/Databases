<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="lab9.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Menu ID="Menu1" runat="server">
    <Items>
        <asp:MenuItem NavigateUrl="~/About.aspx" Text="Про програму" Value="About"></asp:MenuItem>
    </Items>
</asp:Menu>
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="50px" Width="125px" AllowPaging="True">
    <Fields>
        <asp:BoundField DataField="ID" HeaderText="Номер" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="PRICE" HeaderText="Ціна" SortExpression="PRICE" />
        <asp:BoundField DataField="CAPACITY" HeaderText="Місткість" SortExpression="CAPACITY" />
        <asp:BoundField DataField="COMFORT" HeaderText="Рівень комфорту" SortExpression="COMFORT" />
        <asp:CommandField ShowEditButton="True" CancelText="Відмінити" DeleteText="Видалити" EditText="Редагувати" InsertText="Вставити" NewText="Новий" SelectText="Вибрати" UpdateText="Оновити" />
        <asp:CommandField ShowDeleteButton="True" DeleteText="Видалити" />
        <asp:CommandField ShowInsertButton="True" NewText="Додати" />
    </Fields>
</asp:DetailsView>
<asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
    <Fields>
        <asp:BoundField DataField="ID" HeaderText="Номер" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="NAME" HeaderText="Ім'я" SortExpression="NAME" />
        <asp:BoundField DataField="PRICE" HeaderText="Ціна" SortExpression="PRICE" />
        <asp:CommandField ShowEditButton="True" EditText="Редагувати" />
        <asp:CommandField ShowDeleteButton="True" DeleteText="Видалити" />
        <asp:CommandField ShowInsertButton="True" NewText="Додати" />
    </Fields>
</asp:DetailsView>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="Номер" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="PRICE" HeaderText="Ціна" SortExpression="PRICE" />
        <asp:BoundField DataField="CAPACITY" HeaderText="Місткість" SortExpression="CAPACITY" />
        <asp:BoundField DataField="COMFORT" HeaderText="Рівень комфорту" SortExpression="COMFORT" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:lab9ConnectionString %>" SelectCommand="SELECT * FROM ROOM WHERE PRICE &gt; 500;"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:lab9ConnectionString %>" DeleteCommand="DELETE FROM [SERVICE] WHERE [ID] = @original_ID AND [NAME] = @original_NAME AND [PRICE] = @original_PRICE" InsertCommand="INSERT INTO [SERVICE] ([ID], [NAME], [PRICE]) VALUES (@ID, @NAME, @PRICE)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SERVICE]" UpdateCommand="UPDATE [SERVICE] SET [NAME] = @NAME, [PRICE] = @PRICE WHERE [ID] = @original_ID AND [NAME] = @original_NAME AND [PRICE] = @original_PRICE">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int32" />
        <asp:Parameter Name="original_NAME" Type="String" />
        <asp:Parameter Name="original_PRICE" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ID" Type="Int32" />
        <asp:Parameter Name="NAME" Type="String" />
        <asp:Parameter Name="PRICE" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="NAME" Type="String" />
        <asp:Parameter Name="PRICE" Type="Int32" />
        <asp:Parameter Name="original_ID" Type="Int32" />
        <asp:Parameter Name="original_NAME" Type="String" />
        <asp:Parameter Name="original_PRICE" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:lab9ConnectionString %>" DeleteCommand="DELETE FROM [ROOM] WHERE [ID] = @original_ID AND [PRICE] = @original_PRICE AND [CAPACITY] = @original_CAPACITY AND [COMFORT] = @original_COMFORT" InsertCommand="INSERT INTO [ROOM] ([ID], [PRICE], [CAPACITY], [COMFORT]) VALUES (@ID, @PRICE, @CAPACITY, @COMFORT)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ROOM]" UpdateCommand="UPDATE [ROOM] SET [PRICE] = @PRICE, [CAPACITY] = @CAPACITY, [COMFORT] = @COMFORT WHERE [ID] = @original_ID AND [PRICE] = @original_PRICE AND [CAPACITY] = @original_CAPACITY AND [COMFORT] = @original_COMFORT">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int32" />
        <asp:Parameter Name="original_PRICE" Type="Int32" />
        <asp:Parameter Name="original_CAPACITY" Type="Int32" />
        <asp:Parameter Name="original_COMFORT" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ID" Type="Int32" />
        <asp:Parameter Name="PRICE" Type="Int32" />
        <asp:Parameter Name="CAPACITY" Type="Int32" />
        <asp:Parameter Name="COMFORT" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="PRICE" Type="Int32" />
        <asp:Parameter Name="CAPACITY" Type="Int32" />
        <asp:Parameter Name="COMFORT" Type="String" />
        <asp:Parameter Name="original_ID" Type="Int32" />
        <asp:Parameter Name="original_PRICE" Type="Int32" />
        <asp:Parameter Name="original_CAPACITY" Type="Int32" />
        <asp:Parameter Name="original_COMFORT" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
