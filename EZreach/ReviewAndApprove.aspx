<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="ReviewAndApprove.aspx.vb" Inherits="Gayandn.ReviewAndApprove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




         <asp:SqlDataSource ID="SqlDataSourceSearch" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" 
             SelectCommand="SELECT t_main.p_id, t_main.p_longitude, t_main.p_latitude, t_main.p_type, t_main.p_phoneNumber, isNull( t_main.p_name,'N/A') as p_name , isNull( t_main.description,'N/A') as description, isNull(t_main.update_date, 0) AS update_date

,isNull( t_main.creation_date,0) AS creation_date 

, t_main.approved, t_sysUsers.f_name, t_city.c_name, t_main.SysUser_fkey, t_main.city_fkey FROM t_main INNER JOIN t_city ON t_main.city_fkey = t_city.c_id INNER JOIN t_sysUsers ON t_main.SysUser_fkey = t_sysUsers.sysUser_id 

WHERE p_id=@p_id"  >
                <SelectParameters>
                    <asp:QueryStringParameter Name="p_id" QueryStringField="id" />
                </SelectParameters>
            
            </asp:SqlDataSource>
     <asp:SqlDataSource ID="sdsApprove" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" DeleteCommand="DELETE FROM [t_main] WHERE [p_id] = @p_id" InsertCommand="INSERT INTO [t_main] ([approved]) VALUES (@approved)" SelectCommand="SELECT [approved], [p_id] FROM [t_main]" UpdateCommand="UPDATE [t_main] SET [approved] = @approved WHERE [p_id] = @p_id">
       
         <UpdateParameters>
             <asp:Parameter DefaultValue="true" Name="approved" Type="Boolean" />
             <asp:QueryStringParameter DefaultValue="" Name="p_id" QueryStringField="id" Type="Int32" />
         </UpdateParameters>
       </asp:SqlDataSource>
     <div class="col-xs-12 col-xs-offset-1">
       <a href="places.aspx" class="btn btn-primary"> Back to places</a>
  <hr />
     
         <asp:LinkButton ID="linkApprove" OnCommand="linkApprove_Command" CssClass="btn btn-success" runat="server"  OnClientClick="try { return confirm('Are you sure you want approve'); } catch(e){alert(e.message);}">Approve</asp:LinkButton>

    <br />
       <br />
   
     	
			<div class="col-md-12">
				
				
              
				
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
						
						<td>Creation date</td>
							<td>       <asp:Label ID="LabelCreation" runat="server" Text=""></asp:Label></td>
						</tr> 
                        <tr>
						
						<td>User entered</td>
							<td>       <asp:Label ID="LabelUser" runat="server" Text=""></asp:Label></td>
						</tr> 

                        <tr>
						
						<td>Satus</td>
							<td>        <asp:Label ID="LabelApproved" runat="server" Text=""></asp:Label></td>
						</tr>
                        
                        <tr>
						
						<td>Update date</td>
							<td>       <asp:Label ID="LabelDescription" runat="server" Text=""></asp:Label></td>
						</tr>

						
						
					</tbody>
				</table>
				
			</div>


                
       



           
  <script type="text/javascript">
      function ValidatorUpdateDisplay(val) {
          if (typeof (val.display) == "string") {
              if (val.display == "None") {
                  return;
              }
              if (val.display == "Dynamic") {
                  val.style.display = val.isvalid ? "none" : "inline";
                  return;
              }
          }
          val.style.visibility = val.isvalid ? "hidden" : "visible";
          if (val.isvalid) {
              document.getElementById(val.controltovalidate).style.border = '1px solid #CCCCCC';
          }
          else {
              document.getElementById(val.controltovalidate).style.border = '1px solid red';
          }
      }

  </script> 

<br />

   <div class="container-fluid">
        
          <li class="breadcrumb-item active"> <h3>See place on map</h3>
       
          
    <div class="row">


      <div id="map"  style="width:auto; height:500px;">
     </div>

      </div>
     <hr>
        <div class="card mb-3">
    
             <div class="card-body">

                 
            <hr />

  <%---------------------------------------------end adding -------------%>
            </div>
         </div>
    
             
          

           <asp:SqlDataSource ID="sdsPlaces" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" 
               InsertCommand="INSERT INTO [t_main] ([p_longitude], [p_latitude], [p_type], [p_name], [district_fkey], [city_fkey], [description], [subDistrict_fkey], [SysUser_fkey]) VALUES (@p_longitude, @p_latitude, @p_type, @p_name, @district_fkey, @city_fkey, @description, @subDistrict_fkey, @SysUser_fkey)"
               DeleteCommand="Delete FROM  t_main where p_id=@p_id">
               <DeleteParameters>
                   <asp:Parameter Name="p_id" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:ControlParameter ControlID="txtLogitude" Name="p_longitude" PropertyName="Text" />
                   <asp:ControlParameter ControlID="txtLatitude" Name="p_latitude" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddlType" Name="p_type" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txtName" Name="p_name" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddlDistrict" Name="district_fkey" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="ddlCity" Name="city_fkey" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txtDescription" Name="description" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddlSubDistrict" Name="subDistrict_fkey" PropertyName="SelectedValue" />
                   <asp:SessionParameter DefaultValue="1" Name="SysUser_fkey" SessionField="userSession" />
               </InsertParameters>
           </asp:SqlDataSource>
        </div>
     </div>

    

     <br />



    </script>
     <script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js"
     integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg=="
     crossorigin=""></script>

    <script>

        var InitialLong = document.getElementById('LabelLong').innerText;
        var InitialLat = document.getElementById('LabelLat').innerText;

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

   

    


        L.marker([InitialLat, InitialLong]).addTo(map)


    </script>


</asp:Content>

