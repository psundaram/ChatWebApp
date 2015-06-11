package com.anpi.app.service;

import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.MessageTypeFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.StringUtils;

import com.anpi.app.config.CustomConfigurator;
import com.anpi.app.domain.Connection;

@ServerEndpoint(value = "/chatRoom",configurator = CustomConfigurator.class)
public class JabberSmackAPI implements MessageListener,PacketListener {
	
	private static List<String> connectedSessions = new LinkedList<String>();
	
	XMPPConnection connection;

	private HttpSession httpSession;

    public void setHttpSession(HttpSession httpSession)
    {
    if (this.httpSession != null)
        throw new IllegalStateException("HttpSession has already been set!");

    this.httpSession = httpSession;
    }
    
	private final Logger log = Logger.getLogger(getClass().getName());
	Session dummySession;

	@OnOpen
	public void open(Session session) throws Exception {
		System.out.println(session.getId() +" has opened a connection");
//		log.info("session openend and bound to room: " + room);
//		login("mouli", "123456");
//		displayBuddyList();
		System.out.println("-----");
//		connectedSessions.add(room);
//		httpSession.setAttribute("userSession", connectedSessions);
		this.dummySession = session;
		Connection connections = (Connection) httpSession.getAttribute("connection");
		
		PacketFilter filter = new MessageTypeFilter(Message.Type.chat);
	        connections.getConnection().addPacketListener(this,filter);
//		System.out.println("session:"+httpSession.getId());
//		session.getUserProperties().put("room", room);
	}
	
	@OnMessage
	public void onMessage(Session session,String message){
		System.out.println(session.getId() +" messaged  " + message);
		String to ="mouli@mouli";
//		String room = (String) session.getUserProperties().get("room");
//		System.out.println("room:" + room);
//		System.out.println("connectedSession:"+connectedSessions);
		try {
			
			//for (Session s : session.getOpenSessions()) {
//				if (s.isOpen() && room.equals(s.getUserProperties().get("room"))) {
					System.out.println("Message:" + message);
					String[] messageStr = message.split("##");
					// s.getBasicRemote().sendText(message);
					sendMessage(messageStr[1],messageStr[0]);
//				}
			//}
		} catch (Exception e) {
			log.log(Level.WARNING, "onMessage failed", e);
		}
	}
	@OnClose
	public void onClose(Session session) throws Exception
	{
		System.out.println("session "+ session.getId() +"has ended");
//		String room = (String) session.getUserProperties().get("room");
//		connectedSessions.remove(room);
		session.close();
	}
	
	public void sendMessage(String message, String to) throws XMPPException {
		Connection connections = (Connection) httpSession.getAttribute("connection");
		Chat chat = connections.getConnection().getChatManager().createChat(to, this);
		chat.sendMessage(message);
	}

	public void processMessage(Chat chat, Message message) {
		if (message.getType() == Message.Type.chat)
			System.out.println(chat.getParticipant() + " says: " + message.getBody());
		/*try {
				dummySession.getBasicRemote().sendText(chat.getParticipant()+"##"+message.getBody());
			} catch (IOException e) {
				e.printStackTrace();
			}*/
	}

	public void processPacket(Packet packet) {
		 Message message = (Message) packet;
	        try{
	         System.out.println("userSession:"+ httpSession.getAttribute("userSession"));
	         if (message.getBody() != null) {
	             String fromName = StringUtils.parseBareAddress(message
	                     .getFrom());
	            System.out.println("XMPPClient Got text [" + message.getBody()
	                     + "] from [" + fromName + "]");
	            
	            dummySession.getBasicRemote().sendText(fromName+"##"+message.getBody());
	         }
	         }catch(Exception e){
	         	e.printStackTrace();
	         }
		
	}
}