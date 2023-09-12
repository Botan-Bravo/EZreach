<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="places.aspx.vb" Inherits="Gayandn.places" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       
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
      }</script> 



     <asp:SqlDataSource ID="sdsCheckPhone" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT [p_id], [p_phoneNumber] FROM [t_main] WHERE ([p_phoneNumber] = @p_phoneNumber)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtPhone" Name="p_phoneNumber" PropertyName="Text" Type="String" />
                </SelectParameters>
       </asp:SqlDataSource>  
    
    
    <asp:SqlDataSource ID="sdsType" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT [t_name] FROM [t_types]"></asp:SqlDataSource>
          


            <div class="container-fluid">
                <br />

                <div class="row">

                    <div class="col-xs-12">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="btnAdd_Click" ValidationGroup="mainInsert" CausesValidation="true" CssClass="btn btn-primary">add new</asp:LinkButton>
                             <asp:LinkButton ID="LinkButtonCancel" CssClass="btn btn-warning" runat="server">Cancel</asp:LinkButton>
                        
                    </div>
                    <div class="col-xs-4 xol-xs-offset-4">
                        <%--   <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">

                                  <asp:ListItem Value="mapbox.streets">Street view</asp:ListItem>
                                  <asp:ListItem Value="mapbox.Satellite">Satellite view</asp:ListItem>
                              </asp:DropDownList>--%>
                    </div>
                </div>
                <hr>

                <asp:Panel ID="PanelMapUpdate" Visible="false" runat="server">
                    <div class="row">
                        <span class="pos">,  </span>

                        <div id="mapp" style=" width: auto; height: 350px; border:solid; border-color:purple;  ">
                        </div>

                    </div>

                </asp:Panel>

    
                <asp:Panel ID="PanelInsert" Visible="false" runat="server">
                    <div class="row">
                        <span class="pos">,  </span>

                        <div id="map"  style=" width: auto; height: 350px; border:solid; border-color:purple;  ">
                        </div>

                    </div>



                    <hr>
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-new"></i>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

                                <%----------------------------adding new records------------------------------%>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtLogitude"  ClientIDMode="Static" runat="server" placeholder="Enter Logitude"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RQLong" runat="server" ValidationGroup="mainInsert" ControlToValidate="txtLogitude" ErrorMessage=""></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtLatitude"  ClientIDMode="Static" runat="server" placeholder="Enter Latitude"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RQLat" runat="server" ValidationGroup="mainInsert" ControlToValidate="txtLatitude" ErrorMessage=""></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtName" ValidationGroup="mainInsert" runat="server" placeholder="Enter Name"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtDescription" runat="server" placeholder="Enter Description" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtPhone" runat="server" TextMode="Phone" placeholder="Enter phone number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RQPhone" runat="server" ValidationGroup="mainInsert" ControlToValidate="txtPhone" ErrorMessage=""></asp:RequiredFieldValidator>
                                    <asp:Label ID="lblPhoneFeedback" ForeColor="red" runat="server" Text=""></asp:Label>
                                </div>

                                <div class="form-group">

                        
                                    <asp:DropDownList ID="ddlType" runat="server" DataSourceID="sdsType" DataTextField="t_name" DataValueField="t_name" AppendDataBoundItems="true" >
                                        <asp:ListItem Value=""> Select Type</asp:ListItem>


                                    </asp:DropDownList>


                  

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="mainInsert" ControlToValidate="ddlType" ErrorMessage=""></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server" DataSourceID="sdsCities" DataTextField="c_name" DataValueField="c_id"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RQcity" runat="server" ValidationGroup="mainInsert" ControlToValidate="ddlCity" ErrorMessage=""></asp:RequiredFieldValidator>
                                </div>

                                <%-- phone number --%>
                            </div>

                            <div class="form-group">
                                <asp:LinkButton ID="btnAdd" runat="server" OnClientClick="btnAdd_Click" ValidationGroup="mainInsert" CausesValidation="true" CssClass="btn btn-primary btn-block">Insert</asp:LinkButton>
                            </div>



                            <hr />

                            <%---------------------------------------------end adding -------------%>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="Panelupdate" Visible="false" runat="server">

                    <hr>
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-new"></i>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

                                <%----------------------------Updating ------------------------------%>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtLogitudeUpdate" ClientIDMode="Static" runat="server" placeholder="Enter Logitude"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="mainUpdate" ControlToValidate="txtLogitudeUpdate" ErrorMessage=""></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtLatitudeUpdate" ClientIDMode="Static" runat="server" placeholder="Enter Latitude"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="mainUpdate" ControlToValidate="txtLatitudeUpdate" ErrorMessage=""></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtNameUpdate" ValidationGroup="mainUpdate" runat="server" placeholder="Enter Name"></asp:TextBox>
                                </div>

                                <div class="form-group">


                                    <asp:TextBox CssClass="form-control  rightAlign"  ID="txtDescriptionUpdate" runat="server" placeholder="Enter Description"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtPhoneUpdate" runat="server" TextMode="Phone" placeholder="Enter phone number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="mainUpdate" ControlToValidate="txtPhoneUpdate" ErrorMessage=""></asp:RequiredFieldValidator>
                                    <asp:Label ID="Label1" ForeColor="red" runat="server" Text=""></asp:Label>
                                </div>

                                <div class="form-group">

                                     <asp:DropDownList ID="ddlTypeUpdate" runat="server" DataSourceID="sdsType" DataTextField="t_name" DataValueField="t_name" AppendDataBoundItems="true"   >
                                        <asp:ListItem Value=""> Select Type</asp:ListItem>


                                    </asp:DropDownList>



                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="mainUpdate" ControlToValidate="ddlTypeUpdate" ErrorMessage=""></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:DropDownList ID="ddlCitiesUpdate" CssClass="form-control" runat="server" DataSourceID="sdsCities" DataTextField="c_name" DataValueField="c_id" AppendDataBoundItems="true">


                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="mainUpdate" ControlToValidate="ddlCitiesUpdate" ErrorMessage=""></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:CheckBox CssClass="form-control" ID="CheckBoxApprovedUpdate" runat="server" />
                                </div>


                                <%-- phone --%>
                            </div>

                            <div class="form-group">
                                <asp:LinkButton ID="Button_update" runat="server" OnClientClick="" ValidationGroup="mainUpdate" CausesValidation="true" CssClass="btn btn-success btn-block">Update</asp:LinkButton>
                            </div>

                            <hr />

                            <%---------------------------------------------end Updating -------------%>
                        </div>
                    </div>
                </asp:Panel>
     <asp:Panel ID="panelGridView"  runat="server">
                <asp:GridView ID="gvPlaces" runat="server" CssClass="table table-bordered responsive" AutoGenerateColumns="False" DataKeyNames="p_id" DataSourceID="sdsPlaces" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="p_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="p_id" />
              
                        <asp:BoundField DataField="p_type" HeaderText="Type" SortExpression="p_type" />
                        <asp:BoundField DataField="p_phoneNumber" HeaderText="Phone" SortExpression="p_phoneNumber" />
                        <asp:BoundField DataField="p_name" HeaderText="Name" SortExpression="p_name" />
                       
                        
                        <asp:BoundField DataField="creation_date"  HeaderText="Date" SortExpression="creation_date" />
                        <asp:CheckBoxField DataField="approved"  HeaderText="Approved" SortExpression="approved" />
                        <asp:BoundField DataField="f_name"  HeaderText="User entered" SortExpression="f_name" />
                        <asp:BoundField DataField="c_name" HeaderText="City" SortExpression="c_name" />
          
                        <asp:TemplateField HeaderText="View">

                            <ItemTemplate>
                                <a id="lbtnAddCities" href="Display.aspx?id=<%#Eval("p_id") %>"><i class="glyphicon glyphicon-eye-open"></i></a>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit">

                            <ItemTemplate>
                                <a id="lblEditID" class="btn btn-default btn-sm btn-icon icon-left" href="places.aspx?id=<%#Eval("p_id") %>"><i class="entypo-pencil"></i>
							Edit</a>

                            
						</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">


                            <ItemTemplate>
                                &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-danger btn-sm btn-icon icon-left" CausesValidation="False" OnClientClick="try { return confirm('Are you sure you want to delete data'); } catch(e){alert(e.message);}" CommandName="Delete" Text="Delete">

                                    <i class="entypo-cancel"></i>
							Delete
                                      </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="dataTables_paginate paging_simple_numbers" />
                </asp:GridView>
