<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="auditor.ascx.vb" Inherits="delivery_system.auditor" %>
				<!-- add class "multiple-expanded" to allow multiple submenus to open -->
				<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
				<li class="active  active ">
					<a href="default.aspx">
						<i class="entypo-gauge"></i>
						<span class="title">Dashboard</span>
					</a>
					
				</li>

<%--costumers section--%>
                <li class="has-sub">
					<a href="costumers.aspx">
						<i class="entypo-layout"></i>
						<span class="title">Costumers</span>
					</a>
					<ul>
						<li>
							<a href="addCostumer.aspx">
								<span class="title">Add Costumer</span>
							</a>
						</li>
                        <li>
							<a href="layout-boxed.html">
								<span class="title">List of Costumers</span>
							</a>
						</li>
					</ul>
				</li>


<%--places section--%>


               <li class="has-sub">
					<a href="costumers.aspx">
						<i class="entypo-layout"></i>
						<span class="title">Places</span>
					</a>
					<ul>
						<li>
							<a href="addCostumer.aspx">
								<span class="title">Add Place</span>
							</a>
						</li>
                        <li>
							<a href="layout-boxed.html">
								<span class="title">List of Places</span>
							</a>
						</li>
					</ul>
				</li>


  <%--pending places section--%>
                
               <li>
					<a href="pendingPlaces.aspx">
						<i class="entypo-layout"></i>
						<span class="title">Pending Places</span>
					</a>
					
				</li>


