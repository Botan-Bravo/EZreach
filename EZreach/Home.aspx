<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frontEnd.Master" CodeBehind="Home.aspx.vb" Inherits="Gayandn.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="slider-container" style="background-image: url(assetsFrontEnd/images/slide-img-1-bg.png);">
	
	<div class="container">
		
		<div class="row">
			
			<div class="col-md-12">
				
				<div class="slides">
					
					<!-- Slide 1 -->
					<div class="slide">
					
						<div class="slide-content">
							<h2>
								<small>Why EZreach ?</small>
								Use your phone number as a refrence on map
							</h2>
							
							<p>
								Register in Ezreach once and get your deliveries right to your location
							</p>
						</div>
						
						<div class="slide-image">
							
							<a href="Home.aspx">
								<img src="assetsFrontEnd/images/slider1.png" class="img-responsive" />
							</a>
						</div>
						
					</div>
					
					<!-- Slide 2 -->
					<div class="slide" data-bg="assetsFrontEnd/images/slider2.png">
						
						<div class="slide-image">
							
							<a href="home.aspx">
								<img src="assetsFrontEnd/images/slider2.png" class="img-responsive" />
							</a>
						</div>
					
						<div class="slide-content text-right">
							<h2>
								<small>Why EZreach ?</small>
								One search away form delivery destination
							</h2>
							
							<p>
								Once you get a costumer call & orders ,
								you can locate the delivery destination and follow the best route on the map to deliver the ordered packages
							</p>
							
						</div>
						
					</div>
					
					<!-- Slide 3 -->
					<div class="slide">
					
						<div class="slide-content">
							<h2>
								<small>EZreach</small>
								You order we deliver
							</h2>
							
							<p>
								Ezreach helps the sellers to deliver packages to the exact location of the costumers using costumer's refrence in our databse 
								regardless of cities and boundaries
							</p>
						</div>
						
						<div class="slide-image">
							
							<a href="#">
								<img src="assetsFrontEnd/images/slider3.png" class="img-responsive" />
							</a>
						</div>
						
					</div>
					
					<!-- Slider navigation -->
					<div class="slides-nextprev-nav">
						<a href="#" class="prev">
							<i class="entypo-left-open-mini"></i>
						</a>
						<a href="#" class="next">
							<i class="entypo-right-open-mini"></i>
						</a>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
	
</section>
<!-- Features Blocks -->
<section class="features-blocks">
	
	<div class="container">
		
		<div class="row vspace"><!-- "vspace" class is added to distinct this row -->
			
			<div class="col-sm-4">
				
				<div class="feature-block">
					<h3>
						<i class="entypo-cog"></i>
						Refrence on map
					</h3>
					
					<p>
								Form now on, every individual can mark their location on the map using their phone number. Once the registration was done successfully, they get confirmation and their unique pin code.
					</p>
				</div>
				
			</div>
			
			<div class="col-sm-4">
				
				<div class="feature-block">
					<h3>
						<i class="entypo-gauge"></i>
						Delivery method
					</h3>
					
					<p>
						Register your location on map once and start ordering items only by calling the provider. Using your phone number and your pin number the provider can location and deliver the packe right to you.
					</p>
				</div>
				
			</div>
			
			<div class="col-sm-4">
				
				<div class="feature-block">
					<h3>
						<i class="entypo-lifebuoy"></i>
						24/7 Support
					</h3>
					
					<p>
						EZreach smart delivery system is always online, and 24/7 serving its customers and users.
Whenever you faced obstacles, you can reach out to us by calling or emailing the mentioned
number or email below.
					</p>
				</div>
				
			</div>
			
		</div>
		
		<!-- Separator -->
		<div class="row">
			<div class="col-md-12">
				<hr />
			</div>
		</div>
		
	</div>
	
</section>


<!-- Portfolio -->
<section class="portfolio-widget">
	
	<div class="container">
		
		<div class="row">
			
			<div class="col-sm-3">
				
				<div class="portfolio-info">
					<h3>
						<a href="#">Who can use EZreach and for what purpose?</a>
					</h3>
					
					<p>In EZreach smart delivery system, there are 3 types of usage, which they use EZreach
						differently, and they are completing one another.</p>
				</div>
				
			</div>
			
			<div class="col-sm-3">
				
				<!-- Portfolio Item in Widget -->
				<div class="portfolio-item">
					<a href="moreDetails.aspx?type=1" class="image">
						<img src="assetsFrontEnd/images/admins.png" class="img-rounded" />
						<span class="hover-zoom"></span>
					</a>
					
					<h4>
						
						
						<a href="moreDetails.aspx?type=1" class="name">Admins</a>
					</h4>
					
					<div class="categories">
						<a href="moreDetails.aspx?type=1">Monitoring and maintanance</a>
					</div>
				</div>
				
			</div>
			
			<div class="col-sm-3">
				
				<!-- Portfolio Item in Widget -->
				<div class="portfolio-item">
						<a href="moreDetails.aspx?type=2" class="image">
						<img src="assetsFrontEnd/images/Suppliers.png" class="img-rounded" />
						<span class="hover-zoom"></span>
					</a>
					
					<h4>
				
						
						<a href="moreDetails.aspx?type=2" class="name">Suppliers</a>
					</h4>
					
					<div class="categories">
						<a href="portfolio-single.html">Delivery senders</a>
					</div>
				</div>
				
			</div>
			
			<div class="col-sm-3">
				
				<!-- Portfolio Item in Widget -->
				<div class="portfolio-item">
						<a href="moreDetails.aspx?type=3" class="image">
						<img src="assetsFrontEnd/images/users.png" class="img-rounded" />
						<span class="hover-zoom"></span>
					</a>
					
					<h4>
					
						
						<a href="moreDetails.aspx?type=3" class="name">Users</a>
					</h4>
					
					<div class="categories">
						<a href="portfolio-single.html">Delivery recivers</a>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
	
