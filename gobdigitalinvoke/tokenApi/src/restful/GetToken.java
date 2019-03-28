package restful;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import com.mashape.unirest.http.Headers;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.nimbusds.oauth2.sdk.ParseException;
import com.nimbusds.oauth2.sdk.SerializeException;

@Path("/gettoken")

public class GetToken {
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)

	public Response token(@Context HttpHeaders headers, @QueryParam("token") String tokenvar)
			throws IOException, ParseException, URISyntaxException, SerializeException, UnirestException {

		System.out.println("servicio web service");
		
		JSONObject infoUser;
		JSONObject usuario;
		JSONObject Json;
		JSONObject JsonToken;
		String username;
		String firstName;
		String lastName;
		String tokenSSO;
		String result;

//		String tokenHeader = headers.getRequestHeader("token").get(0);	
		
		System.out.println("servicio web service " + tokenvar);

		HttpResponse<String> responseUser = Unirest.post("https://www.claveunica.gob.cl/openid/userinfo/")
				.header("Authorization", "Bearer " + tokenvar).header("cache-control", "no-cache").asString();

		int status = responseUser.getStatus();

		System.out.println(responseUser.getStatus());
		System.out.println(responseUser.getStatusText());
		System.out.println(responseUser.getBody());

		if (status == 200) {

			System.out.println("correcto");

			infoUser = new JSONObject(responseUser.getBody());

			JSONObject run = infoUser.getJSONObject("RolUnico");
			username = Integer.toString(run.getInt("numero"));
			JSONObject datos = infoUser.getJSONObject("name");
			JSONArray name = datos.getJSONArray("nombres");
			firstName = name.getString(0);
			JSONArray last = datos.getJSONArray("apellidos");
			lastName = last.getString(0);

			System.out.println("*********************");
			System.out.println("Auntenticando la sesion ws");
			
			HttpResponse<String> responseAut = Unirest
					.post("http://localhost:8091/auth/realms/claveunica_org2/protocol/openid-connect/token")
					.header("content-type", "application/x-www-form-urlencoded").header("cache-control", "no-cache")
					.body("client_id=client_ws&" + "client_secret=fa06795e-c08e-42a7-b80e-1ecf51798342&" + "username=adminws&" + "grant_type=password&" + "password=adminws&=")
					.asString();

			System.out.println("Respuesta al WS");
			System.out.println("Estatus: " + responseAut.getStatus());
			System.out.println("Texto Estadus: " + responseAut.getStatusText());
			System.out.println("Cuerpo: " + responseAut.getBody());

			Json = new JSONObject(responseAut.getBody());
			String token = Json.getString("access_token");
			System.out.println("access_token : " + token);

			usuario = new JSONObject("{\"username\":\"" + username + "\",\"enabled\":true,\"firstName\":\""
					+ firstName + "\",\"lastName\":\"" + lastName
					+ "\",\"credentials\":[{\"type\":\"password\",\"value\":\"" + username + "\"}]}");
			
			System.out.println("creacion de Usuario en sso");
			
			HttpResponse<String> responseCreate = Unirest
					.post("http://localhost:8091/auth/admin/realms/claveunica_org2/users")
					.header("Authorization", "Bearer " + token).header("Content-Type", "application/json")
					.body(usuario)
					.asString();

			System.out.println("Status Create: " + responseCreate.getStatus());
			System.out.println("*********************");
			
			
			
			System.out.println("Auntenticando la sesion del usuario");

			HttpResponse<String> responseSesion = Unirest
					.post("http://localhost:8091/auth/realms/claveunica_org2/protocol/openid-connect/token")
					.header("content-type", "application/x-www-form-urlencoded").header("cache-control", "no-cache")
					.body("client_id=claveunica-org2&" + "username=" + username + "&" + "grant_type=password&" + "password=" + username + "&=")
					.asString();

			System.out.println("Respuesta de autenticacion del usuario");
			System.out.println(responseSesion.getStatus());
			System.out.println(responseSesion.getStatusText());
			System.out.println("cuerpo: " + responseSesion.getBody());
//
//			JsonToken = new JSONObject(responseSesion.getBody());
//			
//			tokenSSO = JsonToken.getString("access_token");
			
//			result = "{\"Status\": \""+responseSesion.getStatus()+"\", \"StatusText\": \""+responseSesion.getStatusText()+"\", \"token\": " + "\"" + tokenSSO + "\"}";

			
			return Response.temporaryRedirect(new URI("http://127.0.0.1:8081/org02/home.jsp?user=" + username))
					.header("token", username)
					.header("Access-Control-Allow-Origin", "*")
					.build();
			
		} else {
			
			
//			 result = "{\"Status\": \"401\", \"StatusText\": " + "\"Unauthorized\"}";

			 return Response.temporaryRedirect(new URI("http://127.0.0.1:8081/org02/index.jsp?token=NoAuthorized"))
					 .header("token" , "NoAuthorized")
					 .header("Access-Control-Allow-Origin", "*")
					 .build();

		}
// return null;

	}
}
