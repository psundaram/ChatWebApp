package com.anpi.app.listener;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.RosterListener;
import org.jivesoftware.smack.packet.Presence;

import com.anpi.app.domain.Connection;

public class PresenceListener  {
	
	public void presenceListener(HttpServletRequest request){
		Connection connections = (Connection) request.getSession().getAttribute("connection");
		
		Roster roster = connections.getConnection().getRoster();
		Collection<RosterEntry> entries = roster.getEntries();

		System.out.println("\n\n" + entries.size() + " buddy(ies):");
		roster.addRosterListener(new RosterListener() {
			// Ignored events public void entriesAdded(Collection<String> addresses) {}
			public void entriesDeleted(Collection<String> addresses) {}
			public void entriesUpdated(Collection<String> addresses) {}
			public void presenceChanged(Presence presence) {
				System.out.println("Presence changed: " + presence.getFrom() + " " + presence);
			}
			public void entriesAdded(Collection<String> arg0) {
			}
		});
	}
}
