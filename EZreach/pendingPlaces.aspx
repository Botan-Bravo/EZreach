<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="pendingPlaces.aspx.vb" Inherits="Gayandn.pendingPlaces" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
            	<div class="row">


                    <asp:GridView ID="gvPlaces" runat="server" CssClass="table table-bordered responsive" AutoGenerateColumns="False" DataKeyNames="p_id" DataSourceID="sdsPlaces" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:TemplateField HeaderText="#"  InsertVisible="False" SortExpression="p_id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("p_id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("p_id") %>'></asp:Label>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
              
                        <asp:BoundField DataField="p_type" HeaderText="Type" SortExpression="p_type" />
                        <asp:BoundField DataField="p_phoneNumber" HeaderText="Phone" SortExpression="p_phoneNumber" />
                        <asp:BoundField DataField="p_name" HeaderText="Name" SortExpression="p_name" />
                        <asp:BoundField DataField="creation_date" HeaderText="Date" SortExpression="creation_date" />
                        <asp:CheckBoxField DataField="approved" HeaderText="Approved" SortExpression="approved" />
                        <asp:BoundField DataField="c_name" HeaderText="City" SortExpression="c_name" />


                           <asp:TemplateField HeaderText="Review and approve">

                            <ItemTemplate>
                                <a id="lblEditID" class="btn btn-default btn-sm btn-icon icon-left" href="ReviewAndApprove.aspx?id=<%#Eval("p_id") %>"><i class="entypo-pencil"></i>
							Approve</a>

                            
						</a>
                            </ItemTemplate>
                        </asp:TemplateField>


                     
                    </Columns>
                        <EmptyDataTemplate>
                            <div class="col-md-12">
                                <div class="alert alert-success">
                                    <strong>NO pending places!</strong>&nbsp; there is no pending places waiting for approval</div>
                            </div>
                        </EmptyDataTemplate>
                    <PagerStyle CssClass="dataTables_paginate paging_simple_numbers" />
                </asp:GridView>




            <asp:SqlDataSource ID="sdsPlaces" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT t_main.p_id, t_main.p_longitude, t_main.p_latitude, t_main.p_type, t_main.p_phoneNumber, SUBSTRING(t_main.p_name, 1, 10)  AS p_name
                , t_main.description, t_main.update_date, t_main.creation_date, t_main.approved, t_sysUsers.f_name, t_city.c_name, t_main.SysUser_fkey, t_main.city_fkey FROM t_main INNER JOIN t_city ON t_main.city_fkey = t_city.c_id INNER JOIN t_sysUsers ON t_main.SysUser_fkey = t_sysUsers.sysUser_id
                WHERE   t_main.approved='0' ORDER BY p_id DESC" UpdateCommand="UPDATE [t_main] SET   [approved] = @approved, [SysUser_fkey] = @SysUser_fkey WHERE [p_id] = @p_id">
                <UpdateParameters>
                    <asp:Parameter DefaultValue="1" Name="approved" />
                    <asp:Parameter DefaultValue="" Name="SysUser_fkey" />
                    <asp:Parameter Name="p_id" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsSelectForUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>"
                SelectCommand="SELECT [p_id], [p_longitude], [p_latitude], [p_type], [p_phoneNumber], [p_name], [city_fkey], [description], [approved] FROM [t_main] WHERE [p_id]=@p_id">
                <SelectParameters>
                    <asp:QueryStringParameter Name="p_id" QueryStringField="id" />
                </SelectParameters>
       </asp:SqlDataSource>


        </div>
        </div>
</asp:Content>

