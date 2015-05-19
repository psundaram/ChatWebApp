package com.anpi.app.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.anpi.app.domain.User;

public class RestAPI {

	public static String getCall(String urlString) throws Exception {
		URL url = new URL(urlString);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", "MN8a3In8Y6EhWn5x");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		String apiOutput = br.readLine();
		System.out.println(apiOutput);
		conn.disconnect();
		return apiOutput;
	}

	public static String postCall(String urlString, String payload) throws Exception {
		URL url = new URL(urlString);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Authorization", "MN8a3In8Y6EhWn5x");

		OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
		writer.write(payload);
		writer.flush();
		if (conn.getResponseCode() != HttpURLConnection.HTTP_CREATED) {
			throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
		}
		String output;
		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		while ((output = br.readLine()) != null) {
			System.out.println(output);
		}
		System.out.println("Output from Server .... \n");

		conn.disconnect();
		return output;
	}

	public static String deleteCall(String urlString) throws Exception {
		URL url = new URL(urlString);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setRequestMethod("DELETE");
//		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", "MN8a3In8Y6EhWn5x");
		/*if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
		}*/

		String output;
		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		while ((output = br.readLine()) != null) {
			System.out.println(output);
		}
		conn.disconnect();
		return urlString;
	}

}
