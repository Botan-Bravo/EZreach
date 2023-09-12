<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frontEnd.Master" CodeBehind="approval.aspx.vb" Inherits="Gayandn.approval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <asp:SqlDataSource ID="sdsPlaces" runat="server" InsertCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" 
                    InsertCommand="sprInsertPublicForm" >
            
                    <InsertParameters>

                        <asp:SessionParameter Name="p_longitude" SessionField="long" Type="String" />
                        <asp:SessionParameter Name="p_latitude" SessionField="lat" Type="String" />
                        <asp:SessionParameter Name="p_type" SessionField="typ" Type="String" />
                        <asp:SessionParameter Name="p_phoneNumber" SessionField="phn" Type="String" />
                        <asp:SessionParameter Name="p_name" SessionField="nme" Type="String" />
                        <asp:SessionParameter Name="city_fkey" SessionField="cty" Type="String" />
                        <asp:SessionParameter Name="description" SessionField="desc" Type="String" />
                        <asp:Parameter DefaultValue="False" Name="approved" Type="Boolean" />
                        <asp:Parameter DefaultValue="4" Name="SysUser_fkey" Type="Int32" />
                    </InsertParameters>
                   
                </asp:SqlDataSource>
          <div class="container-fluid">
              <div class="col-md-12">
				
				
              
				<div class="row">   

                   <div class="form-group">
                     
                             <div class='alert alert-Defualt '>
   <%     If Request.QueryString("approved") = "yes" Then %>


                              
                            

    <%else %>
                           <h3> Please double check entered information and click submit </h3>      
<%end if %>


				        </div>
                            </div>
        
               


                  
 </div>


 
   <div class="col-sm-12 col-xs-12  form-horizontal form-groups-bordered">   
                   <asp:LinkButton ID="linkbtoonEdit"     CssClass="btn btn-success col-sm-2 col-xs-12" ValidationGroup="edit" CausesValidation="true" runat="server">Edit</asp:LinkButton>

                   <asp:LinkButton ID="LinkButtonShowFormHideConfirm"   style="background-color:#7032f6;"  CssClass="btn btn-success col-sm-2 col-xs-12" ValidationGroup="smsConfirmation" CausesValidation="true" runat="server">Submit</asp:LinkButton>

               <hr />
                  </div>         
                
     



				<table class="table table-bordered">
             
					<thead>
						<tr>
							<th width="20%"> Name</th>
							<th width="80%"> Value</th>
							
						</tr>
					</thead>
					
					<tbody>
					
                       
                        
                         
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
						
							<td>Type</td>
							<td>   <asp:Label ID="LabelType" runat="server" Text=""></asp:Label></td>
						</tr>


                        <tr>
						
						<td>Description</td>
							<td>       <asp:Label ID="LabelDescription" runat="server" Text=""></asp:Label></td>
						</tr>

                         <tr >
						
							<td>Longtitude</td>
							<td>              <asp:Label ID="LabelLong" ClientIDMode="Static" runat="server" Text=""></asp:Label></td>
						</tr>
                         <tr >
						
							<td>Latitude</td>
							<td>    <asp:Label ID="LabelLat" ClientIDMode="Static" runat="server" Text=""></asp:Label></td>
						</tr>


						
						
					</tbody>
				</table>


        <div class="row">


      <div id="mapDisplayForReview"  style="width:auto; height:250px; margin-right:30px;">
     </div>
                     </div>
                  <hr />
				
			</div>
        

  <script src="assets/leaflet.js" ></script>

    <script>

        var InitialLong = document.getElementById('LabelLong').innerText;
        var InitialLat = document.getElementById('LabelLat').innerText;

        var dispaly = 'mapbox.streets'
        function test(a) {
             dispaly = a.options[a.selectedIndex].value;

        }

        var map = L.map('mapDisplayForReview', {
            zoomControl : true
        })
            .setView([InitialLat, InitialLong], 15);



        L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
                maxZoom: 19,
            id: dispaly,
        }).addTo(map);

   

    


        L.marker([InitialLat, InitialLong]).addTo(map)


    </script>
     
         </div>



</asp:Content>

