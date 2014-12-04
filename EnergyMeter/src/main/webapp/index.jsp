<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



<!DOCTYPE html>
<html lang="en" style="height:100%;">
  <head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="icon" 
      type="image/png" 
      href="https://s3.amazonaws.com/lecture_attachments/w88uWnA5TZS66pUNIuvK_Slice 2.jpg">
<link rel="stylesheet" href="https://secure.usefedora.com/css/redactor.css" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<title>
Xcode for Designers - Xcode for Designers</title>
<!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
<script src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="plot/flot/jquery.js"></script>
<script type="text/javascript" src="plot/flot/jquery.flot.js"></script>

	<script src="https://secure.usefedora.com/js/jquery.placeholder.js"></script>
		

		<script src="https://a59b98a46b6b6225f8e5-f63a39482042e1d18f69fa58fccf96e8.ssl.cf5.rackcdn.com/bootstrap.js"></script>
	<script src="https://secure.usefedora.com/js/bootstrap-switch.js"></script>
<script src="https://ankur.usefedora.com/flat/js/flatui-radio.js"></script>
					
	<script type="text/javascript">
	$(document).ready(function() {
            if (document.cookie.indexOf("user") < 0) {
                 window.location = "http://localhost:8084/EnergyMeter/loginUser.jsp";
            }
	       if("America/Mexico_City".length===0){
	           var visitortime = new Date();
	           var visitortimezone = -visitortime.getTimezoneOffset()/60;
	           $.ajax({
	               type: "GET",
	               url: "http://learn.scotthurff.com/timezone.php",
	               data: 'time='+ visitortimezone,
	               success: function(){
	                   //location.reload();
	               }
	           });
	       }
	   });
	</script>
		<!-- Bootstrap core CSS -->
	<link href="https://a59b98a46b6b6225f8e5-f63a39482042e1d18f69fa58fccf96e8.ssl.cf5.rackcdn.com/bootstrap.min.css" rel="stylesheet">
	<link href="https://secure.usefedora.com/css/switch2.css" rel="stylesheet">
	<link href="https://secure.usefedora.com/css/docs.css?cache=1416471499" rel="stylesheet">
		<link href="https://secure.usefedora.com/css/school.css" rel="stylesheet">
	<link href="https://secure.usefedora.com/css/datepicker.css" rel="stylesheet">
	
				<link href="https://a59b98a46b6b6225f8e5-f63a39482042e1d18f69fa58fccf96e8.ssl.cf5.rackcdn.com/flat-ui.css" rel="stylesheet">
	

<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=PT+Serif:400,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600' rel='stylesheet' type='text/css'>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-41402972-1', 'auto');
  ga('send', 'pageview');

