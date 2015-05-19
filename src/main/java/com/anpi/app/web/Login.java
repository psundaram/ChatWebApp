package com.anpi.app.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.RosterGroup;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.MessageTypeFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.Presence.Mode;
import org.jivesoftware.smack.packet.Presence.Type;
import org.jivesoftware.smack.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.anpi.app.domain.Connection;
import com.anpi.app.domain.Contacts;
import com.sun.corba.se.pept.transport.ContactInfo;

@Controller
public class Login {

	XMPPConnection connection;

	private HttpSession httpSession;

    public void setHttpSession(HttpSession httpSession)
    {
    if (this.httpSession != null)
        throw new IllegalStateException("HttpSession has already been set!");

    this.httpSession = httpSession;
    }
    
    
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(String message) {
		// login("mouli", "123456");
		// displayBuddyList();
		System.out.println("-----");
		System.out.println("Mesage:" + message);
		// list.add("psundaram@anpi.com");
		return new ModelAndView("login", "errorMsg", message);
	}

	@RequestMapping(value = "/login/authenticate", method = RequestMethod.POST)
	public String login(String userName, String password, HttpServletRequest request) {
		System.out.println("Authenticate :");
		try {
			ConnectionConfiguration config = new ConnectionConfiguration("10.5.3.217");
			connection = new XMPPConnection(config);
			connection.connect();
			connection.login(userName, password);

			System.out.println("Success");
			Connection connections = new Connection();
			connections.setConnection(connection);
			 /*PacketFilter filter = new MessageTypeFilter(Message.Type.chat);
		        connection.addPacketListener(this,filter);*/
			Presence p = new Presence(Presence.Type.available, "Online", 42, Mode.available);
			connection.sendPacket(p);
			request.getSession().setAttribute("connection", connections);
			request.getSession().setAttribute("userName", userName);
			return "redirect:/displayContacts";
		} catch (XMPPException e) {
			e.printStackTrace();
			System.out.println("Failure");
			return "redirect:/login?message=Invalid Login";

		}
	}

	@RequestMapping("/displayContacts")
	public ModelAndView displayBuddyList(Connection connections, HttpServletRequest request) {
		System.out.println("display");
		List<Contacts> listOfUsers = new ArrayList<Contacts>();
		connections = (Connection) request.getSession().getAttribute("connection");

		Roster roster = connections.getConnection().getRoster();
		Collection<RosterEntry> entries = roster.getEntries();

		System.out.println("\n\n" + entries.size() + " buddy(ies):");
		for (RosterEntry r : entries) {
			Contacts contacts = new Contacts();
			System.out.println(r.getUser() + "," + r.getStatus() + "," + r.getName());
			System.out.println(r.getUser().split("@")[0]);
			contacts.setName(r.getUser().split("@")[0]);
			contacts.setUserName(r.getUser());
			try { Thread.sleep(500); } catch (InterruptedException e) { }
			Presence presence = roster.getPresence(r.getUser());
		    System.out.println("Presence status: "+presence.getStatus());                                    
		    System.out.println("Presence type: "+presence.getType());                
		    System.out.println("Presence mode: "+presence.getMode()); 
		    if(presence.getType().equals(Presence.Type.available))
		    	contacts.setStatus(presence.getStatus());
		    else
		    	contacts.setStatus(Presence.Type.unavailable.toString());
		    
			listOfUsers.add(contacts);
		}
		Collection<RosterGroup> rosterGroups = roster.getGroups();
		
		
		return new ModelAndView("chat-new", "users", listOfUsers);
	}

	@RequestMapping("/chat")
	public ModelAndView chat(HttpServletRequest request) {
		System.out.println("chat:" + request.getParameter("toAddress"));
		String toAddress = request.getParameter("toAddress");
		return new ModelAndView("chat-new", "toAddress", toAddress);
	}

	@RequestMapping("/group_chat")
	public ModelAndView chatRoom(HttpServletRequest request) throws Exception {
		Connection connections = (Connection) request.getSession().getAttribute("connection");
	/*	MultiUserChatManager multiUser = new MultiUserChatManager();
		// multiUser.login("testuser1", "123456");
		MultiUserChat muc = multiUser.createRoom(connections.getConnection());
		multiUser.sendMessage();
		Thread.sleep(10000);
		multiUser.getRoomInfo(muc);
		Thread.sleep(30000);*/
		String roomId = request.getParameter("roomId");
		return new ModelAndView("chatroom","roomId",roomId);
	}

	 /*public void processPacket(Packet packet) {

         Message message = (Message) packet;
        try{
         System.out.println( httpSession.getAttribute("userSession"));
         if (message.getBody() != null) {
             String fromName = StringUtils.parseBareAddress(message
                     .getFrom());
            System.out.println("XMPPClient Got text [" + message.getBody()
                     + "] from [" + fromName + "]");
         }
         }catch(Exception e){
         	e.printStackTrace();
         }
     }*/

		
	           
	        	
	
}