</asp:Panel>

                <asp:SqlDataSource ID="sdsPlaces" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>"
                    SelectCommand="SELECT t_main.p_id, t_main.p_longitude, t_main.p_latitude, t_main.p_type, t_main.p_phoneNumber, SUBSTRING(t_main.p_name, 1, 10)  AS p_name
                                    , t_main.description, t_main.update_date, t_main.creation_date, t_main.approved, t_sysUsers.f_name, t_city.c_name, t_main.SysUser_fkey, t_main.city_fkey FROM t_main INNER JOIN t_city ON t_main.city_fkey = t_city.c_id INNER JOIN t_sysUsers ON t_main.SysUser_fkey = t_sysUsers.sysUser_id ORDER BY p_id DESC"
                    DeleteCommand="DELETE FROM [t_main] WHERE [p_id] = @p_id"
                    InsertCommand="INSERT INTO [t_main] ([p_longitude], [p_latitude], [p_type], [p_phoneNumber], [p_name], [city_fkey], [description],  [approved], [SysUser_fkey]) VALUES (@p_longitude, @p_latitude, @p_type, @p_phoneNumber, @p_name, @city_fkey, @description, @approved, @SysUser_fkey)"
                    UpdateCommand="UPDATE [t_main] SET [p_longitude] = @p_longitude, [p_latitude] = @p_latitude, [p_type] = @p_type, [p_phoneNumber] = @p_phoneNumber, [p_name] = @p_name, [city_fkey] = @city_fkey, [description] = @description,  [approved] = @approved, [SysUser_fkey] = @SysUser_fkey WHERE [p_id] = @p_id">
                    <DeleteParameters>
                        <asp:Parameter Name="p_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtLogitude" Name="p_longitude" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtLatitude" Name="p_latitude" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlType" Name="p_type" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtPhone" Name="p_phoneNumber" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtName" Name="p_name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlCity" Name="city_fkey" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtDescription" Name="description" PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="approved" Type="Boolean" />
                        <asp:SessionParameter DefaultValue="1" Name="SysUser_fkey" SessionField="u_id" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtLogitudeUpdate" Name="p_longitude" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtLatitudeUpdate" Name="p_latitude" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlTypeUpdate" Name="p_type" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtPhoneUpdate" Name="p_phoneNumber" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtNameUpdate" Name="p_name" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ddlCitiesUpdate" Name="city_fkey" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtDescriptionUpdate" Name="description" PropertyName="Text" />
                        <asp:ControlParameter ControlID="CheckBoxApprovedUpdate" Name="approved" PropertyName="Checked" />
                        <asp:SessionParameter DefaultValue="1" Name="SysUser_fkey" SessionField="u_id" />
                        <asp:QueryStringParameter Name="p_id" QueryStringField="id" DefaultValue="" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsSelectForUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>"
                    SelectCommand="SELECT [p_id], [p_longitude], [p_latitude], [p_type], [p_phoneNumber], [p_name], [city_fkey], [description], [approved] FROM [t_main] WHERE [p_id]=@p_id">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="p_id" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
      
    


        <asp:SqlDataSource ID="sdsCities" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT c_id, c_name FROM [t_city]"></asp:SqlDataSource>

    

    
    
        <script src="assets/leaflet.js" ></script>
        <asp:Panel ID="PanelScriptInsert" Visible="false" runat="server">

            <script>
                var dispaly = 'mapbox.satellite'


                var map = L.map('map', {
                    zoomControl: false
                })



                L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
                    maxZoom: 19,
                    id: 'mapbox.satellite'
                }).addTo(map);

                map.locate({ setView: true, maxZoom: 16 });

                var theMarker = {};

                map.on('click', function (e) {
                    lat = e.latlng.lat;
                    lon = e.latlng.lng;



                    if (theMarker != undefined) {
                        map.removeLayer(theMarker);
                    };

                    //Add a marker 
                    theMarker = L.marker([lat, lon]).addTo(map);

                    document.getElementById('txtLatitude').value = lat
                    document.getElementById('txtLogitude').value = lon
                });
            </script>

        </asp:Panel>


        <asp:Panel ID="PanelScriptUpdate" Visible="false" runat="server">

            <script>
                var dispaly = 'mapbox.satellite'

                var InitialLatt = document.getElementById('txtLatitudeUpdate').value;
                var InitialLongg = document.getElementById('txtLogitudeUpdate').value;


                var mapp = L.map('mapp', {
                    zoomControl: true
                })
                    .setView([InitialLatt, InitialLongg], 15);


                L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
                    maxZoom: 19,
                    id: dispaly,
                }).addTo(mapp);


                var marker = L.marker([InitialLatt, InitialLongg]).addTo(mapp);

                mapp.on('click', function (e) {


                    let tmp = L.marker([e.latlng.lat, e.latlng.lng]).addTo(mapp);



                    document.getElementById('txtLatitudeUpdate').value = e.latlng.lat
                    document.getElementById('txtLatitude').value = e.latlng.lng
                });
            </script>

        </asp:Panel>
        <asp:SqlDataSource ID="sdsPlacesToMap" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT [p_longitude], [p_latitude], [p_id] FROM [t_main]"></asp:SqlDataSource>




</asp:Content>
