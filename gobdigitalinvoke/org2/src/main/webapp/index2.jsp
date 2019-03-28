<html>
<head>
    <script src="http://127.0.0.1:8090/auth/js/keycloak.js"></script>
    
    <script>

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
    keycloak.init(initOptions).success(function(authenticated) {
        output('Init Success (' + (authenticated ? 'Authenticated' : 'Not Authenticated') + ')');
    }).error(function() {
        output('Init Error');
    });

//  keycloak.init({ onLoad: 'login-required' }).success(function(authenticated) {
//         output('Init Success (' + (authenticated ? 'Authenticated' : 'Not Authenticated') + ')');

//     }).error(function(err) {

//     });
    
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
