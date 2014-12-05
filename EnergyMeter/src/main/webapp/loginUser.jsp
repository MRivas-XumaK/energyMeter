<%-- 
    Document   : loginUser
    Created on : 1/12/2014, 10:04:55 PM
    Author     : Jose
--%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap-3.1.1-dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
    <script src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="plot/flot/jquery.js"></script>
<script type="text/javascript" src="plot/flot/jquery.flot.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <form class="form-signin" role="form">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Username</label>
        <input type="text" id="username" class="form-control" placeholder="User" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>		  
        </div>
		<div>
			<a id="refNew" href="EnergyMeter/newUser.jsp" >New User</a>
		</div>
		<br>
        <button id="sendUser" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
    <script>
        $('#sendUser').click(function(){
                var user = $('#username').val();
                var pass = $('#password').val();
                var urlTo = "http://"+window.location.host+"/EnergyMeter/generalservlet?loading=true&user="+user+"&pss="+pass;
                $.ajax({
                    url: urlTo,
                    context: document.body
                }).done(function(data) {
                    if(data === "error"){
                        alert("The user name is not Available");
                    } else {
                        document.cookie=  "user=" + user+"; path=/";
                        window.location = "http://"+window.location.host+"/EnergyMeter/index.jsp";
                    }
                });
        });
        $(document).ready(function() {
            $('#refNew').attr("href","http://"+window.location.host+"/EnergyMeter/newUser.jsp");
            if (document.cookie.indexOf("user") >= 0) {
                 window.location = "http://"+window.location.host+"/EnergyMeter/index.jsp";
            }
        });
    </script>>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

