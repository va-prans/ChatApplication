/**
 * Created by CIA on 26/09/2017.
 */

import DatabaseWrapper.DatabaseConnection;
import com.google.gson.Gson;


import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;

@ServerEndpoint("/Chat")
public class ChatServer {

    private static DatabaseConnection databaseConnection = new DatabaseConnection();
    static Set<Session> unauthorizedUsers = Collections.synchronizedSet(new HashSet<Session>());
    static Set<Session> authorizedUsers = Collections.synchronizedSet(new HashSet<Session>());
    static HashMap<Session, String> usernames = new HashMap<>();

    @OnOpen
    public void onOpen(Session userSession){
        System.out.println("New unauthorized user has connected to the server (Session ID: " + userSession.getId() + ")");
        unauthorizedUsers.add(userSession);
    }
    @OnMessage
    public void handleMessage(String message, Session userSession) {
        //if user is authorized
        if (authorizedUsers.contains(userSession)) {
            //send messages to all authorized users
            messageUsers(userSession.getUserProperties().get("username") + ": " + message);
        } else { //if user is unauthorized
            //determine client command
            String currentUserDetails[] = message.split("/");

            if (currentUserDetails[2].equals("create")){
                databaseConnection.createUserAccount(currentUserDetails[0], currentUserDetails[1]);
            }
            else if (currentUserDetails[2].equals("login")){
                if(databaseConnection.passwordCorrect(currentUserDetails[0], currentUserDetails[1])) { //successful authentication
                    messageUsers(currentUserDetails[0] + " has joined the chat. Say hello!");
                    //link user session with username
                    userSession.getUserProperties().put("username", currentUserDetails[0]);
                    //remove user session from unauthorized and add to authorized
                    unauthorizedUsers.remove(userSession);
                    authorizedUsers.add(userSession);
                    usernames.put(userSession, currentUserDetails[0]);
                    System.out.println("-----------------\n[User authorized]\nName: " + currentUserDetails[0] + " \nSession ID: " + userSession.getId() + "\n-----------------");
                    try {
                        userSession.getBasicRemote().sendText(jsonBuilder("Welcome to the chat! You are now connected as '" + currentUserDetails[0] + "'\n"));
                        sendListToUsers();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    @OnClose
    public void onClose(Session userSession){
        closeSession(userSession);
    }

    @OnError
    public void onError(Session userSession, Throwable t){
        closeSession(userSession);
    }

    private void closeSession(Session userSession){
        if (authorizedUsers.contains(userSession)) {
            System.out.println("Authorized user has disconnected from the server (Session ID: " + userSession.getId() + ")");
            authorizedUsers.remove(userSession);
        }
        else if (unauthorizedUsers.contains(userSession)) {
            System.out.println("Unauthorized user has disconnected from the server (Session ID: " + userSession.getId() + ")");
            authorizedUsers.remove(userSession);
        }
        if (usernames.containsKey(userSession)) {
            messageUsers(usernames.get(userSession) + " has left the chat.");
            usernames.remove(userSession);
            sendListToUsers();
        }

    }

    private void sendListToUsers() {
        String userList = "";
        Collection<String> names = usernames.values();
        int index = 1;
        for (String s : names) {
            if (index == names.size()) {
                userList += s;
            }
            else {
                userList += s + ",";
            }
            index++;
        }
        messageUsers("_GETUSERLIST_" + userList);
    }

    private void messageUsers(String message) {
        for (Session authorizedUser : authorizedUsers) {
            try {
                authorizedUser.getBasicRemote().sendText(jsonBuilder(message));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private String jsonBuilder(String message){
        Message messageObject = new Message(message);
        String json = new Gson().toJson(messageObject);
        return json;
    }


}
