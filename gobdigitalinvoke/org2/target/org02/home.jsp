<html>
<head>
    <script src="http://127.0.0.1:8091/auth/js/keycloak.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <script>

    
// 	function parametroURL(_par) {
// 		  var _p = null;
// 		  if (location.search) location.search.substr(1).split("&").forEach(function(pllv) {
// 		    var s = pllv.split("="), //separamos llave/valor
// 		      ll = s[0],
// 		      v = s[1] && decodeURIComponent(s[1]); //valor hacemos encode para prevenir url encode
// 		    if (ll == _par) { //solo nos interesa si es el nombre del parametro a buscar
// 		      if(_p==null){
// 		      _p=v; //si es nula, quiere decir que no tiene valor, solo textual
// 		      }else if(Array.isArray(_p)){
// 		      _p.push(v); //si ya es arreglo, agregamos este valor
// 		      }else{
// 		      _p=[_p,v]; //si no es arreglo, lo convertimos y agregamos este valor
// 		      }
// 		    }
// 		  });
// 		  return _p;
// 		}
	
// 	var user = parametroURL('user');
    
    

    
    
    function loadProfile() {
        keycloak.loadUserProfile().success(function(profile) {
            output(profile);
        }).error(function() {
            output('Failed to load profile');
        });
    }
    
    function loadUserInfo() {
        keycloak.loadUserInfo().success(function(userInfo) {
            output(userInfo);
        }).error(function() {
            output('Failed to load user info');
        });
    }
    
    function refreshToken(minValidity) {
        keycloak.updateToken(minValidity).success(function(refreshed) {
            if (refreshed) {
                output(keycloak.tokenParsed);
            } else {
                output('Token not refreshed, valid for ' + Math.round(keycloak.tokenParsed.exp + keycloak.timeSkew - new Date().getTime() / 1000) + ' seconds');
            }
        }).error(function() {
            output('Failed to refresh token');
        });
    }
    
    function showExpires() {
        if (!keycloak.tokenParsed) {
            output("Not authenticated");
            return;
        }
        var o = 'Token Expires:\t\t' + new Date((keycloak.tokenParsed.exp + keycloak.timeSkew) * 1000).toLocaleString() + '\n';
        o += 'Token Expires in:\t' + Math.round(keycloak.tokenParsed.exp + keycloak.timeSkew - new Date().getTime() / 1000) + ' seconds\n';
        if (keycloak.refreshTokenParsed) {
            o += 'Refresh Token Expires:\t' + new Date((keycloak.refreshTokenParsed.exp + keycloak.timeSkew) * 1000).toLocaleString() + '\n';
            o += 'Refresh Expires in:\t' + Math.round(keycloak.refreshTokenParsed.exp + keycloak.timeSkew - new Date().getTime() / 1000) + ' seconds';
        }
        output(o);
    }
    
    function liferay() {
    	
//     	window.location.replace("http://localhost:8080/c/portal/login");
    	window.open("http://10.62.4.76:8080/c/portal/login", "_blank");
       
    }

    function output(data) {
        if (typeof data === 'object') {
            data = JSON.stringify(data, null, '  ');
        }
        document.getElementById('output').innerHTML = data;
    }
    
    function event(event) {
        var e = document.getElementById('events').innerHTML;
        document.getElementById('events').innerHTML = new Date().toLocaleString() + "\t" + event + "\n" + e;
    }
    
    var keycloak = Keycloak('keycloak.json');
    keycloak.onAuthSuccess = function () {
        event('Auth Success');
    };
    keycloak.onAuthError = function (errorData) {
        event("Auth Error: " + JSON.stringify(errorData) );
    };
    keycloak.onAuthRefreshSuccess = function () {
        event('Auth Refresh Success');
    };
    keycloak.onAuthRefreshError = function () {
        event('Auth Refresh Error');
    };
    keycloak.onAuthLogout = function () {
        event('Auth Logout');
    };
    keycloak.onTokenExpired = function () {
        event('Access token expired.');
    };
    // Flow can be changed to 'implicit' or 'hybrid', but then client must enable implicit flow in admin console too 
    var initOptions = {
        responseMode: 'fragment',
        flow: 'standard'
    };
//     keycloak.init(initOptions).success(function(authenticated) {
//         output('Init Success (' + (authenticated ? 'Authenticated' : 'Not Authenticated') + ')');
//     }).error(function() {
//         output('Init Error');
//     });



// $.ajax({
// 							type : "POST",
// 							contentType : "application/x-www-form-urlencoded",
// 							data : {
// 								"grant_type" : "password",
// 								"username" : user,
// 								"client_id" : "claveunica-org2",
// 								"password" : user,
// 								"client_secret" : "5e0db5d0-a1d0-4200-9b2e-b17b73ebc9d0"
// 							},
// 							url : "http://localhost:8091/auth/realms/claveunica_org2/protocol/openid-connect/token"
// 						}).then(function(data) {
// 					console.log("POST: ", data.access_token)
// 					var initOptions = {
// 						checkLoginIframe : false,
// 						responseMode : 'fragment',
// 						flow : 'standard',
// 						onLoad : 'login-required'
// 					};

// 					initOptions.token = data.access_token
// 					initOptions.idToken = data.id_token
// 					initOptions.refreshToken = data.refresh_token

// 					console.log("Opciones: ", initOptions);
// 					keycloak.init(initOptions).success(function(authenticated) {
// 						loadData();
// 					}).error(function() {
// 					});
// 				});

 keycloak.init().success(function(authenticated) {
        output('Init Success (' + (authenticated ? 'Authenticated' : 'Authenticated') + ')');
// 	 	   output('Init Success Authenticated);

    }).error(function(err) {

    });

    function cagarpag(){
    	keycloak.login();
    }
    
</script>
</head>
<body>
	<ul id="button">
		<li><a href="http://127.0.0.1:8080/junaeb-01/home.jsp">option01-org01-app01</a></li>
		<li><a href="http://127.0.0.1:8080/junaeb-02/home.jsp">option02-org01-app02</a></li>
		<li><a href="http://127.0.0.1:8081/org02/home.jsp">option03-org02-app01</a></li>
		<li><a href="http://127.0.0.1:8081/org02-app02/home.jsp">option04-org02-app02</a></li>
	</ul>
	<br>
	<h1>ORG02-APP01</h1>
	
	
	<h2>Result</h2>
<pre style="background-color: #ddd; border: 1px solid #ccc; padding: 10px; word-wrap: break-word; white-space: pre-wrap;" id="output"></pre>
	
</body>
</html>