﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTrades.aspx.cs" Inherits="Project.AddTrades" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Admin : Add Trades</title>
    <!-- Custom Fonts -->
    
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'/>

     <!-- Theme CSS -->
    <link href="Content/agency.min.css" rel="stylesheet" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body id="page-top" class="index">

   

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top" style="background-color:#333">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <asp:HyperLink ID="hyperlink1" Cssclass="navbar-brand page-scroll" NavigateUrl="Admin.aspx" Text="Coffee Crew" runat="server" /> 
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                       <asp:HyperLink ID="hyperlink2_a" CssClass="page-scroll" NavigateUrl="AllTrades" Text="All Trades" runat="server" /> 
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink3_a" CssClass="page-scroll" NavigateUrl="ObligationReport_A" Text="Obligation Report" runat="server" />
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink4_a" CssClass="page-scroll" NavigateUrl="Shortage_A" Text="Shortages" runat="server" />
                    </li>
                    <li>
                        <asp:HyperLink ID="hyperlink5_a" CssClass="page-scroll" NavigateUrl="Statistics" Text="Statistics" runat="server" />
                    </li>
                    <li>
                        <a href="SignIn" class="page-scroll" >Sign Out, <%Response.Write((string)(Session["CName"]));%></a>                   

                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
       <%-- <header>
            <div class="container">
            <div class="intro-text">
               <div class="intro-lead-in">Welcome To Our Studio!</div>
                <div class="intro-heading">It's Nice To Meet You</div>
                <a href="#services" class="page-scroll btn btn-xl">Tell Me More</a>
            </div>
        </div>--%>
        

     <form id="form1" runat="server">
             <!-- Services -->
    <section id="services">
      <div class="container">
        Add New Trades
            

	<div class="form-group"> <!-- Security Name -->
		<label for="SecName2" class="control-label">Security Name</label>
        <asp:DropDownList ID="SecName2" class="form-control" runat="server" DataSourceID="SecurityNames" DataTextField="SecurityName" DataValueField="SecurityName"></asp:DropDownList>
	    <asp:SqlDataSource ID="SecurityNames" runat="server" ConnectionString="<%$ ConnectionStrings:CNS_SYSTEMConnectionString %>" SelectCommand="SELECT [SecurityName] FROM [Security]"></asp:SqlDataSource>
	</div>	

	<div class="form-group"> <!-- Quantity -->
		<label for="Qty" class="control-label">Quantity</label>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Qty" ErrorMessage="* Must be positive" MinimumValue="0" Type="Integer" MaximumValue="2147483647" Font-Italic="True" ForeColor="Red"></asp:RangeValidator>
		<asp:TextBox runat="server" Cssclass="form-control" id="Qty" name="Quantity" />
	</div>					
							
	<div class="form-group"> <!-- Price -->
		<label for="Price" class="control-label">Price</label>
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="Price" ErrorMessage="* Must be positive" MaximumValue="2147483647" MinimumValue="0" Type="Double" Font-Italic="True" ForeColor="Red"></asp:RangeValidator>
		<asp:TextBox runat="server" CssClass="form-control" id="Price" name="Price" />
	</div>	

	<div class="form-group"> <!-- Buying Member Name-->
		<label for="BMemName" class="control-label">Buying Member Name</label>
		
        <asp:DropDownList ID="BMemName" class="form-control" runat="server" DataSourceID="MemberName" DataTextField="CustodianName" DataValueField="CustodianName" OnSelectedIndexChanged="BMemName_SelectedIndexChanged"></asp:DropDownList>
	    <asp:SqlDataSource ID="MemberName" runat="server" ConnectionString="<%$ ConnectionStrings:CNS_SYSTEMConnectionString %>" SelectCommand="SELECT [CustodianName] FROM [Custodian]"></asp:SqlDataSource>
	</div>
	
	<div class="form-group"> <!-- Selling Member Name-->
		<label for="SMemName" class="control-label">Selling Member Name</label>

        <asp:DropDownList ID="SMemName" class="form-control" runat="server" DataSourceID="MemberNameExclude" DataTextField="CustodianName" DataValueField="CustodianName">
        </asp:DropDownList>
		


	    <asp:SqlDataSource ID="MemberNameExclude" runat="server" ConnectionString="<%$ ConnectionStrings:CNS_SYSTEMConnectionString %>" SelectCommand="SELECT [CustodianName] FROM [Custodian]"></asp:SqlDataSource>
		


	</div>		
	
	<div class="form-group" style="text-align: center"> <!-- Submit Button -->
        <asp:Button ID="addingtrade" class="btn btn-primary" runat="server" OnClick="AddTrade_Click"   Text="Add Trade" />
	</div>     
	
    
        
      </div>
    </section>
            

        </form>
    

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Coffee Crew 2018</span>
                </div>
                <%--<div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>--%>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="Scripts/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Scripts/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="Scripts/jqBootstrapValidation.js"></script>
    <script src="Scripts/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="Scripts/agency.min.js"></script>
    
</body>
</html>

