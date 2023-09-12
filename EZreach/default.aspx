<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="default.aspx.vb" Inherits="Gayandn._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	
		<div class="row">
			<div class="col-sm-3 col-xs-12">
		<a href="costumers.aspx">
				<div class="tile-stats tile-red">
					<div class="icon"><i class="entypo-users"></i></div>

<asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsNumOfCostumers">
    <ItemTemplate>
					<div class="num" data-start="0" data-end="<%#Eval("numOfCostumers") %>" data-postfix="" data-duration="1500" data-delay="0">0</div>
        </ItemTemplate>
    </asp:Repeater>


		
					<h3>Registered users</h3>
					<p>so far in this application</p>
				</div>
		
			</div>
	</a>
    <a href="places.aspx">	
			<div class="col-sm-3 col-xs-12">
	
				<div class="tile-stats tile-green">
					<div class="icon"><i class="entypo-chart-bar"></i></div>
					<asp:Repeater ID="Repeater2" runat="server" DataSourceID="sdsNumOfPlaces">
    <ItemTemplate>
					<div class="num" data-start="0" data-end="<%#Eval("numOfPlaces") %>" data-postfix="" data-duration="1500" data-delay="0">0</div>
        </ItemTemplate>
    </asp:Repeater>
		
					<h3>Number of places</h3>
					<p>this is this application</p>
				</div>
		
			</div>
       </a>

			
			<div class="clear visible-xs"></div>
	<a href="pendingplaces.aspx">		
			<div class="col-sm-3 col-xs-12">
		
				<div class="tile-stats tile-aqua">
					<div class="icon"><i class="entypo-mail"></i></div>
                    
					<asp:Repeater ID="Repeater3" runat="server" DataSourceID="sdsNumOfPendingPlaces">
    <ItemTemplate>
					<div class="num" data-start="0" data-end="<%#Eval("numOfPlaces") %>" data-postfix="" data-duration="1500" data-delay="0">0</div>
        </ItemTemplate>
    </asp:Repeater>
		
					<h3>Pending places</h3>
					<p>Places waiting for approval</p>
				</div>
		
			</div>
</a>
	<a href="cities.aspx">		
			<div class="col-sm-3 col-xs-12">

				<div class="tile-stats tile-blue">
					<div class="icon"><i class="entypo-rss"></i></div>

	<asp:Repeater ID="Repeater4" runat="server" DataSourceID="sdsNumOfCities">
    <ItemTemplate>
					<div class="num" data-start="0" data-end="<%#Eval("numOfCities") %>" data-postfix="" data-duration="1500" data-delay="0">0</div>
        </ItemTemplate>
    </asp:Repeater>
		
					<h3>Cities</h3>
					<p>Number of cities</p>
				</div>
		
			</div>
        </a>
		</div>
		
		<br />
		
		<br />

		
		
		
			<div class="col-sm-12">
		
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">Latest Costumers</div>
		
						        <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>"
            DeleteCommand="DELETE FROM [t_sysUsers] WHERE [sysUser_id] = @sysUser_id"
            InsertCommand="INSERT INTO [t_sysUsers] ([f_name], [l_name], [role], [Phone], [email], [active],[user_pass],[city]) VALUES (@f_name, @l_name, @role, @Phone, @email, @active, @user_pass,@city)"
            SelectCommand="SELECT        t_sysUsers.sysUser_id, t_sysUsers.f_name, t_sysUsers.l_name, t_sysUsers.role, t_sysUsers.Phone, t_sysUsers.email, t_sysUsers.active, t_sysUsers.city , t_city.c_name FROM  t_sysUsers INNER JOIN t_city ON t_sysUsers.city = t_city.c_id WHERE  (t_sysUsers.role = 'user') ORDER BY t_sysUsers.sysUser_id DESC"
            UpdateCommand="UPDATE [t_sysUsers] SET [f_name] = @f_name, [l_name] = @l_name, [role] = @role, [Phone] = @Phone, [email] = @email, [active] = @active WHERE [sysUser_id] = @sysUser_id">
            
            <InsertParameters>
                <asp:ControlParameter ControlID="txtFname" Name="f_name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtLname" Name="l_name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlRole" Name="role" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtPhone" Name="Phone" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="CheckBoxActive" Name="active" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="txtEnPass" Name="user_pass" PropertyName="Value" />
                <asp:ControlParameter ControlID="ddlCity" Name="city" PropertyName="SelectedValue" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="f_name" Type="String" />
                <asp:Parameter Name="l_name" Type="String" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="sysUser_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


           <br />


        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered responsive" AutoGenerateColumns="False" DataKeyNames="sysUser_id" DataSourceID="sdsUsers" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="sysUser_id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="sysUser_id" />
                <asp:BoundField DataField="f_name" HeaderText="first name" SortExpression="f_name" />
                <asp:BoundField DataField="l_name" HeaderText="last  name" SortExpression="l_name" />
               
                
          
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
             <%--   <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />--%>
          
                <asp:CheckBoxField DataField="active" HeaderText="active" SortExpression="active" />
                 <asp:TemplateField HeaderText="City" SortExpression="city">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxCity" runat="server" Text='<%# Bind("c_name") %>'></asp:TextBox>

                    </EditItemTemplate>
                    <ItemTemplate>

                        <asp:Label ID="LabelCity" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
           </div>
		
			</div>
		
		</div>





	
	




	
	
	
	
<asp:SqlDataSource ID="sdsNumOfCostumers" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT  count(*) as numOfCostumers FROM [t_sysUsers] WHERE ([role] = @role)">
    <SelectParameters>
        <asp:Parameter DefaultValue="user" Name="role" Type="String" />
    </SelectParameters>
        </asp:SqlDataSource>

     <asp:SqlDataSource ID="sdsNumOfPlaces" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT  count(*) as numOfPlaces FROM [t_main] WHERE ([approved] = @approved)">
    <SelectParameters>
        <asp:Parameter DefaultValue="true" Name="approved" Type="String" />
    </SelectParameters>
        </asp:SqlDataSource>

      <asp:SqlDataSource ID="sdsNumOfPendingPlaces" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT  count(*) as numOfPlaces FROM [t_main] WHERE ([approved] = @approved)">
    <SelectParameters>
        <asp:Parameter DefaultValue="false" Name="approved" Type="String" />
    </SelectParameters>
        </asp:SqlDataSource>


          <asp:SqlDataSource ID="sdsNumOfCities" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT  count(*) as numOfCities FROM [t_city] ">
 
        </asp:SqlDataSource>

</asp:Content>