</script><meta property="og:url" content="http://learn.scotthurff.com/course/xcode/?ankur=1"><meta property="og:title" content="Xcode for Designers at Xcode for Designers"><meta property="og:image" content="https://s3.amazonaws.com/lecture_attachments/qPt3V64UTWW9Eg2o7i30_blur.png"><meta property="og:description" content="
	You’re a designer who wants to become an expert at designing mobile experiences. And who wouldn't? Mobile is the future. And becoming an expert in anything means knowing your tools.
	But do you know how to create custom Table Views that will handle your creative vision? How non-s">

    <script>
        $(document).ready(function(){
            var cont = 0;
            var points = [[0,0]];
            var tempArray;
            var newPoint;
            //$.plot($("#placeholder"), data, options);
            //$.plot($("#flot-placeholder"), [ [[0, 0], [1, 1]] ], { yaxis: { max: 1 } });
            var pollServerForData = function(){
                $.ajax({
                        url: "http://localhost:8084/EnergyMeter/generalservlet?value=true",
                        context: document.body,
                        async: false,
                        timeout: 5000
                    }).done(function(data) {
                        console.log(data);
                        console.log(parseInt(data));
                        newPoint = parseInt(data);
                        if(!isNaN(newPoint)){
                            tempArray = new Array([cont++, newPoint]);
                            points.push(tempArray);
                        }
                        var options = {
                            series:{
                                lines:{
                                    show:true
                                },
                                points:{
                                    show:true
                                }
                            }
                        };
                        $.plot($("#flot-placeholder"), points, options);
                    });
                    setTimeout(pollServerForData,3000);
            };
            setTimeout(pollServerForData,3000);
        })                                        
    </script>

  </head>

  <body style="overflow-x:hidden;">
	<style>
			/*
	.navbar-brand
	{
		background-image:url('https://d2vvqscadf4c1f.cloudfront.net/8tIBdVszROXNsNQ5C1XQ_logo-6.png');
		background-size: 100% 100%;
		height:60px;
		width:68px;
	}
	*/
			#homepage_div
	{
		background-image:url("https://ankur.usefedora.com/images/background_phone.png");
		background-position:50% 50%;
		background-size:cover;
		height:90%;
	}
	.page_div
	{
		background-image:url("https://a59b98a46b6b6225f8e5-f63a39482042e1d18f69fa58fccf96e8.ssl.cf5.rackcdn.com/sos.png");
		background-size:auto;
	}
	.bs-docs-nav .navbar-nav > li > a {
	  color: #204056;
	}
	.bs-docs-nav .navbar-nav > li > a:hover {
	  color: #23c897;
	}
	
	
	
	.dropdown-menu > .active > a, .dropdown-menu > .active > a:hover, .dropdown-menu > .active     >     a:focus {
	    background-color: #ffffff !important;
	    background-image: linear-gradient(to bottom, #17AA76, #149466) !important;
	    background-repeat: repeat-x !important;
	    color: #FFFFFF;
	    outline: 0 none;
	    text-decoration: none;
	}
	
	
	
	.dropdown.open {
	    background: #ffffff;
	}
	
	.navbar-fedora .navbar-nav > .active > a,
	.navbar-fedora .navbar-nav > .active > a:hover,
	.navbar-fedora .navbar-nav > .active > a:focus {
	  color: #23c897;
	background-color:#ffffff;
	}

	.navbar-fedora .navbar-nav > .open > a,
	.navbar-fedora .navbar-nav > .open > a:hover,
	.navbar-fedora .navbar-nav > .open > a:focus {
	  color: #23c897;
	background-color: #ffffff;
	}

	.dropdown-menu li > a:hover, .dropdown-menu li > a:focus, .dropdown-submenu:hover > a {
	background-image:none;
	background-color:#ffffff;
	}
	body {
}

h1, h2, h3, h4 {
font-weight:normal;
}

#course_mainbar {
padding-top: 75px!important;
background:#f9f9f9;
}

#course_mainbar h4 {
margin-top: 35px;
font-family:'montserrat',sans-serif;
font-size: 25px;
font-weight:400;
}

#course_mainbar h5 {
margin-top: 35px;
font-family:'montserrat',sans-serif;
font-size: 22px;
font-weight:400;
}

#course_sidebar {
border-right: 1px solid #ddd!important;
margin-top: 37px!important;
background-color: white!important;
}

#course_sidebar .section_div {
background-color: white!important;
padding-top: 20px!important;
padding-bottom: 0!important;
font-size: 17px!important;
}

#course_sidebar .lecture_div_active {
background: #23c897!important;
color: white!important;
}

#course_sidebar .lecture_div_active i {
color:white!important;
}

#course_sidebar .lecture_div {
background: white;
border-bottom: 1px solid white;
color: #6b6b6b;
font-family: 'PT Serif';
font-size: 15px;
}

#course_sidebar .lecture_div i {
color: #ccc;
}

#course_sidebar .lecture_div:hover {
background-color: #61d5b2;
color: white!important;
}

#course_sidebar .lecture_div:hover i {
color: white!important;
}

body, p, .lecture, .faq_answer {
font-family: 'PT Serif', serif;
font-size: 22px!important;
line-height: 1.6em!important;
color: #444;
}

#lecture_heading {
font-size:32px!important;
}

#lecture_heading, 
.section, 
.lecture_tr, 
.container,
 #course_sidebar, 
#course_lecture_footer,
.btn  {
font-family:'Montserrat',sans-serif;
font-weight: normal;
}

 .dropdown {
font-size: 9px!important;
font-family:'Montserrat',sans-serif;
}

