<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title state-title="" pattern="%s | Claveúnica">Inicio | Claveúnica</title>
<script src="js/keycloak.js"></script>
<script src="js/kc-client.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <link rel="stylesheet" href="inicio_claveunica_files/vendor.7ebe225d.css">
    <link rel="stylesheet" href="inicio_claveunica_files/main.e93343de.css">
    <link href="inicio_claveunica_files/css" rel="stylesheet">
    <script type="text/javascript" async="" src="inicio_claveunica_files/recaptcha__es.js"></script><script async="" src="inicio_claveunica_files/analytics.js"></script><script src="inicio_claveunica_files/api.js" async="" defer=""></script>
    <script src="Inicio _ Claveúnica_files/js"></script>
    <link rel="stylesheet" href="inicio_claveunica_files/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>

<body>

<site-header class="ng-isolate-scope">
<nav class="barra-superior">
  <div class="container">

    <div class="banda-bicolor">
      <span class="azul"></span>
      <span class="rojo"></span>
    </div>

    <ul class="nav navbar-nav" style="float: right !important">
      <li id="citizen">
        <a ui-sref="citizen" onclick="location.href=&#39;/&#39;" ui-sref-active="active" href="https://claveunica.gob.cl/" class="active">Ciudadanía</a>
      </li>
      <li id="institutional">
        <a ui-sref="institutional" onclick="location.href=&#39;/institucional&#39;" ui-sref-active="active" href="https://claveunica.gob.cl/institucional">Instituciones</a>
      </li>
    </ul>
  </div>
</nav>

<header class="navbar navbar-default" style="background-color: #2c558e; border-radius: 0px !important; box-shadow: none">
  <div class="container">

    <div class="navbar-header">
      <button class="collapsed navbar-toggle" data-target="#bs-navbar" data-toggle="collapse" type="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a ui-sref="citizen.home" class="navbar-brand" style="padding: 0px !important" href="#">
        <img class="img-responsive" src="inicio_claveunica_files/logo-blanco.f981055c.svg" style="height: 40px; padding-right: 4px; margin-top: 20px; margin-left: -2px; margin-bottom: 8px">
      </a>
    </div>
      <nav class="collapse navbar-collapse" id="bs-navbar">
      <ul class="nav navbar-nav menu_1">

        <li class="visible-xs visible-sm dropdown-submenu" ng-hide="$ctrl.isInstitutional()">
          <user-button is-mobile="true" user="$ctrl.user" class="ng-isolate-scope"><button type="button" class="btn btn-primary dropdown-toggle boton-header visible-xs visible-sm" ng-class="$ctrl.isMobile ? &#39;visible-xs visible-sm&#39; : &#39;&#39;" data-toggle="dropdown" style="padding-right: 10px !important; border-bottom: none !important">
  <span class="hidden-xs"><strong>mi</strong> claveúnica</span>
</button>

<ul class="dropdown-menu hidden-xs ng-hide" ng-show="$ctrl.loggedIn" onmouseover="paintButtonMenu()" style="margin-top: -20px">
  <li><a ui-sref="citizen.profile" href="http://127.0.0.1:8080/cu/home.jsp">Acceder Claveunica</a></li>
</ul>

<ul class="mobile_menu visible-xs ng-hide" ng-show="$ctrl.loggedIn" onmouseover="paintButtonMenu()" style="margin-top: -20px">
  <li><a ui-sref="citizen.profile" href="http://127.0.0.1:8080/cu/home.jsp">Acceder Claveunica</a></li>
</ul></user-button>
        </li>
      </ul>

      <div class="pull-right hidden-xs hidden-sm" style="margin-left: -10px" ng-hide="$ctrl.isInstitutional()">
        <div class="btn-group" role="group">
          <user-button is-mobile="false" user="$ctrl.user" class="ng-isolate-scope"><button type="button" class="btn btn-primary dropdown-toggle boton-header" ng-class="$ctrl.isMobile ? &#39;visible-xs visible-sm&#39; : &#39;&#39;" data-toggle="dropdown" style="background-color: rgb(43, 85, 142) !important; padding-right: 10px !important; border-bottom: none !important;">
  
  <span class="hidden-xs"><strong>mi</strong>claveúnica</span>
  <span class="ng-binding"></span>
</button>


<ul class="dropdown-menu hidden-xs ng-hide" ng-show="$ctrl.loggedIn" onmouseover="paintButtonMenu()" style="margin-top: -20px">
  <li><a ui-sref="citizen.profile" href="http://127.0.0.1:8080/cu/home.jsp">Acceder Claveunica</a></li>
</ul>


<ul class="mobile_menu visible-xs ng-hide" ng-show="$ctrl.loggedIn" onmouseover="paintButtonMenu()" style="margin-top: -20px">
  <li><a ui-sref="citizen.profile" href="http://127.0.0.1:8080/cu/home.jsp">Acceder Claveunica</a></li>
</ul></user-button>
        </div>
      </div>
    </nav>
    </div>
    </header>
</site-header>

	<div class="jumbotron">
		<div class="container">
			<h1>APP 1</h1>
			<p>Aplicaci&oacuten 1 de la organizaci&oacuten</p>
			<h2>Result</h2>
<pre style="background-color: #ddd; border: 1px solid #ccc; padding: 10px; word-wrap: break-word; white-space: pre-wrap;" id="output"></pre>
			
		</div>
	</div>

	<!-- Content -->
	<div class="container">

		<!-- Feature Row -->
		<div class="row">
			<article class="col-md-4 article-intro">
				<a href="http://127.0.0.1:8080/junaeb-01/home.jsp">
					<img class="img-responsive img-rounded center" src="img/app1.png" width="250" height="250" alt="">
				<h3>
					<a href="http://127.0.0.1:8080/junaeb-01/home.jsp">App1</a>
				</h3>
			</article>
			<article class="col-md-4 article-intro">
				<a href="http://127.0.0.1:8080/junaeb-02/home.jsp">
					<img class="img-responsive img-rounded center" src="img/app2.png" width="250" height="250" alt="">
				</a>
				<h3>
					<a href="http://127.0.0.1:8080/junaeb-02/home.jsp">App2</a>
				</h3>
			</article>

			<article class="col-md-4 article-intro">
				<a href="#" onclick="redirect()"> 
						<img class="img-responsive img-rounded center" src="img/org2.png" width="250" height="250" alt="">
				</a>
				<h3>
					<a href="#" onclick="redirect()">Org2</a>
				</h3>
			</article>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	<!-- jQuery -->
	<script src="js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"></script>
	<!-- IE10 viewport bug workaround -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
	<!-- Placeholder Images -->
	<script src="js/holder.min.js"></script>
</body>

</html>