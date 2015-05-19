package com.anpi.app.admin;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anpi.app.domain.Group;
import com.anpi.app.domain.User;
import com.anpi.app.util.RestAPI;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class AdminController {

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView users(String search) throws Exception {
		System.out.println("value:" + search);
		String userList = RestAPI.getCall("http://10.5.3.217:9090/plugins/restapi/v1/users");
		JSONObject jsonO = new JSONObject(userList.toString());
		JSONArray jsonObj = jsonO.getJSONArray("user");
		List<User> listOfParameter = new ArrayList<User>();
		Gson gson = new Gson();
		Type collectionType = new TypeToken<User>() {
		}.getType();
		if (jsonObj != null && jsonObj.length() > 0) {
			for (int i = 0; i < jsonObj.length(); i++) {
				JSONObject jsonObject = (JSONObject) jsonObj.get(i);
				User user = gson.fromJson(jsonObject.toString(), collectionType);
				System.out.println("User --> " + user.toString());
				listOfParameter.add(user);
			}
		}
		return new ModelAndView("user", "userList", listOfParameter);

	}

	@RequestMapping(value = "/get_group", method = RequestMethod.GET)
	@ResponseBody
	public String getGroupForUser(String name) {
		String output = null;
		System.out.println("name:" + name);
		try {
			output = RestAPI.getCall("http://10.5.3.217:9090/plugins/restapi/v1/users/" + name + "/groups");
			System.out.println(output);
		} catch (Exception e) {
		}
		// return new ModelAndView("group");
		return output;
	}
	@RequestMapping(value = "/add_user_group", method = RequestMethod.GET)
	@ResponseBody
	public String addUserToGroup(String name, String group) {
		String output = null;
		System.out.println("name:" + name);
//		String gsonString = "{\"groupname\":\"GP006\"}";
		try {
			output = RestAPI.postCall("http://10.5.3.217:9090/plugins/restapi/v1/users/" + name + "/groups",group);
			System.out.println(output);
		} catch (Exception e) {
		}
		// return new ModelAndView("group");
		return output;
	}
	
	@RequestMapping(value = "/get_roster", method = RequestMethod.GET)
	@ResponseBody
	public String getRosterForUser(String name) {
		String output = null;
		System.out.println("name:" + name);
		try {
			output = RestAPI.getCall("http://10.5.3.217:9090/plugins/restapi/v1/users/" + name + "/roster");
			System.out.println(output);
		} catch (Exception e) {
		}
		// return new ModelAndView("group");
		return output;
	}

	@RequestMapping(value = "/group", method = RequestMethod.GET)
	public ModelAndView getGroups() throws Exception {
		String userList = RestAPI.getCall("http://10.5.3.217:9090/plugins/restapi/v1/groups");

		JSONObject jsonO = new JSONObject(userList.toString());
		JSONArray jsonObj = jsonO.getJSONArray("group");
		List<Group> listOfParameter = new ArrayList<Group>();

		Gson gson = new Gson();
		Type collectionType = new TypeToken<Group>() {
		}.getType();
		if (jsonObj != null && jsonObj.length() > 0) {
			for (int i = 0; i < jsonObj.length(); i++) {
				JSONObject jsonObject = (JSONObject) jsonObj.get(i);
				Group group = gson.fromJson(jsonObject.toString(), collectionType);
				System.out.println("group --> " + group.toString());
				listOfParameter.add(group);
			}
		}
		return new ModelAndView("group", "groupList", listOfParameter);
	}

	@RequestMapping(value = "/create_group", method = RequestMethod.POST)
	public ModelAndView createGroup(Group group) throws Exception {
		System.out.println("Group:" + group.toString());
		String gsonString = new Gson().toJson(group, Group.class);
		System.out.println("gsonString" + gsonString);
		try {
			RestAPI.postCall("http://10.5.3.217:9090/plugins/restapi/v1/groups", gsonString);
		} catch (Exception e) {
		}
		return new ModelAndView("group");
	}

	@RequestMapping(value = "/delete_group", method = RequestMethod.GET)
	public ModelAndView deleteGroup(String name) throws Exception {
		System.out.println("Group:" + name);
		try {
			RestAPI.deleteCall("http://10.5.3.217:9090/plugins/restapi/v1/groups/" + name);
		} catch (Exception e) {
		}
		return new ModelAndView("group");
	}

	public static void main(String[] args) throws Exception {
//		new AdminController().addUserToGroup("testuser");
	}

}
