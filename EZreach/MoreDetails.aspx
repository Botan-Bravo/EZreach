<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frontEnd.Master" CodeBehind="MoreDetails.aspx.vb" Inherits="Gayandn.MoreDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    	<!-- Breadcrumb -->
<section class="portfolio-item-details">
	
	<div class="container">
		

	
		<!-- Portfolio Images Gallery -->
		<div class="row">
			<div class="col-md-12">
				
				<div class="item-images">
				
					<a href="#">
            <asp:Image ID="ImageShow" runat="server"  cssclass="img-rounded"/>
					</a>
					
		
					
				</div>
				
			</div>
		</div>
		

		
		<!-- Portfolio Description and Other Details -->
		<div class="row item-description">
						<div class="col-sm-2">
				
				<dl>
					<dt>	<asp:Label ID="lblType" runat="server" Text=""></asp:Label></dt>
						
						
				
				</dl>
				
			</div>
			<div class="col-sm-10">
				
		<p>	<asp:Label ID="labelDetails" runat="server" Text=""></asp:Label> 
		</p>
			</div>
			

			
		</div>
		
	</div>
	
</section>


</asp:Content>
