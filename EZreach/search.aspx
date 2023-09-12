<%@ Page Title="" Language="vb" AutoEventWireup="false"  MasterPageFile="~/frontEnd.Master"  CodeBehind="search.aspx.vb" Inherits="Gayandn.search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
              <asp:Label ID="lblLong"  runat="server"  Text=""></asp:Label>
              <asp:Label ID="lblLat" runat="server"    Text=""></asp:Label>
    
             <asp:HiddenField ID="fSearchKeyword" runat="server" Visible="False" />

        <asp:SqlDataSource ID="sdsSearchLog" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>"
		
			InsertCommand="INSERT INTO t_searchLog(sl_Pnumber ) VALUES (@sl_Pnumber)"
			SelectCommand="SELECT TOP 5  [sl_Pnumber], [sl_date] FROM [t_searchLog]  order by sl_id DESC " ProviderName="System.Data.SqlClient" >
      
            <InsertParameters>
                <asp:ControlParameter ControlID="fSearchKeyword" Name="sl_Pnumber" PropertyName="Value" Type="String" />
                
            </InsertParameters>
   
              </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSearch" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="sbSearch" SelectCommandType="StoredProcedure" ProviderName="System.Data.SqlClient" >
                <SelectParameters>
                    <asp:ControlParameter ControlID="fSearchKeyword" Name="p_phoneNumber" PropertyName="Value" Type="String"  />
                </SelectParameters>
            
            </asp:SqlDataSource>
<section class="features-blocks">
	
	<div class="container">
		<div class="row">
			
			<div class="row vspace">
		
				<div class="panel panel-primary">
					<div class="panel-body">
               
                   <div class="row">
                       <div class="col-xs-12 ">
                    
                      
                          <div class="col-xs-12 col-md-6">
                   <asp:TextBox ID="tSearch" placeholder="Enter phone number" TextMode="number" CssClass="form-control col-xs-12 col-md-12" runat="server" ></asp:TextBox>
						
							  </div>
							  <div class="col-xs-12 col-md-3">
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tSearch"  ForeColor="red" ValidationGroup="gSearch" runat="server" ErrorMessage="Enter Phone number"></asp:RequiredFieldValidator>
                         
								</div>

						    <div class="col-xs-12 col-md-3">
                   <asp:Button ID="bSearch"  CssClass="btn btn-primary btn-block" ValidationGroup="gSearch" runat="server" Text="Search" />
                           </div>
                         
                       </div>
                   </div>
           <br />
               
                 
                <asp:Panel ID="PanelResultFound"  Visible="false" runat="server">
                    <div class="alert alert-success">
                            <h4>Result Found</h4>
                           
                    </div>
                 </asp:Panel>
                 


                        
               
                <asp:Panel ID="PanelNoResult" runat="server">
                    <div class="alert alert-danger">
                            <h4> No Results Found , phone number is not registered in system</h4>
                                  
                    </div>
                    </asp:Panel>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     
 <asp:Panel ID="PanelReultDetails"   runat="server">
    <div class="col-md-6 col-xs-12">
        <div class="row">
            <label>Scan this QR code using you phone QR code reader to get specific directions</label>
            <br />
<asp:PlaceHolder ID="plBarCode" runat="server" />
        </div>
          <div class="row">
 
			
              


				<table class="table table-bordered">
					<thead>
						<tr>
							<th width="20%">Field Name</th>
							<th width="80%">Field Value</th>
							
						</tr>
					</thead>
					
					<tbody>
						<tr>
						
							<td>ID</td>
							<td> <asp:Label ID="LabelId" runat="server" Text=""></asp:Label></td>
						</tr>
                        <tr>
						
							<td>Type</td>
							<td>   <asp:Label ID="LabelType" runat="server" Text=""></asp:Label></td>
						</tr>
                        <tr>
						
							<td>Longtitude</td>
							<td>              <asp:Label ID="LabelLong" ClientIDMode="Static" runat="server" Text=""></asp:Label></td>
						</tr>
                         <tr>
						
							<td>Latitude</td>
							<td>    <asp:Label ID="LabelLat" ClientIDMode="Static" runat="server" Text=""></asp:Label></td>
						</tr>
                        <tr>
						
							<td>Phone</td>
							<td>    <asp:Label ID="LabelPhone"  runat="server" Text=""></asp:Label></td>
						</tr>
                        <tr>
						
							<td>Name</td>
							<td>     <asp:Label ID="LabelName" runat="server" Text=""></asp:Label></td>
						</tr>
                        <tr>
						
							<td>City</td>
							<td>      <asp:Label ID="LabelCity" runat="server" Text=""></asp:Label></td>
						</tr> 
                     
                

                        
                        <tr>
						
						<td>Details</td>
							<td>       <asp:Label ID="LabelDescription" runat="server" Text=""></asp:Label></td>
						</tr>
						

						
					</tbody>
				</table>
				
	
</div></div>
    
      <div class="col-md-6 col-xs-12">
            <asp:Panel ID="PanelMap"  Visible="false" runat="server">
                    <div id="map"  style="width: auto; height:350px;">
                       </div>
            </asp:Panel>
      </div>



     </asp:Panel>
   </div>
  </div>
			

<%--showing search log--%>


		<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">Search Log</div>
						
						<div class="panel-options">
							
				
						
						</div>
					</div>
					
					<div class="panel-body">
						
               
                   <div class="row">
				<asp:GridView ID="GridView1" CssClass="table table-bordered responsive" runat="server" DataSourceID="sdsSearchLog" PageSize="5" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="sl_Pnumber" HeaderText="sl_Pnumber" SortExpression="sl_Pnumber" />
                        <asp:BoundField DataField="sl_date" HeaderText="sl_date" SortExpression="sl_date" />
                    </Columns>


				</asp:GridView>
			


					   </div>

			</div>
</div>
				



			</div>
            </div>
		</div>
	
    </section>
        
	
         <script src="assets/leaflet.js" ></script>

       <script>

           var InitialLat = document.getElementById('LabelLat').innerText;
           var InitialLong = document.getElementById('LabelLong').innerText;

        var dispaly = 'mapbox.streets'
        function test(a) {
             dispaly = a.options[a.selectedIndex].value;

        }

        var map = L.map('map', {
            zoomControl : true
        })
            .setView([InitialLat, InitialLong], 17);



        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
                maxZoom: 19,
            id: dispaly,
        }).addTo(map);

   

  
           var marker = L.marker([InitialLat, InitialLong]).addTo(map);
       var popup = marker.bindPopup('<b>Hello world!</b><br />I am a popup.');
       

    </script>
    

            	<!-- Bottom scripts (common) -->
	<script src="assets/js/gsap/TweenMax.min.js"></script>
	<script src="assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/neon-api.js"></script>


	<!-- Imported scripts on this page -->
	<script src="assets/js/neon-chat.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="assets/js/neon-custom.js"></script>


	<!-- Demo Settings -->
	<script src="assets/js/neon-demo.js"></script>
</asp:Content>