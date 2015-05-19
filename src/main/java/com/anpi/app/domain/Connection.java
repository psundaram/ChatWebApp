package com.anpi.app.domain;

import org.jivesoftware.smack.XMPPConnection;

public class Connection {
	private XMPPConnection connection;

	public XMPPConnection getConnection() {
		return connection;
	}

	public void setConnection(XMPPConnection connection) {
		this.connection = connection;
	}
	
	

}
