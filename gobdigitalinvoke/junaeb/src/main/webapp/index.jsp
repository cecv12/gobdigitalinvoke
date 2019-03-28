<!DOCTYPE html>
<!-- Template by Quackit.com -->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>JANAEB SSO</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles -->
    <link href="css/custom.css" rel="stylesheet">

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Logo and responsive toggle -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">
					<img src="img/logo.png" width="150" height="100">
                </a>
            </div>
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">Opci&oacuten 1</a>
                    </li>
                    <li>
                        <a href="#">Opci&oacuten 2</a>
                    </li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Opci&oacuten 3 <span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="about-us">
							<li><a href="#">Opci&oacuten 3.1</a></li>
							<li><a href="#">Opci&oacuten 3.2</a></li>
							<li><a href="#">Opci&oacuten 3.3</a></li>
						</ul>
					</li>
                </ul>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

	<div class="jumbotron feature" style="color:black">
		<div class="container">
			<h1>JUNAEB</h1>
			<p>Junta Nacional de Auxilio Escolar y Becas</p>
		</div>
	</div>

    <!-- Content -->
    <div class="container">

        <!-- Feature Row -->
        <div class="row">
            <article class="col-md-4 article-intro">
                <a href="http://127.0.0.1:8080/junaeb-01/home.jsp">
                    <img class="img-responsive img-rounded center" src="img/app1.png" width="250" height="250" alt="">
                </a>
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
                <a href="http://127.0.0.1:8081/org02/index.jsp">
                    <img class="img-responsive img-rounded center" src="img/org2.png" width="250" height="250" alt="">
                </a>
                <h3>
                    <a href="http://127.0.0.1:8081/org02/index.jsp">Org2</a>
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
</body>

</html>