#secondarynav  {
background: #2B7A8F;
background: -moz-linear-gradient(57deg, #2B7A8F 1%, #B546EE 75%);
background: -webkit-linear-gradient(57deg, #2B7A8F 1%, #B546EE 75%);
background: -o-linear-gradient(57deg, #2B7A8F 1%, #B546EE 75%);
background: -ms-linear-gradient(57deg, #2B7A8F 1%, #B546EE 75%);
background: linear-gradient(147deg, #2B7A8F 1%, #B546EE 75%); 
border-bottom: none!important;
height: 37px!important;
}

#secondarynav .nav_icon {
box-shadow: 0 0 0;
font-size: 20px;
}

#secondarynav .nav_icon:hover {
background: rgba(0,0,0,.25);
}

.fa.fa-youtube-play {
}

hr {
border-top: 1px solid #ddd;
margin-top: 30px!important;
margin-bottom: 30px!important;
}

.quotation {
font-style: italic;
font-size: 28px;
line-height: 1.4em;
}

.byline {
font-size: 18px;
font-style:italic;
}

.typ, .purple {
color: #a0a;
}

.white {
color:white!important;
}

.darkpurple {
color: #703DA9;
}

.red {
color: #BF3535;
}

.green {
color: #00ba00!important;
}

.pun, .gold {
color: #bba37a;
}

.brown {
color:#78492A;
}

.lit, .blue {
color: #174fd0;
}
.teal {
color: #4D8CBD;
}
.code {
font-family: 'Menlo', 'Monaco', 'Consolas', 'Courier', 'Courier New', sans-serif;
color: #5b5b5b;
padding: 25px;
margin:40px 0;
background: white;
border: 1px solid #ddd;
border-radius: 10px;
font-weight: bold;
font-size: 16px!important;
font-weight: 400;
}

.mon {
font-family: 'Menlo', 'Monaco', 'Consolas', 'Courier', 'Courier New', sans-serif;
font-weight: 400;
font-size: 18px;
}

.process {
color: #0B4C3D;
padding: 25px;
margin:40px 0;
background: #F2FFFC;
border: 1px solid #86F8E1;
border-radius: 10px;
font-weight: bold;
font-weight: 400;
}

figure {
border-top: 1px solid #ddd;
border-bottom: 1px solid #ddd;
text-align: left;
padding: 1.8em 0 1.8em 0;
margin: 1.8em 0 1.8em 0; 
display:block;
}

figure figcaption {
margin: 0 25px;
padding-top: 10px;
font: normal 14px/1.5em;
letter-spacing: 0.159px;
color: #8a8d90; 
font-style: italic;
}

.well.well-sm {
font-family:'montserrat',sans-serif;
font-size: 15px;
}

/* Universal Stuff */
.row {
margin: 0;
}

.navbar {
border-bottom: 1px solid #ddd!important;
}

.navbar-nav > li > a {
font-weight: 400;
}

h4.pitch {
font-size: 22px;
color: #414141;
padding: 40px 0 10px 0;
margin: 0;
text-align: center;
font-family: 'Montserrat', sans-serif;
text-align:left;
font-weight: normal;
line-height: 1.5em;
}

.fa.fa-question-circle {
display:none;
}

.btn-primary {
border-radius: 100px;
}

/* Signed in view for course progress */
.lecture_tr .lecture {
font-size: 19px!important;
}

.lecture_tr i {
font-size: 19px!important;
}

.section {
}

.table.table-bordered {
background: white!important;
border: 1px solid #ddd!important;
}

.table.table-bordered td {
border: 1px solid #ddd!important;
}

.table-striped > tbody > tr:nth-child(even) > td {
background: white!important;
}

.table.table-bordered td .btn {
margin-top: 3px;
font-size: 14px;
}

/* Your Courses */
.page_div {
background: #f9f9f9;
}

.course_listing {
box-shadow: 0 0 0!important;
border: 1px solid #ddd;
}

/* Hiding a bunch of stuff */
.course_listing hr,
.course_listing .course_heading,
.course_listing .author_heading,
.course_listing #progress_bar_div  {
display:none!important;
}

.course_heading {
background: white;
border: none;
height: inherit;
}

.course_subtitle {
height: inherit;
overflow: visible;
line-height: 1.3em;
padding: 15px;
font-family: 'PT Serif', serif;
font-size: 18px;
color: #444;
}

/* Curric Page */
div.progress {
height: 35px!important;
}

#course-bar-enrolled {
border-bottom:none;
background: url('http://scotthurff.com/images/landing-pages/xcode/intro-bg-blur.jpg');
background-size:cover;
padding: 55px;
}
#course-bar-enrolled h2 {
color: white;
margin-top: 0;
margin-bottom: 0;
}

#course-bar-enrolled .progress {
background: black;
background: rgba(0,0,0,.30);
}

#course-bar-enrolled #course-progress-inner,
#course-bar-enrolled .progress-bar-success {
background: white!important;
color: #444;
text-shadow: 0 0 0;
font-size: 15px;
}

#course-bar-enrolled #course-progress-inner, #course-bar-enrolled .progress-bar-success {
font-size: 11px;
}

/* Landing Page */
/* Navbar */
.navbar-toggle {
margin: 0 20px;
}

