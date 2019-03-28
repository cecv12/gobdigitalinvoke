<html>
<head>
<!--     <script src="http://127.0.0.1:8090/auth/js/keycloak.js"></script> -->

<script src="keycloak.js"></script>
    
    <script>
    
    
    
//     function createCookie(name, value, days) {
// 		var expires = "";
// 		if (days) {
// 			var date = new Date();
// 			date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
// 			expires = "; expires=" + date.toUTCString();
// 		}
// 		document.cookie = name + "=" + value + expires + "; path=/";
// 	}
    
    
    

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

// createCookie("KEYCLOAK_IDENTITY", "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJ0bjRQYmZ2cElOTGh3SUVNVUxFYWZHZWZHTUFpMG5OdXJPeWM2cFVsZUt3In0.eyJqdGkiOiIwMWE4MDFkNi02YTQ4LTQzMjAtYjgxMS1hY2FkZjI5ZmY3ZTkiLCJleHAiOjE1NTM2MDY2OTAsIm5iZiI6MCwiaWF0IjoxNTUzNjA2MzkwLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwOTAvYXV0aC9yZWFsbXMvY2xhdmV1bmljYSIsImF1ZCI6ImNsYXZldW5pY2EtY2xpZW50ZSIsInN1YiI6IjkxNzZkMjdlLWUyMDQtNGI0ZS04Mjc5LTQ3NjgyMmYzOTkwNSIsInR5cCI6IkJlYXJlciIsImF6cCI6ImNsYXZldW5pY2EtY2xpZW50ZSIsImF1dGhfdGltZSI6MCwic2Vzc2lvbl9zdGF0ZSI6IjJiMTRkZTQyLWQwZTQtNDVkOS1iMGFlLWNlZjM3OGFkYjg4OCIsImFjciI6IjEiLCJhbGxvd2VkLW9yaWdpbnMiOlsiKiJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsidW1hX2F1dGhvcml6YXRpb24iXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJuYW1lIjoiTWFyaWEgRGVsIHJpbyIsInByZWZlcnJlZF91c2VybmFtZSI6IjQ0NDQ0NDQ0IiwiZ2l2ZW5fbmFtZSI6Ik1hcmlhIiwiZmFtaWx5X25hbWUiOiJEZWwgcmlvIn0.CcCf3OWeDusfykPNy_maA0bepTkyktpPA9gLEndAZsk-BGgvBErlIbZ4zKf1Rmfq4OMzAlkP2bBko7ZnS33ZdG3KRBfmZ1nSgWi9cp3d3WS594qnn8m7m4IiaIP1OC-MpvfENuOP_MoBOYj7coxZimzm0hVozPdDKEUEchzxuvMQ_HQ2w4yz4SZFG3DzlLRCRAYp9CE4OmnXxjSkvAl9mox1huQ1FmBCn-L6AR94ST-yx3o3kGIQcBZxnHMFNGEQoETXTg7cmmbDAbrLFhMa5SWj5BzYu3bnRLR1OSQGnebdIkDXCWX-poZfthzc2IF9XHLfF3Olql3T9-J7-U7-CQ", 1)

// document.cookie = "KEYCLOAK_IDENTITY=eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJ0bjRQYmZ2cElOTGh3SUVNVUxFYWZHZWZHTUFpMG5OdXJPeWM2cFVsZUt3In0.eyJqdGkiOiIwMWE4MDFkNi02YTQ4LTQzMjAtYjgxMS1hY2FkZjI5ZmY3ZTkiLCJleHAiOjE1NTM2MDY2OTAsIm5iZiI6MCwiaWF0IjoxNTUzNjA2MzkwLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwOTAvYXV0aC9yZWFsbXMvY2xhdmV1bmljYSIsImF1ZCI6ImNsYXZldW5pY2EtY2xpZW50ZSIsInN1YiI6IjkxNzZkMjdlLWUyMDQtNGI0ZS04Mjc5LTQ3NjgyMmYzOTkwNSIsInR5cCI6IkJlYXJlciIsImF6cCI6ImNsYXZldW5pY2EtY2xpZW50ZSIsImF1dGhfdGltZSI6MCwic2Vzc2lvbl9zdGF0ZSI6IjJiMTRkZTQyLWQwZTQtNDVkOS1iMGFlLWNlZjM3OGFkYjg4OCIsImFjciI6IjEiLCJhbGxvd2VkLW9yaWdpbnMiOlsiKiJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsidW1hX2F1dGhvcml6YXRpb24iXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJuYW1lIjoiTWFyaWEgRGVsIHJpbyIsInByZWZlcnJlZF91c2VybmFtZSI6IjQ0NDQ0NDQ0IiwiZ2l2ZW5fbmFtZSI6Ik1hcmlhIiwiZmFtaWx5X25hbWUiOiJEZWwgcmlvIn0.CcCf3OWeDusfykPNy_maA0bepTkyktpPA9gLEndAZsk-BGgvBErlIbZ4zKf1Rmfq4OMzAlkP2bBko7ZnS33ZdG3KRBfmZ1nSgWi9cp3d3WS594qnn8m7m4IiaIP1OC-MpvfENuOP_MoBOYj7coxZimzm0hVozPdDKEUEchzxuvMQ_HQ2w4yz4SZFG3DzlLRCRAYp9CE4OmnXxjSkvAl9mox1huQ1FmBCn-L6AR94ST-yx3o3kGIQcBZxnHMFNGEQoETXTg7cmmbDAbrLFhMa5SWj5BzYu3bnRLR1OSQGnebdIkDXCWX-poZfthzc2IF9XHLfF3Olql3T9-J7-U7-CQ; path=/";

 keycloak.init({ onLoad: 'login-required' }).success(function(authenticated) {
        output('Init Success (' + (authenticated ? 'Authenticated' : 'Not Authenticated') + ')');

    }).error(function(err) {

    });
    
</script>
</head>

<body>

<div>
    <button onclick="keycloak.login()">Login</button>
    <button onclick="keycloak.logout()">Logout</button>
    <button onclick="keycloak.register()">Register</button>
    <button onclick="refreshToken(9999)">Refresh Token</button>
    <button onclick="refreshToken(30)">Refresh Token (if <30s validity)</button>
    <button onclick="loadProfile()">Get Profile</button>
    <button onclick="loadUserInfo()">Get User Info</button>
    <button onclick="output(keycloak.tokenParsed)">Show Token</button>
    <button onclick="output(keycloak.refreshTokenParsed)">Show Refresh Token</button>
    <button onclick="output(keycloak.idTokenParsed)">Show ID Token</button>
    <button onclick="showExpires()">Show Expires</button>
    <button onclick="output(keycloak)">Show Details</button>
    <button onclick="output(keycloak.createLoginUrl())">Show Login URL</button>
    <button onclick="output(keycloak.createLogoutUrl())">Show Logout URL</button>
    <button onclick="output(keycloak.createRegisterUrl())">Show Register URL</button>
    <button onclick="liferay()">Liferay</button>
    
    
</div>

<h2>Result</h2>
<pre style="background-color: #ddd; border: 1px solid #ccc; padding: 10px; word-wrap: break-word; white-space: pre-wrap;" id="output"></pre>

<h2>Events</h2>
<pre style="background-color: #ddd; border: 1px solid #ccc; padding: 10px; word-wrap: break-word; white-space: pre-wrap;" id="events"></pre>

</body>
</html>
