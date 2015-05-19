package com.anpi.app.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.websocket.Session;

import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.MessageTypeFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.muc.InvitationListener;
import org.jivesoftware.smackx.muc.InvitationRejectionListener;
import org.jivesoftware.smackx.muc.MultiUserChat;
import org.jivesoftware.smackx.muc.RoomInfo;
import org.jivesoftware.smackx.muc.SubjectUpdatedListener;
import org.jivesoftware.smackx.packet.DiscoverItems;

public class MultiUserChatManager  {
	 XMPPConnection connection;
	
	
	   private List participants = new ArrayList();

	   private PacketFilter presenceFilter;
	   private PacketFilter messageFilter;
	   private PacketCollector messageCollector;
	   
	
	MultiUserChat muc ; 
	
	 public void addParticipantListener(PacketListener listener) {
	       connection.addPacketListener(listener, presenceFilter);
	   }
	 
	 public void addMessageListener(PacketListener listener) {
	       connection.addPacketListener(listener, messageFilter);
	   }

	 
	public  boolean isServiceEnable(String user){
		
		return muc.isServiceEnabled(connection,user);
	}
	
	private boolean isJoined(MultiUserChat tmuc, String user)
			throws XMPPException {
		boolean isjoined = false;
		if (muc != null) {
			try {
				muc.isJoined();
			} catch (IllegalStateException ise) {
				/* if no logged into exception is called. */
				return false;
			}

		} else {
			try {
				/* find out occupants of the muc room without be joined before. */
				ServiceDiscoveryManager discoManager = ServiceDiscoveryManager
						.getInstanceFor(connection);
				DiscoverItems items = discoManager.discoverItems("testuser1@conference.mouli");
				for (Iterator<org.jivesoftware.smackx.packet.DiscoverItems.Item> it = items.getItems(); it.hasNext();) {
					DiscoverItems.Item item = (DiscoverItems.Item) it.next();
					if (item.getEntityID().equals("testuser1@conference.mouli" + "/" + user)) {
						return true;
					}
				}

			} catch (XMPPException xe) {
				xe.printStackTrace();
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return isjoined;
	}
	
	public List<String> getConnectedUsers(MultiUserChat multiUserChat) {
        Iterator<String> temp = muc.getOccupants();
        List<String> copy = new ArrayList<String>();
        while (temp.hasNext())
            copy.add(temp.next());
        System.out.println(copy);
        return Collections.unmodifiableList(copy);
    }
	
	
	public int getRoomInfo(MultiUserChat multiUserChat) throws XMPPException{

		// Discover information about the room roomName@conference.myserver
		RoomInfo info = multiUserChat.getRoomInfo(connection, "testuser1@conference.mouli");
		System.out.println("Number of occupants:" + info.getOccupantsCount());
		System.out.println("Room Subject:" + info.getSubject());
		return info.getOccupantsCount();
	}
	
	PacketListener peopleListener = new PacketListener() {

        public void processPacket(Packet packet) {
            //System.out.println("People PacketData:" + packet.toXML());
            if (packet.getClass().toString().equalsIgnoreCase(
                    "class org.jivesoftware.smack.packet.Presence")) {
                Presence p = (Presence) packet;

                try {
                    System.out.println("Presence from: " + p.getFrom());
                    System.out.println("Presence :" + p.toString());

                    String[] username = p.getFrom().split("/");
                    String t[] = username[0].split("@");
                    //System.out.println("Room:"+t[0]+",msg:"+m.getBody()+",User:"+username[1]);
                    if (p.toString().equalsIgnoreCase("available")) {
                        System.out.println(t[0] +  "** '" + username[1] + "' joined the room **" + t[1]);
                    } else if (p.toString().equalsIgnoreCase("unavailable")) {
                    	System.out.println(t[0] + "** '" + username[1] + "' left the room **"+ t[1]);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    };
	
	@SuppressWarnings("static-access")
	public MultiUserChat createRoom(XMPPConnection connection) throws XMPPException {
		// Get the MultiUserChatManager
		this.connection = connection;
		System.out.println(connection.getRoster().getEntries().size());
		 muc = new MultiUserChat(connection, "testuser1@conference.mouli");
		muc.create("testuser1");
//		muc.join("user1");
		muc.sendConfigurationForm(new Form(Form.TYPE_SUBMIT));
		System.out.println("MUC created");
//		boolean isenable = isServiceEnable("testuser@mouli/Smack");
//		System.out.println(isenable);
		// Invite list of users to join conference 
		muc.invite("testuser@mouli", "Chat");
		muc.invite("mouli@mouli", "Chat");
		muc.invite("priya@mouli", "Chat");
		
		
		muc.addSubjectUpdatedListener(new SubjectUpdatedListener() {
			
			public void subjectUpdated(String subject, String from) {
				System.out.println("subject changed to " + subject + "by " + from) ;
				
			}
		});
	
		
		muc.addParticipantListener(peopleListener);
//		muc.addUserStatusListener(new UserStatusListener() {
//		});
		
		muc.addInvitationRejectionListener(new InvitationRejectionListener() {
			public void invitationDeclined(String invitee, String reason){
		        System.out.println("Invite Rejected: By " + invitee + " Reason: "+ reason);
		        }
		});
		
		muc.addInvitationListener(connection,new InvitationListener() {
			public void invitationReceived(XMPPConnection conn, String room, String inviter, String reason, String password, Message message) {
				// Decline invitations 
				System.out.println("Invitation received");
//				 MultiUserChat.decline(conn, room, inviter, "I'm busy right now");
			}
		});
		return muc;
	}
	
	
	public void sendMessage(String message, final Session session) throws XMPPException{
		Message msg = new Message("testuser1@conference.mouli", Message.Type.groupchat);
		msg.setBody(message);
		muc.sendMessage(msg);
//		muc.changeSubject("Conference room");
		PacketFilter filter = new MessageTypeFilter(Message.Type.groupchat);
		connection.addPacketListener(new PacketListener(
				) {
			
			public void processPacket(Packet packet) {
				Message message = (Message) packet;
				 String name=packet.getFrom().substring(0,packet.getFrom().indexOf("/"));
//				 System.out.println("name:"+name);
				if (message.getBody() != null) {
					String from = message.getFrom();
					String content = message.getBody();
					System.out.println("content:" + content + " from :" + name);
					try {
						session.getBasicRemote().sendText(content);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
		}, filter);
	}


}