.navbar-brand img {
margin-left: 30px;
}

#course-hero {
background: #f9f9f9;
border-bottom: none;
padding-bottom: 0;
}

#course-hero h1, h2 {
font-weight: normal;
}

.btn-hg {
padding: 15px;
width: 100%;
}

@media screen and (max-width: 768px) {
.btn-hg  {
font-size: 20px;
}
}

@media screen and (max-width: 400px) {
.btn-hg  {
font-size: 15px!important;
}
}

#coupon_div {
margin-top: 15px;
}

#coupon_bar {
text-shadow: 0 0 0;
font-weight: normal;
font-family: 'Montserrat', sans-serif;
font-size: 20px;
padding: 10px 0;
margin: 30px 0 0;
background: #DEF6F1;
color: #004235;
}

#coupon_bar .sentence {
color:#5B837B!important;
}

#countdown,
#countdown .days,
#countdown .hours,
#countdown .minutes,
#countdown .seconds {
color: #004235!important;
text-shadow: 0 0 0!important;
font-weight:normal!important;
font-size: 18px;
}

.alert.alert-danger {
margin: 40px 0px 0px;
font-family: montserrat;
background: none repeat scroll 0% 0% #B94A48;
color: white;
border: medium none;
border-radius: 0px;
}

#course-description {
padding-top: 70px;
}

/* centered columns styles */
.row-centered {
    text-align:center;
}
.col-centered {
    display:inline-block;
    float:none;
    /* reset the text-align */
    text-align:left;
    /* inline-block space fix */
    margin-right:-4px;
}

.in-progress  {
background: #F8E71C;
padding: 2px;
font-family: 'Montserrat', sans-serif;
font-size: 13px;
color: #111;
text-align: center;
max-width: 130px;
margin: 0 0 10px 0;
border-radius: 100px;
}

.faq_question {
font-weight:normal;
}

/* Hide Lecture Preview Buttons on LP */
.lp-curriculum-list .btn {
display:none;
}

.lp-curriculum-list .lecture {
cursor:default;
}

/* PH Deal */
.ph-logo {
width: 60px;
padding: 0 0 20px 0;
}	</style>
    <!-- Page content of course! -->
    <!-- Custom styles for this template -->
<style>
  body {
    padding-top: 60px;
	height:100%;
  }
 

.navbar-el
{
	height:60px;
}
.navbar-active
{
	height:60px;
	background-color:#ffffff;
	color:#23c897;
}
.navbar-el:hover
{
	background-color:#ffffff;
		color:#23c897;
}
.navbar-link
{
	height:60px;
	padding-top:21px;
	font-size:18px;
}
.nopadh2
{
padding-top:0px; margin-top:0px;padding-bottom:0px;margin-bottom:0px;	
}

</style>


<div class="navbar navbar-fedora navbar-fixed-top bs-docs-nav" id="primarynav" style="background-color:#ffffff;border-bottom:0px;" role="navigation">

  <div class="container">
	<div class="navbar-header">


            <a class="navbar-brand" href="#" style="color:white;font-size:30px;padding:0px;"><img src="" style="" alt="Energy Monitor" margin-top:0px;margin-bottom:0px;width:68px;height:60px;" /></a></div>

<div class="collapse navbar-collapse navbar-ex1-collapse">
	
	
	
      <ul class="nav navbar-nav pull-right">
		
	
				<li class="navbar-el" style="">
		<a href="http://learn.scotthurff.com/you/"  class="navbar-link" style="padding-top:21px; ;">About Us</a>
	</li>
		<li class="navbar-el" style="">
		<a href="http://learn.scotthurff.com/directory/"  class="navbar-link" style="padding-top:21px; ;">Contact Us</a>
	</li>
	 

      </ul>

	
	</div>

<!--/.nav-collapse -->
</div>
</div>


<script src="https://fast.wistia.net/static/E-v1.js"></script>


