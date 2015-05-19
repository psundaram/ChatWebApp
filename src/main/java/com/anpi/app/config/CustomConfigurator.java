package com.anpi.app.config;

import java.text.MessageFormat;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

import com.anpi.app.service.GroupChat;
import com.anpi.app.service.JabberSmackAPI;
import com.anpi.app.service.ReceiveChat;

public class CustomConfigurator extends ServerEndpointConfig.Configurator
{
	    HttpSession httpSession;

	    // modifyHandshake() is called before getEndpointInstance()!
	    @Override
	    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response)
	    {
	        httpSession = (HttpSession) request.getHttpSession();
	        super.modifyHandshake(sec, request, response);
	    }

	    @Override
	    public <T> T getEndpointInstance(Class<T> endpointClass) throws InstantiationException
	    {
	        T endpoint = super.getEndpointInstance(endpointClass);

	        if (endpoint instanceof JabberSmackAPI)
	            ((JabberSmackAPI) endpoint).setHttpSession(httpSession); 
	        // <-- The injection point
	      
	       /* else  if (endpoint instanceof ReceiveChat)
	            ((ReceiveChat) endpoint).setHttpSession(httpSession);*/
	        else if (endpoint instanceof GroupChat)
	            ((GroupChat) endpoint).setHttpSession(httpSession); // <-- The injection point
	        else
	            throw new InstantiationException(
	                    MessageFormat.format("Expected instanceof \"{0}\".",
	                    		 endpoint.getClass()));

	        return endpoint;
	    }
}
