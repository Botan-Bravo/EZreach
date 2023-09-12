<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frontEnd.Master" CodeBehind="form.aspx.vb" Inherits="Gayandn.form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>--%>

             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>



     <asp:SqlDataSource ID="sdsCheckPhone" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT [p_id], [p_phoneNumber] FROM [t_main] WHERE ([p_phoneNumber] = @p_phoneNumber)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtPhone" Name="p_phoneNumber" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

     <div class="container-fluid">
  
    
                   
                       
         <h4 > Please mark your location on Map</h4>


                        <div  id="map" style=" width: auto; height: 400px; border:solid; border-color:purple;  ">
                        </div>

                   


                    <hr>
          
                    <div class="col-sm-6 col-xs-12  form-horizontal form-groups-bordered">

                                <%----------------------------adding new records------------------------------%>
                          <div class="form-group">
                        <asp:Label ID="lblLocationFeedback" runat="server" ></asp:Label>
                        </div>


                       <div class="form-group" style="display:none; ">
                                    <asp:TextBox CssClass="form-control  rightAlign "   ID="txtLogitude" ClientIDMode="Static" runat="server" ></asp:TextBox>
                                </div>
                                <div class="form-group" style="display:none;">
                                    <asp:TextBox CssClass="form-control  rightAlign"   ID="txtLatitude" ClientIDMode="Static" runat="server" ></asp:TextBox>
                                </div>
                       
                        <p id="myP"></p>
                                <div class="form-group">
                                    <label for="txtName" class="col-sm-3 control-label">Name*</label>
                                   <div class="col-sm-9">
                                    <asp:TextBox CssClass="form-control  rightAlign" ID="txtName" ValidationGroup="mainInsert" runat="server" placeholder="Enter your name"></asp:TextBox>
                                </div>
                                </div>

                            			<div class="form-group">
                                        <label for="txtPhone" class="col-sm-3 control-label">Phone number</label>
								
								<div class="col-sm-9">
									<div class="input-group">
                                        <span class="input-group-addon">964+</span>
										 <asp:TextBox CssClass="form-control  rightAlign" ID="txtPhone" runat="server" TextMode="Phone" placeholder="eg.  07701234567"></asp:TextBox>

										
                                 
                                           
									</div>
                                     <span  class="validate-has-error">
                                      <asp:RequiredFieldValidator ID="RQPhone" runat="server" ForeColor="red" ValidationGroup="mainInsert" ControlToValidate="txtPhone" ErrorMessage="Phone is required"></asp:RequiredFieldValidator>
                                    </span>
                                                                            <asp:Label ID="lblPhoneFeedback" ForeColor="red" runat="server" Text=""></asp:Label>

								</div>
							</div>   
                         

                                <div class="form-group">
                                    <label for="ddlType" class="col-sm-3 control-label">Type</label>
                                    <div class="col-sm-9">


                                     <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" DataSourceID="sdsType" DataTextField="t_name" DataValueField="t_name" AppendDataBoundItems="true" >
                                        <asp:ListItem Value="">Please select type</asp:ListItem>


                                    </asp:DropDownList>


                                        <span  class="validate-has-error">
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ValidationGroup="mainInsert" ControlToValidate="ddlType" ErrorMessage="Type is required"></asp:RequiredFieldValidator>
                                         </span>
                                     </div>
                               </div>

                         <div class="form-group">
                                    <label for="txtDescription" class="col-sm-3 control-label">Place description*</label>
                                  <div class="col-sm-9">
                                      <%--<CKEditor:CKEditorControl ID="txtDescription"  runat="server"></CKEditor:CKEditorControl>--%>
                               
                                 <asp:TextBox CssClass="form-control  rightAlign"   ID="txtDescription" ClientIDMode="Static" runat="server" placeholder="If place is in a building, please specify floor and falt number" TextMode="MultiLine" Height="118px"></asp:TextBox>

                                  
                                  </div>
                                  </div>
                 
                                <div class="form-group">
                                    
                                     <label for="ddlCity" class="col-sm-3 control-label">City</label>

                                    <div class="col-sm-9">
                                    <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server" DataSourceID="sdsCities" AppendDataBoundItems="true" DataTextField="c_name" DataValueField="c_id">

                                        <asp:ListItem value=""> Please Select</asp:ListItem>
                                    </asp:DropDownList>
                                  
                            <span  class="validate-has-error">
                                        <asp:RequiredFieldValidator ID="RQcity" runat="server" ValidationGroup="mainInsert" ForeColor="red" ControlToValidate="ddlCity" ErrorMessage="Required">

                                        </asp:RequiredFieldValidator>
                                  </span>     
                                    </div>
                               </div>
                          <div id="dvCaptcha">
    </div>
    <asp:TextBox ID="txtCaptcha" ClientIDMode="Static" runat="server" Style="display: none" />
    <asp:RequiredFieldValidator ID = "rfvCaptcha" ErrorMessage="Captcha validation is required."  ControlToValidate="txtCaptcha"
        runat="server" ForeColor = "Red" Display = "Dynamic" />
 
                                <%-- phone number --%>
                          

                            <div class="form-group">
                                <div  class="col-sm-2"></div>
                                <asp:LinkButton ID="btnAdd" runat="server"  style="background-color:#7032f6;" ValidationGroup="mainInsert" CausesValidation="true"  CssClass=" col-xs-12 col-sm-8 btn btn-success  ">Submit</asp:LinkButton>
                                <div  class="col-sm-2"></div>
                            </div>
                        <br />
                        <br />
                </div>
                            <%---------------------------------------------end adding -------------%>
                     <div class="col-sm-6  col-xs-offset-0 col-xs-12 ">
                <%--informative message--%>
                <div class="panel panel-invert" data-collapsed="0"><!-- setting the attribute data-collapsed="1" will collapse the panel -->
					
					<!-- panel head -->
					<div class="panel-heading ">
						<div class="panel-title">Guide for adding a new palce</div>
						
				
					</div>
					
					<!-- panel body -->
					<div class="panel-body content-section bg-gray ">
						
						<div class="scrollable col-sm-offset-1 col-xs-offset-0" data-height="400" data-scroll-position="right" data-rail-color="#fff" data-rail-opacity=".9" data-rail-width="8" data-rail-radius="10" data-autohide="0">

					
							
					
                            <ol>
                                <li dir="ltr" style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size:11pt;background-color:transparent;font-weight:400;font-style:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Locate where you are precisely by tapping on the map if smartphones or clicking on the map if PCs.</span></li>
                                <li dir="ltr" style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size:11pt;background-color:transparent;font-weight:400;font-style:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">In the&nbsp;</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">&nbsp;Name&nbsp;</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">enter your first and last name.</span></li>
                                <li dir="ltr" style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size:11pt;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">In the&nbsp;</span><span style="font-size:11pt;color:#000000;background-color:transparent;font-weight:700;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Phone Number</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">&nbsp;enter a valid phone number.</span></li>
                                <li dir="ltr" style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size:11pt;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">In the&nbsp;</span><span style="font-size:11pt;color:#000000;background-color:transparent;font-weight:700;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Type</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">&nbsp;Select the type of registered location.</span></li>
                                <li dir="ltr" style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size:11pt;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">In the&nbsp;</span><span style="font-size:11pt;color:#000000;background-color:transparent;font-weight:700;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Place Description</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">&nbsp;give a little description of the registered location. For example, if you are living in apartment, specify the floor and flat number.</span></li>
                                <li dir="ltr" style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size:11pt;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">In the&nbsp;</span><span style="font-size:11pt;color:#000000;background-color:transparent;font-weight:700;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">City</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">&nbsp;select the city where you live in.</span></li>
                                <li dir="ltr" style="line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style="font-size:11pt;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">In the&nbsp;</span><span style="font-size:11pt;color:#000000;background-color:transparent;font-weight:700;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">reCAPTCHA</span><span style="font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">&nbsp;verify you are not a robot by checking the box and selecting the required squares.</span></li>
                            </ol>
						</div>		
					</div>
					
				</div>
                         </div>
                    
          </div>




      
                <asp:SqlDataSource ID="sdsSelectForUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>"
                    SelectCommand="SELECT [p_id], [p_longitude], [p_latitude], [p_type], [p_phoneNumber], [p_name], [city_fkey], [description], [approved] FROM [t_main] WHERE [p_id]=@p_id">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="p_id" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
         


        <asp:SqlDataSource ID="sdsCities" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT * FROM [t_city]"></asp:SqlDataSource>

        <br />

   



        <asp:SqlDataSource ID="sdsType" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT [t_name] FROM [t_types]"></asp:SqlDataSource>


  <%--  <asp:UpdatePanel ID="panleRememberpin" Visible="false" runat="server">
        <ContentTemplate>--%>

    <script src="assets/leaflet.js" ></script>
 

            <script>
                var dispaly = 'mapbox.satellite'


                var map = L.map('map', {
                    
                })



                L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',

                    id: 'mapbox.satellite'
                }).addTo(map);

  <%  If Session("lat") = "" And Session("long") = "" Then%>
                map.locate({ setView: true, maxZoom: 16 });

<%          Else %>




                map.setView([document.getElementById('txtLatitude').value, document.getElementById('txtLogitude').value], 16);

  <% end if%>
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



                   <%  If Session("lat") <> "" And Session("long") <> "" Then%>


                var InitialLong = document.getElementById('txtLogitude').value 
                var InitialLat = document.getElementById('txtLatitude').value



                function test(a) {
                    dispaly = a.options[a.selectedIndex].value;

                }

           

                L.marker([InitialLat, InitialLong]).addTo(map).bindPopup("Old marker").openPopup();







    <%      End If %>
            </script>

 
    <%--    </ContentTemplate>

    </asp:UpdatePanel>--%>




</asp:Content>
