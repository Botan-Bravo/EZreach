<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="costumers.aspx.vb" Inherits="Gayandn.costumers" %>
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
      } 
  </script> 

       <div class="container-fluid">
      
           <div class="row">




               <asp:LinkButton ID="LinkButton4" CssClass="btn btn-primary" runat="server">Add new</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonCancel" CssClass="btn btn-warning" runat="server">Cancel</asp:LinkButton>
               
      <asp:Panel ID="PanelInsert" Visible="false"  runat="server">




     <hr>
        <div class="card mb-3">
           <div class="card-header">
             <i class="fas fa-new"></i>
            </div>
             <div class="card-body">
             <div class="table-responsive">

<%----------------------------adding new records------------------------------%>

                        <div class="form-group">
                            <asp:TextBox cssclass="form-control  rightAlign" ID="txtFname" runat="server" placeholder="First Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RQLong" runat="server"   ValidationGroup="mainInsert" ControlToValidate="txtFname" ErrorMessage=""></asp:RequiredFieldValidator>
                        </div>   
                         <div class="form-group">
                                <asp:TextBox cssclass="form-control  rightAlign" ID="txtLname" runat="server" placeholder="Last Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RQLat" runat="server"  ValidationGroup="mainInsert" ControlToValidate="txtLname" ErrorMessage=""></asp:RequiredFieldValidator>

                        </div> 
                        <div class="form-group">
                                <asp:TextBox cssclass="form-control  rightAlign" ID="txtPhone"  TextMode="Number" ValidationGroup="mainInsert" runat="server" placeholder="eg. 07701234567"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ValidationGroup="mainInsert" ControlToValidate="txtPhone" ErrorMessage=""></asp:RequiredFieldValidator>

                            </div>
                         
                        <div class="form-group">
                                <asp:TextBox cssclass="form-control   mode rightAlign" ID="txtEmail" TextMode="Email" runat="server" placeholder="Email Address"></asp:TextBox>

                            </div>
                         <div class="form-group">
                              
                             <asp:CheckBox  cssclass="form-control" ToolTip="Active"  Checked="true" ID="CheckBoxActive" runat="server" />

                         </div>  
                
                         <div class="form-group">
                            <asp:DropDownList ID="ddlRole" cssclass="form-control" Enabled="true" runat="server"  > 

                             
                                <asp:ListItem Value="user">User</asp:ListItem>
                     
                            </asp:DropDownList>
                             
                            <asp:RequiredFieldValidator ID="RQRole" runat="server" InitialValue="-1000"   ValidationGroup="mainInsert" ControlToValidate="ddlRole" ErrorMessage=""></asp:RequiredFieldValidator>
                        </div>   
                 



                         <div class="form-group">
                                    <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server" DataSourceID="sdsCities" DataTextField="c_name" DataValueField="c_id"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="mainInsert" ControlToValidate="ddlCity" ErrorMessage=""></asp:RequiredFieldValidator>
                          </div>

   <asp:SqlDataSource ID="sdsCities" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT [c_id], [c_name] FROM [t_city]"></asp:SqlDataSource>

                
                 <div class="form-group">


                         <asp:TextBox cssclass="form-control  rightAlign" ID="txtPass" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"    ValidationGroup="mainInsert" ControlToValidate="txtPass" ErrorMessage=""></asp:RequiredFieldValidator>

                     </div>   
                 
                 <div class="form-group">
                         <asp:TextBox cssclass="form-control  rightAlign" ID="txtConfPass" runat="server" TextMode="Password" placeholder="confirm Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"    ValidationGroup="mainInsert" ControlToValidate="txtConfPass" ErrorMessage=""></asp:RequiredFieldValidator>

                         <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="mainInsert" ErrorMessage="Passwords Don't Match" ControlToCompare="txtConfPass" ControlToValidate="txtPass" ForeColor="Red"></asp:CompareValidator>
                 </div>  
                        
                </div>

                <div class="form-group">
                    <asp:LinkButton ID="btnAdd" runat="server" OnClientClick="btnAdd_Click" ValidationGroup="mainInsert" CausesValidation="true" cssclass="btn btn-primary btn-block" >Insert</asp:LinkButton>
                </div>
                 <asp:HiddenField ID="txtEnPass" runat="server" />

     
                 
            <hr />

  <%---------------------------------------------end adding -------------%>
            </div>
         </div>
                 </asp:Panel>
           </div>
    
        <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>"
            DeleteCommand="DELETE FROM [t_sysUsers] WHERE [sysUser_id] = @sysUser_id"
            InsertCommand="INSERT INTO [t_sysUsers] ([f_name], [l_name], [role], [Phone], [email], [active],[user_pass],[city]) VALUES (@f_name, @l_name, @role, @Phone, @email, @active, @user_pass,@city)"
            SelectCommand="SELECT        t_sysUsers.sysUser_id, t_sysUsers.f_name, t_sysUsers.l_name, t_sysUsers.role, t_sysUsers.Phone, t_sysUsers.email, t_sysUsers.active, t_sysUsers.city , t_city.c_name FROM  t_sysUsers INNER JOIN t_city ON t_sysUsers.city = t_city.c_id WHERE  (t_sysUsers.role = 'user')  ORDER BY t_sysUsers.sysUser_id DESC"
            UpdateCommand="UPDATE [t_sysUsers] SET [f_name] = @f_name, [l_name] = @l_name, [Phone] = @Phone, [email] = @email, [active] = @active  WHERE [sysUser_id] = @sysUser_id">
            <DeleteParameters>
                <asp:Parameter Name="sysUser_id" Type="Int32" />
            </DeleteParameters>
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
                
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="sysUser_id" Type="Int32" />
               <%-- <asp:Parameter Name="city" Type="Int32" />--%>
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
             <%--       <EditItemTemplate>--%>
                       
    <%--                   <asp:DropDownList ID="ddlGridViewCity" runat="server" DataSourceID="sdsCities"   DataValueField="c_id" DataTextField="c_name"    SelectedValue='<%# Eval("city")%>'  >



                       </asp:DropDownList>--%>

                  <%--  </EditItemTemplate>--%>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>

                       


                     

                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Pass" >
                
                    <ItemTemplate>

                    <a ID="lblEditID"  href="changePassword.aspx?uid=<%#Eval("sysUser_id") %>" > <i class="glyphicon glyphicon-pencil"></i></a>


                    </ItemTemplate>
                 
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default btn-sm btn-icon icon-left" CausesValidation="False" CommandName="Edit" >

                            <i class="entypo-pencil"></i>
							Edit
                        </asp:LinkButton>
                                

                    </ItemTemplate> 
                    
            
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-danger btn-sm btn-icon icon-left" CausesValidation="False" CommandName="Delete" OnClientClick="try { return confirm('Are you sure you want to delete data'); } catch(e){alert(e.message);}" >

                                 <i class="entypo-cancel"></i>
							Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
           </div>
    




</asp:Content>