<link rel="stylesheet" href="http://scotthurff.com/stylesheets/landing-pages/xcode-fedora.css">
<!-- <link rel="stylesheet" href="http://scotthurff.com/stylesheets/app.css"> -->
<div style="background:#f9f9f9;">
<div id="course-hero">
	<div class="row marquee" style="text-align: center; margin: 0;">
		<div class="container">
			<!-- <div class="col-lg-5 col-md-5" id="course-image" style="">
				
					<img class="img-responsive" src="https://s3.amazonaws.com/lecture_attachments/qPt3V64UTWW9Eg2o7i30_blur.png" alt="Xcode for Designers - Be a designer who knows Xcode."/>
				
			</div> -->
			<div class="col-xs-12 col-md-9 col-centered" id="course-info" style="">
				<center>
				    <!--<img id="cohete" src="http://scotthurff.com/images/landing-pages/xcode/rocket-smoker-dark.png" class="rocket">-->
					<!--<h1>Xcode for Designers</h1>-->
                                        <div id="placeholder"></div>
                                        <div id="flot-placeholder" style="width:800px;height:500px"></div>

					<!--<h1>Be a designer who knows Xcode.</h1>
					<!-- <h2>Be a designer who knows Xcode.</h2> -->
					<!--<h2>Learn how to create native iOS apps in 5 days.</h2>-->

    					
				</center>
			</div>
		</div>
	</div>
</div>	
    <script>
        $('#cohete').click(function(){
                $.ajax({
                    url: "http://localhost:8084/EnergyMeter/generalservlet?newuser=usr2&pss=value&macaddress=90-a2-da-oe-93-7g",
                    context: document.body
                }).done(function(data) {
                    if(data === "error"){
                        alert("The user name is not Available");
                    } else {
                        document.cookie="usr2=true";
                        alert("User created");
                    }
                });
        });
    </script>





<div class="row top-quotes">
	<div class="col-sm-12 col-md-6 col-lg-4">
		<img src="http://www.xumak.com/dam/xumak-site/team/grayscale/mrivas_bn_2.JPG" />
		<p>Jr. Developer</p>
		<h5><a href="" target="blank">Mario Rivas</a></h5>
		<h6>10002607</h6>
	</div>
	<div class="col-sm-12 col-md-6 col-lg-4 hidden-xs hidden-sm hidden-md">
		<img src="http://www.xumak.com/dam/xumak-site/team/grayscale/rtellez_bn_2.JPG" />
		<p>Jr. Developer</p>
		<h5><a href="" target="blank">Steven Tellez</a></h5>
		<h6>11002972</h6>
	</div>
	<div class="col-sm-12 col-md-6 col-lg-4 hidden-xs hidden-sm">
		<img src="http://www.xumak.com/dam/xumak-site/team/grayscale/jvasquez_bn_2.JPG" />
		<p>Jr. Developer</p>
		<h5><a href="" target="blank">Jose Vasquez</a></h5>
		<h6>11002017</h6>
	</div>
</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
																																																																																																																																																																																																																																																																																																																																													<script type="text/javascript">
	var original_rating = null;
function ratingChanged()
{

	var rating = $("#class-rating").val();
	
	if (rating)
	{
	//alert ("new rating is "+rating);
	original_rating = rating;
	
	$("#main_div").html("<center><p><br/><img src='http://learn.scotthurff.com/images/ajaxloader2.gif' /><br /><br /></center>");
	$.post("http://learn.scotthurff.com/review_backend.php",{method:'add_star_rating',rating:rating,courseid:4182},function (data)
	{
reviewClass();
	});
	
	}
}
function displayFull()
{
	$("#hidden-section").css("display","block");
		$("#expand-section").css("display","none");
}
$(function()
{
	//setInterval(updateTime, 1000);
	//$("#class-rating").rating();
	$("#signup_button").removeAttr("href");
	$("#signup_button").on("click",doEnroll);
	
		
	//updateTime();
});
function fullBio()
{
	var authorBio = "<h4 class=\"pitch\" style=\"padding-top: 0;\">\r\nAbout Chris Slowik\r\n<\/h4>\r\n<p>\r\n  I\u2019ve been involved in the creation of mobile and web apps for years, initially with mainly UI design. It was a natural next step to combine that experience with an interest in animation and get involved in more advanced interaction design. I currently create interaction concepts for all the cool stuff we\u2019re designing at \r\n  <a href=\"https:\/\/dribbble.com\/creativedash\">CreativeDash<\/a>, working with some really neat startups. I\u2019m always looking for new ways to prototype and export interactions.\r\n<\/p>\r\n<h4 class=\"pitch\" style=\"padding-top: 20px;\">\r\nAbout Scott Hurff\r\n<\/h4>\r\n<p>\r\n I'm on the founding team and head of product for \r\n  <a href=\"http:\/\/trytappy.com\/\">Tappy<\/a>, a mobile app backed by Kleiner Perkins. I've been designing and building products on the Web for over 15 years, consulting with dozens of startups. The products I designed and helped build have been used by over 20 million people and a number of organizations, including VICE, Dick Clark Productions, Greyson Chance, Jimmy Kimmel Live, Puma, INDMUSIC, TMZ and Disney. I've built social networks, SaaS products, e-commerce storefronts and software, marketplaces, email apps and more.\r\n<\/p>";
	$("#author_bio").html(authorBio);
	
}
function doEnroll()
{
	
			window.location.href = "https://ssl.usefedora.com/enroll.php?site=2655&affcode=&course=4182&user=0&sig=cfcd208495d565ef66e7dff9f98764da";
		
}
function reviewClass()
{
		$("#main_div").html("<center><p><br/><img src='http://learn.scotthurff.com/images/ajaxloader2.gif' /><br /><br /></center>");
	$("#main_div").load('http://learn.scotthurff.com/write_review.php?courseid=4182');
	$(document).scrollTop($("#main_div").offset().top);	
	if(history.pushState) {
	    history.pushState({"id":100}, document.title, "http://learn.scotthurff.com/course/xcode/write-review/");
	}
}
function flipCoupon()
{
	$("#coupon_div").html('<div class="row"><div class="col-lg-6 col-lg-offset-3"><table><tr><td><input type="text" style="border-radius:5px;font-size:18px;" class="form-control" placeholder="COUPON" id="coupon_code" /></td><td> <a class="btn btn-default btn-lg" onClick="applyCoupon()">Apply</a></td></tr></div></div>');
}


