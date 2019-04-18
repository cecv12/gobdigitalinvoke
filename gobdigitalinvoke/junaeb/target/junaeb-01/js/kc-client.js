var tokencu;

	function loadProfile() {
		keycloak.loadUserProfile().success(function(profile) {
			output(profile);redirect
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
		keycloak.updateToken(minValidity).success(
				function(refreshed) {
					if (refreshed) {
						output(keycloak.tokenParsed);
					} else {
						output('Token not refreshed, valid for '
								+ Math.round(keycloak.tokenParsed.exp
										+ keycloak.timeSkew
										- new Date().getTime() / 1000)
								+ ' seconds');
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
							+ keycloak.timeSkew - new Date().getTime() / 1000)
					+ ' seconds';
		}
		output(o);
	}

	function liferay() {

	}

	function output(data) {
		if (typeof data === 'object') {
			data = JSON.stringify(data, null, '  ');
		}
		document.getElementById('output').innerHTML = data;
	}

	function event(event) {

	}

	var keycloak = Keycloak('keycloak.json');
	keycloak.onAuthSuccess = function() {
		event('Auth Success');
	};
	keycloak.onAuthError = function(errorData) {
		event("Auth Error: " + JSON.stringify(errorData));
	};
	keycloak.onAuthRefreshSuccess = function() {
		event('Auth Refresh Success');
	};
	keycloak.onAuthRefreshError = function() {
		event('Auth Refresh Error');
	};
	keycloak.onAuthLogout = function() {
		event('Auth Logout');
	};
	keycloak.onTokenExpired = function() {
		event('Access token expired.');
	};
	// Flow can be changed to 'implicit' or 'hybrid', but then client must enable implicit flow in admin console too 
	var initOptions = {
		responseMode : 'fragment',
		flow : 'standard'
	};

	keycloak.init({

		onLoad : 'login-required'
			
	}).success(
			function(authenticated) {
				output('Init Success ('
						+ (authenticated ? 'Authenticated'
								: 'Not Authenticated') + ')'
						+ 'token clave unica: '
						+ keycloak.tokenParsed.token_claveunica);
				tokencu = keycloak.tokenParsed.token_claveunica;

			}).error(function(err) {
	}); 
	
	
	function cagarpag() {
		keycloak.login();
	}

	function redirect() {
		window.location.href = "http://127.0.0.1:8081/tokenApi-0.1/token/gettoken?token="+ tokencu;
	}