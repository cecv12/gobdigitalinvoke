<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="http://localhost:8180/auth/js/keycloak.js" type="text/javascript"></script> -->
<script src="keycloak.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
	<script type="text/javascript">
		var keycloak = Keycloak('keycloak.json');
		
		
		function parametroURL(_par) {
			  var _p = null;
			  if (location.search) location.search.substr(1).split("&").forEach(function(pllv) {
			    var s = pllv.split("="), //separamos llave/valor
			      ll = s[0],
			      v = s[1] && decodeURIComponent(s[1]); //valor hacemos encode para prevenir url encode
			    if (ll == _par) { //solo nos interesa si es el nombre del parametro a buscar
			      if(_p==null){
			      _p=v; //si es nula, quiere decir que no tiene valor, solo textual
			      }else if(Array.isArray(_p)){
			      _p.push(v); //si ya es arreglo, agregamos este valor
			      }else{
			      _p=[_p,v]; //si no es arreglo, lo convertimos y agregamos este valor
			      }
			    }
			  });
			  return _p;
			}
		
	 	var user = parametroURL('user');
		
		
		

		function createCookie(name, value, days) {
			var expires = "";
			if (days) {
				var date = new Date();
				date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
				expires = "; expires=" + date.toUTCString();
			}
			document.cookie = name + "=" + value + expires + "; path=/";
		}

		var loadData = function() {

			console.log("asdsad", keycloak);

			var o = 'Token Expires:\t\t'
					+ new Date(
							(keycloak.tokenParsed.exp + keycloak.timeSkew) * 1000)
							.toLocaleString() + '\n';
			o += 'Token Expires in:\t'
					+ Math.round(keycloak.tokenParsed.exp + keycloak.timeSkew
							- new Date().getTime() / 1000) + ' seconds\n';
			if (keycloak.refreshTokenParsed) {
				o += 'Refresh Token Expires:\t'
						+ new Date(
								(keycloak.refreshTokenParsed.exp + keycloak.timeSkew) * 1000)
								.toLocaleString() + '\n';
				o += 'Refresh Expires in:\t'
						+ Math.round(keycloak.refreshTokenParsed.exp
								+ keycloak.timeSkew - new Date().getTime()
								/ 1000) + ' seconds';
			}
			// output(o);

			createCookie("KEYCLOAK_IDENTITY", keycloak.token, 1)

			document.getElementById('subject').innerHTML = keycloak.subject;

			if (keycloak.idToken) {
				document.getElementById('profileType').innerHTML = 'IDToken';
				document.getElementById('username').innerHTML = keycloak.idTokenParsed.preferred_username;
				document.getElementById('email').innerHTML = keycloak.idTokenParsed.email;
				document.getElementById('name').innerHTML = keycloak.idTokenParsed.name;
				document.getElementById('givenName').innerHTML = keycloak.idTokenParsed.given_name;
				document.getElementById('familyName').innerHTML = keycloak.idTokenParsed.family_name;
				document.getElementById('expire').innerHTML = o;
			} else {
				keycloak
						.loadUserProfile(
								function() {
									document.getElementById('profileType').innerHTML = 'Account Service';
									document.getElementById('username').innerHTML = keycloak.profile.username;
									document.getElementById('email').innerHTML = keycloak.profile.email;
									document.getElementById('name').innerHTML = keycloak.profile.firstName
											+ ' ' + keycloak.profile.lastName;
									document.getElementById('givenName').innerHTML = keycloak.profile.firstName;
									document.getElementById('familyName').innerHTML = keycloak.profile.lastName;
								},
								function() {
									document.getElementById('profileType').innerHTML = 'Failed to retrieve user details. Please enable claims or account role';
								});
			}

			/*
			var url = '/database/customers';
			var req = new XMLHttpRequest();
			req.open('GET', url, true);
			req.setRequestHeader('Accept', 'application/json');
			req.setRequestHeader('Authorization', 'Bearer ' + keycloak.token);
			req.onreadystatechange = function () {
			if (req.readyState == 4) {
			if (req.status == 200) {
			var users = JSON.parse(req.responseText);
			var html = '';
			for (var i = 0; i < users.length; i++) {
			html += '<p>' + users[i] + '</p>';
			}
			document.getElementById('customers').innerHTML = html;
			console.log('finished loading data');
			}
			}
			}
			req.send();
			 */
		};
		var loadFailure = function() {
			document.getElementById('customers').innerHTML = '<b>Failed to load data. Check console log</b>';
		};
		var reloadData = function() {

			keycloak.login();

// 			loadData();

			// keycloak.updateToken(10)
			// .success(loadData)
			// .error(function() {
			// });
		}
		keycloak.init({ onLoad: 'login-required' }).success(reloadData);

		$
				.ajax(
						{
							type : "POST",
							contentType : "application/x-www-form-urlencoded",
							data : {
								"grant_type" : "password",
								"username" : user,
								"client_id" : "claveunica-org2",
								"password" : user,
// 								"client_secret" : "5e0db5d0-a1d0-4200-9b2e-b17b73ebc9d0"
							},
							url : "http://localhost:8091/auth/realms/claveunica_org2/protocol/openid-connect/token"
						}).then(function(data) {
					console.log(data.access_token)
					var initOptions = {
						checkLoginIframe : false,
						responseMode : 'fragment',
						flow : 'standard',
// 						onLoad : 'login-required'
					};

					initOptions.token = data.access_token
					initOptions.idToken = data.id_token
					initOptions.refreshToken = data.refresh_token

					console.log(initOptions);
					keycloak.init(initOptions).success(function(authenticated) {
// 						window.location.href = "home.jsp";
						loadData();
					}).error(function() {
					});
				});

		// var initOptions = {checkLoginIframe: false, token: _token, refreshToken: _idToken, idToken: _idToken};
	</script>

<body>


	<h1>js-demo-app</h1>

	<div>
		User <b id="subject"></b> made this request.
		<p>
			<b>User details (from <span id="profileType"></span>)
			</b>
		</p>
		<p>
			Username: <span id="username"></span>
		</p>
		<p>
			Email: <span id="email"></span>
		</p>
		<p>
			Full Name: <span id="name"></span>
		</p>
		<p>
			First: <span id="givenName"></span>
		</p>
		<p>
			Last: <span id="familyName"></span>
		</p>
		<p>
			<span id="expire"></span>
		</p>
	</div>

	<br>
	<br>
	<button onclick="reloadData()">Reload data</button>
</body>
</html>