</section>
<!-- Call for Action Button -->
<div class="container">
	<div class="row vspace">
		<div class="col-md-12">
			
			<div class="callout-action">
				<h2>Register your location now</h2>
				
				<div class="callout-button">
					<a href="form.aspx" style="background-color:#7032f6;" class="btn btn-secondary">Register</a>
				</div>
			</div>
			
		</div>
	</div>
</div>
<!-- Testimonails -->
<section class="testimonials-container">
	
	<div class="container">
		
		<div class="col-md-12">
			
			<div class="testimonials carousel slide" data-interval="8000">
			
				<div class="carousel-inner">
					
					<div class="item active">
					
						<blockquote>
							<p>
								Choose wisley, choose EZ reach. The right delivery service at the right time. In addition, Connecting People from all around Iraq with shopes continuously.
									We are available 24/7 so that we get your delivery order done
							</p>
							<small>
								<cite>EZreach </cite>  for Shops and Restaurants
							</small>
						</blockquote>
						
					</div>
					
					<div class="item">
					
						<blockquote>
							<p>
								Simplicity is the Ultimate Sophistication, So EZreach brought that easiness for you in order to shope freely from all around Iraq regardless 
								how hard your location is to find.
							</p>
							<small>
								<cite>EZreach</cite> facilitates delivery
							</small>
						</blockquote>
						
					</div>
					
					<div class="item">
					
						<blockquote>
							<p>
								Bridge That Gap with EZ reach delivery service. No more worries of ordering packages.
								Trust EZ reach so that you get what you want at the right place you give.
							</p>
							<small>
								<cite>EZreach</cite>  centralized palatform for delivery refrences on map
							</small>
						</blockquote>
						
					</div>
				
				</div>
			
			</div>
			
		</div>
		
	</div>
	
</section>

<!-- Client Logos -->

	<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h3>Our clients</h3>
			
		
		</div>
	</div>
</div>
<section class="clients-logos-container">
	
	<div class="container">
		
		<div class="row">
			
			<div class="client-logos carousel slide" data-ride="carousel" data-interval="5000">
			
				<div class="carousel-inner">
				
					<div class="item active">
						
						<a href="#">
							<img src="assets/images/client-logo-1.png" />
						</a>
						
						<a href="#">
							<img src="assets/images/client-logo-1.png" />
						</a>
						
						<a href="#">
							<img src="assets/images/client-logo-1.png" />
						</a>
						
						<a href="#">
							<img src="assets/images/client-logo-1.png" />
						</a>
						
					</div>
					
					<div class="item">
						
						<a href="#">
							<img src="assets/images/client-logo-1.png" />
						</a>
						
						<a href="#">
							<img src="assets/images/client-logo-1.png" />
						</a>
						
						<a href="#">
							<img src="assets/images/client-logo-1.png" />
						</a>
						
						<a href="#">
							<img src="assets/images/client-logo-1.png" />
						</a>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
		
	</div>
		
	</section>





<section class="content-section">
	
	<div class="container">
	
		<div class="row">
			
			<div class="col-sm-4">
				
				<div class="staff-member">
					
					<a class="image" >
						<img src="assetsFrontEnd/images/SuppliersCircle.png" class="img-circle" style="width:200px; height:200px;" />
					</a>
					
					<h4>
						<a >Suppliers</a>
						<small>to deliver their packages</small>
					</h4>
					<h2>50+</h2>
					
					<p>Eg. Restaurants, shops, online shops, companies, vendors ...</p>
					

					
				</div>
				
			</div>
			
			<div class="col-sm-4">
				
				<div class="staff-member">
					
					<a class="image" >
						<img src="assetsFrontEnd/images/UsersCircle.png" class="img-circle" style="width:200px; height:200px;" />
					</a>
					
					<h4>
						<a >Users</a>
						<small>refrence to recive packages</small>
					</h4>
					<h2>1000+</h2>
					
					<p>Users who registered their locations on the EZreach as their refrence for reciving packages</p>
					
		
					
				</div>
				
			</div>
			
			<div class="col-sm-4">
				
				<div class="staff-member">
					
					<a class="image" >
						<img src="assetsFrontEnd/images/CitiesCircle.png" class="img-circle" style="width:200px; height:200px;" />
					</a>
					
					<h4>
						<a >Cities</a>
						<small>Covered cities</small>
					</h4>
					<h2>5</h2>
					
					<p>Cities that EZreach services is covering in Iraq</p>
					

					
				</div>
				
			</div>
			
		</div>
		
	</div>
	
</section>	




</asp:Content>
