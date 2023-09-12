<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="changepassword.aspx.vb" Inherits="Gayandn.changepassword" %>
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
           <%--      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>--%>
           <div class="row">
               <div class="card-body">
             <div class="table-responsive">
                
                    <p> Old password was : <asp:Label ID="LblOldPass" runat="server" Text="Label"></asp:Label></p>
                  
                    

                     <div class="card mb-3">
           <div class="card-header">
             <i class="fas fa-new"></i>
            </div>
             <div class="card-body">
             <div class="table-responsive">

<%----------------------------updating password------------------------------%>

                  <div class="form-group">
                       <p>Update Password </p>
                     </div>   

                 <div class="form-group">
                         <asp:TextBox cssclass="form-control  rightAlign" ID="txtPass" TextMode="Password" runat="server" placeholder="New password"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"    ValidationGroup="mainUpdate" ControlToValidate="txtPass" ErrorMessage=""></asp:RequiredFieldValidator>

                 </div>   
                 
                 <div class="form-group">
                         <asp:TextBox cssclass="form-control  rightAlign" ID="txtConfPass" runat="server" TextMode="Password" placeholder="Repeat password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"    ValidationGroup="mainUpdate" ControlToValidate="txtConfPass" ErrorMessage=""></asp:RequiredFieldValidator>

                         <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords Don't Match"   ValidationGroup="mainUpdate" ControlToCompare="txtConfPass" ControlToValidate="txtPass" ForeColor="Red"></asp:CompareValidator>
                 </div>  
                        
                </div>

                <div class="form-group">
                    <asp:LinkButton ID="btnAdd" runat="server"  ValidationGroup="mainUpdate" CausesValidation="true" cssclass="btn btn-primary btn-block" >Reset</asp:LinkButton>
                </div>

                 <asp:HiddenField ID="txtEnPass" runat="server" />

     
                 
            <hr />

  <%---------------------------------------------end updating password -------------%>
            </div>
         </div>
          
                 </div>
                   </div>
               
           </div>
         </div>
            

           <asp:SqlDataSource ID="sdsChangePass" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" DeleteCommand="DELETE FROM [t_sysUsers] WHERE [sysUser_id] = @sysUser_id" InsertCommand="INSERT INTO [t_sysUsers] ([user_pass], [email]) VALUES (@user_pass, @email)" SelectCommand="SELECT [user_pass], [email], [sysUser_id] FROM [t_sysUsers] WHERE ([sysUser_id] = @sysUser_id)" UpdateCommand="UPDATE [t_sysUsers] SET [user_pass] = @user_pass WHERE [sysUser_id] = @sysUser_id">
               <DeleteParameters>
                   <asp:Parameter Name="sysUser_id" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="user_pass" Type="String" />
                   <asp:Parameter Name="email" Type="String" />
               </InsertParameters>
               <SelectParameters>
                   <asp:QueryStringParameter Name="sysUser_id" QueryStringField="uid" Type="Int32" />
               </SelectParameters>
               <UpdateParameters>
                   <asp:ControlParameter ControlID="txtEnPass" Name="user_pass" PropertyName="Value" Type="String" />
                   <asp:QueryStringParameter Name="sysUser_id" QueryStringField="uid" Type="Int32" />
               </UpdateParameters>
           </asp:SqlDataSource>

</asp:Content>
