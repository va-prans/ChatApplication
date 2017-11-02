<%--
  Created by IntelliJ IDEA.
  User: CIA
  Date: 26/09/2017
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>

        #wrapperDiv {
            color: brown;
        }

    </style>
    <script>
        window.onload = function () {


        };
        var received = false;
        var websocket = new WebSocket("ws://192.168.0.102:8080/Chat");
        websocket.onmessage = function processMessage(message) {
            var jsonData = JSON.parse(message.data);

            if (jsonData.message != null) {
                if (!received){
                    document.getElementById("wrapperDiv").innerHTML = "<div id='loggedInDiv'><textarea id='messageTextArea' readOnly='readonly' rows='10' cols='45'></textarea><br/><input type='text' id='messageText' size='50'/><input type='button' value='Send' onClick='sendMessage();'/> </div>";
                    received = true;
                }
                document.getElementById("messageTextArea").value += jsonData.message + "\n";
            }
        };

        function sendMessage() {
            websocket.send(messageText.value);
            messageText.value = "";
        }

        function sendLogin() {
            websocket.send(usernameField.value + "/" + passwordField.value + "/login");
            usernameField.value = "";
            passwordField.value = "";
        }

        function createAccount() {
            websocket.send(usernameCreateField.value + "/" + passwordCreateField.value + "/create");
            usernameCreateField.value = "";
            passwordCreateField.value = "";
        }
    </script>
</head>
<body>
<div id="wrapperDiv">
    <div id="loginDiv">Login<br/>
        Username: <input type="text" id="usernameField" size="50"/><br/>
        Password: <input type="password" id="passwordField" size="50"/><br/>
        <input type="button" value="Log in" onClick="sendLogin();"/>
    </div><br/>
    <div id="createAccountDiv">Create Account<br/>
        Username: <input type="text" id="usernameCreateField" size="50"/><br/>
        Password: <input type="password" id="passwordCreateField" size="50"/><br/>
        <input type="button" value="Create" onClick="createAccount();"/>
    </div><br/>
</div>

</body>

</html>
