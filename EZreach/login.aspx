<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="Gayandn.login" %>

<!DOCTYPE html>
<html lang="en" dir="rtl">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="Neon Admin Panel" />
	<meta name="author" content="" />

	<link rel="icon" href="assets/images/favicon.ico">

	<title>EZreach</title>

	<link rel="stylesheet" href="assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
	<link rel="stylesheet" href="assets/css/font-icons/entypo/css/entypo.css">
	<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/neon-core.css">
	<link rel="stylesheet" href="assets/css/neon-theme.css">
	<link rel="stylesheet" href="assets/css/neon-forms.css">
	<link rel="stylesheet" href="assets/css/neon-rtl.css">
	<link rel="stylesheet" href="assets/css/custom.css">

	<script src="assets/js/jquery-1.11.3.min.js"></script>

	<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->


</head>


<body class="page-body login-page login-form-fall" data-url="http://neon.dev">
    <form id="form1" runat="server">
        
        <div class="login-container">
	
	<div class="login-header login-caret" style="padding-bottom:0px; padding-top:20px;">
		
		<div class="login-content">
			
			<a href="login.aspx" class="logo">
				<img src="assets/images/LogoRounded.png" width="120" alt="" />
			</a>
			<h2 style="color:white;"> You order, we deliver</h2>
			<p class="description"> Please login</p>
				
		</div>
		
	</div>

	<div class="login-form" style="padding-top:0px;">
		
		<div class="login-content form">
	
			
				
				<div class="form-group">
					
					<div class="input-group">
						<div class="input-group-addon">
							<i class="entypo-user"></i>
						</div>
						
                          <asp:TextBox cssclass="form-control  rightAlign" ID="textPhone" TextMode="phone" placeholder="Phone number" runat="server" ></asp:TextBox>

					</div>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"    ValidationGroup="login" ControlToValidate="textPhone" ForeColor="red" ErrorMessage="Phone Required"></asp:RequiredFieldValidator>

					
				</div>
				
				<div class="form-group">
					
					<div class="input-group">
						<div class="input-group-addon">
							<i class="entypo-key"></i>
						</div>
						
                          <asp:TextBox cssclass="form-control" ID="textPass" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
					
					</div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"    ValidationGroup="login" ControlToValidate="textPass" ForeColor="red" ErrorMessage="Password Required"></asp:RequiredFieldValidator>

				
				</div>
				
				<div class="form-group">

                <asp:LinkButton ID="linkLogin" CssClass="btn btn-primary btn-block btn-login" CausesValidation="true" ValidationGroup="login" runat="server">
                    <i class="entypo-login"></i>
						Login In
                    
                    </asp:LinkButton>




				</div>
				<div class="form-group">

                    			 <asp:Label ID="lableUserNotFound" runat="server"  ForeColor="red" Text=""></asp:Label>

                    </div>
		
	
			
				
	
			
			
			<div class="login-bottom-links">
				
				
				<br />
				
				  - EZreach 2022 -
				
			</div>
			
		</div>
		
	</div>
	
</div>



<%--sdsessssss--%>


                   <asp:SqlDataSource ID="sdsChangePass" runat="server" ConnectionString="<%$ ConnectionStrings:Sharaza_dbConnectionString %>" SelectCommand="SELECT [email], [sysUser_id], [user_pass], [active], [city], [f_name], [l_name], [role], [Phone] FROM [t_sysUsers]
where [phone]=@phone ">
               <SelectParameters>
                   <asp:ControlParameter ControlID="textPhone" Name="phone" PropertyName="Text" />
               </SelectParameters>
           </asp:SqlDataSource>
    </form>



    <!-- Bottom scripts (common) -->
	<script src="assets/js/gsap/TweenMax.min.js"></script>
	<script src="assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/neon-api.js"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/neon-login.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="assets/js/neon-custom.js"></script>


	<!-- Demo Settings -->
	<script src="assets/js/neon-demo.js"></script>
</body>





</html>
