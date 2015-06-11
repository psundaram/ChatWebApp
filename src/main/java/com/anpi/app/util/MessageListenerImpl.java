package com.anpi.app.util;

import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smackx.ChatState;
import org.jivesoftware.smackx.ChatStateListener;

public class MessageListenerImpl implements MessageListener,ChatStateListener  {


	public void stateChanged(Chat chat, ChatState state) {
		System.out.println("State changed :" +state.name());
		if (ChatState.composing.equals(state)) {
			 System.out.println("Chat State" + chat.getParticipant() + " is typing..");
        } else if (ChatState.gone.equals(state)) {
        	 System.out.println("Chat State" + chat.getParticipant() + " has left the conversation.");
        } else {
        	 System.out.println("Chat State" + chat.getParticipant() + ": " + state.name());
        }
		
	}

	public void processMessage(Chat arg0, Message arg1) {
		   System.out.println("Received message: " + arg1);

		
	}

}
