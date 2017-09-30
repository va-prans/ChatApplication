/**
 * Created by CIA on 26/09/2017.
 */

import DatabaseWrapper.DatabaseConnection;
import com.google.gson.Gson;


import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;

@ServerEndpoint("/Chat")
public class ChatServer {

    private static DatabaseConnection databaseConnection = new DatabaseConnection();
    static Set<Session> unauthorizedUsers = Collections.synchronizedSet(new HashSet<Session>());
    static Set<Session> authorizedUsers = Collections.synchronizedSet(new HashSet<Session>());

//    private static Thread initThread; //background thread
//    static
//    {
//        initThread= new Thread(() -> {
//        });
//        initThread.start();
//    }

    @OnOpen
    public void onOpen(Session userSession){
        System.out.println("New session(unauthorized): " + userSession.getId());
        unauthorizedUsers.add(userSession);
    }

    @OnMessage
    public void handleMessage(String message, Session userSession){
        //if user is authorized
        if (authorizedUsers.contains(userSession)){
            //send messages to all authorized users
            for (Session authorizedUser : authorizedUsers) {
                try {
                    authorizedUser.getBasicRemote().sendText(jsonBuilder(
                            (String) userSession.getUserProperties().get("username"),
                            message));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else { //if user is unauthorized
            //determine client commande
            String currentUserDetails[] = message.split("/");
            //if create account
            if (currentUserDetails[2].equals("create")){
                databaseConnection.createUserAccount(currentUserDetails[0], currentUserDetails[1]);
            }
            else if (currentUserDetails[2].equals("login")){
                if(databaseConnection.passwordCorrect(currentUserDetails[0], currentUserDetails[1])){ //proceed to authorization

                    //succesful authentication
                    //link user session with username
                    userSession.getUserProperties().put("username", currentUserDetails[0]);
                    //remove user session from unauthorized and add to authorized
                    unauthorizedUsers.remove(userSession);
                    authorizedUsers.add(userSession);
                    System.out.println("Authorized Session : " + userSession.getId());
                    try {
                        userSession.getBasicRemote().sendText(jsonBuilder("System", "you are now connected as " + currentUserDetails[0]));
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
            System.out.println("Closed session(authorized): " + userSession.getId());
            authorizedUsers.remove(userSession);
        }
        else if (unauthorizedUsers.contains(userSession)) {
            System.out.println("Closed session(unauthorized): " + userSession.getId());
            authorizedUsers.remove(userSession);
        }
    }
    private String jsonBuilder(String userPass, String message){
        Message messageObject = new Message(userPass + ": " + message);
        String json = new Gson().toJson(messageObject);
        return json;
    }




}