function applyCoupon()
{
	var cCode = $("#coupon_code").val();
	$(location).attr("href","http://learn.scotthurff.com/course/xcode/?couponCode="+cCode);
}
function unwatched_hovered(lectureid)
{
	var elementName = "#circle_"+lectureid;
	$(elementName).removeClass("fa-circle-o");
	//$(elementName).removeClass("fa-check-circle");
	$(elementName).addClass("fa-play-circle-o");
	showWatchButton(lectureid);
}
function undo_unwatched_hovered(lectureid)
{
	var elementName = "#circle_"+lectureid;
		$(elementName).removeClass("fa-play-circle-o");
			$(elementName).addClass("fa-circle-o");
	removeWatchButton(lectureid);
}
function watched_hovered(lectureid)
{
	var elementName = "#circle_"+lectureid;
	//$(elementName).removeClass("fa-circle-o");
	$(elementName).removeClass("fa-check-circle");
	$(elementName).addClass("fa-play-circle");
	showWatchButton(lectureid);
}
function undo_watched_hovered(lectureid)
{
	var elementName = "#circle_"+lectureid;
		$(elementName).removeClass("fa-play-circle");
			$(elementName).addClass("fa-check-circle");
			removeWatchButton(lectureid);
}

function showWatchButton(lectureid)
{
	var element = "#watch_link_"+lectureid;
	$(element).css("display","block");
}
function removeWatchButton(lectureid)
{
	var element = "#watch_link_"+lectureid;
	$(element).css("display","none");
	
}
</script>


<!---
	<div class="navbar navbar-inverse" style="margin-bottom:0px;padding-bottom:0px;border-radius:0px;">
	 <div class="container">
	<p class="navbar-text" style="color:white;">Copyright 2013 Xcode for Designers.</p>

	  <ul class="nav navbar-nav pull-right">
	
	    <li><a href="http://learn.scotthurff.com/privacy">Privacy Policy</a></li>
	    <li><a href="mailto:scotthurff@gmail.com" target="_blank">Contact Us</a></li>
				
	<li>	</li>
	  </ul>

	</div>
	</div>-->
	<style type="text/css">
	.footer-column
	{
		font-size:16px;
		color:#bac1c7;
		padding-top:15px;
		padding-bottom:10px;
	}
	.footer-column a
	{
		color:#bac1c7;
	}
	.footer-column a:hover
	{
		color:white;
		text-decoration:none;
	}
	</style>
	

	<div class="row" style="background-color:#3f4850">
			<div class="container">
	<div class="col-lg-12 col-md-12 footer-column"><center><a href="#">Design taken from http://scotthurff.com</a></center></div>
	

	</div>
		</div>
	<script>
	
	var _gaq = _gaq || [];
	_gaq.push(
	  ['_setAccount', 'UA-44397410-1'],
	  ['_trackPageview']	);
	</script>

	<script type="text/javascript">  (function() {
    var ga = document.createElement('script');     ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:'   == document.location.protocol ? 'https://ssl'   : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
   </script>
	

<script type="text/javascript">
$( document ).ready(function() {
$('input, textarea').placeholder();
});

</script>
  </body>
</html>

