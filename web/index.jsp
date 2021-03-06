
<html>
<head>
    <title>Chat Application DAT16i</title>
    <style>

        body {
            background-image: url("https://wallpaperscraft.com/image/sky_trees_night_87718_1920x1080.jpg");
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        #wrapperDiv {
            width: 100%;
            height: 100%;

            display: -webkit-box;   /* OLD: Safari,  iOS, Android browser, older WebKit browsers.  */
            display: -moz-box;      /* OLD: Firefox (buggy) */
            display: -ms-flexbox;   /* MID: IE 10 */
            display: -webkit-flex;  /* NEW, Chrome 21–28, Safari 6.1+ */
            display: flex;           /* NEW: IE11, Chrome 29+, Opera 12.1+, Firefox 22+ */
            flex-direction: column;

            -webkit-box-align: center; -moz-box-align: center; /* OLD… */
            -ms-flex-align: center; /* You know the drill now… */
            -webkit-align-items: center;
            align-items: center;

            -webkit-box-pack: center; -moz-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;




        }

        #loginDiv {
            min-width: 25%;
            height: auto;
            text-align: center;
            /*border-style: solid;
            border-color: 2px blue;*/
            display: -webkit-box;   /* OLD: Safari,  iOS, Android browser, older WebKit browsers.  */
            display: -moz-box;      /* OLD: Firefox (buggy) */
            display: -ms-flexbox;   /* MID: IE 10 */
            display: -webkit-flex;  /* NEW, Chrome 21–28, Safari 6.1+ */
            display: flex;           /* NEW: IE11, Chrome 29+, Opera 12.1+, Firefox 22+ */
            flex-direction: column;

            -webkit-box-align: center; -moz-box-align: center; /* OLD… */
            -ms-flex-align: center; /* You know the drill now… */
            -webkit-align-items: center;
            align-items: center;

            -webkit-box-pack: center; -moz-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;




        }

        #circleDiv {
            text-align: center;
            display: -webkit-box;   /* OLD: Safari,  iOS, Android browser, older WebKit browsers.  */
            display: -moz-box;      /* OLD: Firefox (buggy) */
            display: -ms-flexbox;   /* MID: IE 10 */
            display: -webkit-flex;  /* NEW, Chrome 21–28, Safari 6.1+ */
            display: flex;           /* NEW: IE11, Chrome 29+, Opera 12.1+, Firefox 22+ */
            flex-direction: column;

            -webkit-box-align: center; -moz-box-align: center; /* OLD… */
            -ms-flex-align: center; /* You know the drill now… */
            -webkit-align-items: center;
            align-items: center;

            -webkit-box-pack: center; -moz-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            width: 100%;
            padding-bottom: 25%;
            border: 2px solid green;
            border-radius: 50%;
            background-image: url("https://wallpaperscraft.com/image/sky_stars_background_bright_abstract_88095_1920x1200.jpg");
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        #buttonLogIn {
            background: #3498db;
            background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
            background-image: -moz-linear-gradient(top, #3498db, #2980b9);
            background-image: -ms-linear-gradient(top, #3498db, #2980b9);
            background-image: -o-linear-gradient(top, #3498db, #2980b9);
            background-image: linear-gradient(to bottom, #3498db, #2980b9);
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0px;
            -webkit-box-shadow: 0px 0px 30px #666666;
            -moz-box-shadow: 0px 0px 30px #666666;
            box-shadow: 0px 0px 30px #666666;
            font-family: Courier New;
            color: #ffffff;
            font-size: 0.7em;
            padding: 21px;
            border: solid #1f628d 2px;
            text-decoration: none;
            position: static;
        }

        #buttonLogIn:hover {
            background: #3cb0fd;
            background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
            background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
            background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
            background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
            background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
            text-decoration: none;
        }

        #buttonCreate {
            background: #3498db;
            background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
            background-image: -moz-linear-gradient(top, #3498db, #2980b9);
            background-image: -ms-linear-gradient(top, #3498db, #2980b9);
            background-image: -o-linear-gradient(top, #3498db, #2980b9);
            background-image: linear-gradient(to bottom, #3498db, #2980b9);
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0px;
            -webkit-box-shadow: 0px 0px 30px #666666;
            -moz-box-shadow: 0px 0px 30px #666666;
            box-shadow: 0px 0px 30px #666666;
            font-family: Courier New;
            color: #ffffff;
            font-size: 0.7em;
            padding: 21px;
            border: solid #1f628d 2px;
            text-decoration: none;
            position: static;
        }

        #buttonCreate:hover {
            background: #3cb0fd;
            background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
            background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
            background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
            background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
            background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
            text-decoration: none;
        }
        #nameLabel {

            position: relative;
            transform: translate(0, -250%);
            color: rgba(255, 255, 255, 0.5);
            font: 400 25.66667px Helvetica;
            cursor: text;
            transition: .25s ease;
        }

        #passwordLabel {

            position: relative;
            transform: translate(0, -140%);
            color: rgba(255, 255, 255, 0.5);
            font: 400 25.66667px Helvetica;
            cursor: text;
            transition: .25s ease;
        }

        .inputFields {
            text-align: center;
            margin-bottom: 5%;
            max-width: 250px;
            border: none;
            border-radius: 0;
            color: white;
            background: #333;
            font-size: 36.66667px;
            transition: .3s ease;
            transform: translate(0, 100%);
        }
        .inputFields:valid ~ #nameLabel {
            font: 700 22px Helvetica;
            color: rgba(255, 255, 255, 0.0);

        }

        .inputFields:valid ~ #passwordLabel {
            font: 700 22px Helvetica;
            color: rgba(255, 255, 255, 0.0);

        }
        .inputFields:focus {
            outline: none;
        }
        .inputFields:focus ~ #nameLabel {
            transform: translate(0, -425%);

            font: 700 22px Helvetica;
            color: black;
        }
        .inputFields:focus ~ #passwordLabel {
            transform: translate(0, 2%);

            font: 700 22px Helvetica;
            color: black;
        }

        .inputFields:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px #333 inset;
            -webkit-text-fill-color: white !important;
        }



        ::selection {
            background: rgba(33, 150, 243, 0.3);
        }

        #username {

        }

        #password {

        }

        #messageTextArea {
            font-family: "Myriad Pro";
            font-size: 1em;
            color: aliceblue;
            width: 100%;
            height: 60%;
            border-color: #1f628d;
            background-color: rgba(0, 24, 71, 0.35);
        }

        #messageTextArea::first-line {
            font-style: italic;
            text-align: center;
        }

        #userListWrapper {
            font-family: "Myriad Pro";
            font-size: 0.9em;
            color: aliceblue;
            position: absolute;
            top: 19.5%;
            right: 10%;
            width: 15%;
            height: 61%;
            border: 1px solid #1f628d;
            background-color: rgba(0, 24, 71, 0.35);
        }

        #userListTitle {
            text-align: center;
        }


    </style>
</head>
<body>
<div id="wrapperDiv">
    <div id="loginDiv">
        <div id="circleDiv">
            <br>
            <br>
            <br>
            <input type="text" autofocus id="username" class="inputFields" required="required" />
            <input type="password" id="password" class="inputFields" required="required" />
            <label for="username" id="nameLabel">Username</label>
            <label for="password" id="passwordLabel">Password</label>
            <div id="buttonsDiv">
                <input type="button" id="buttonLogIn" value="Log in" onClick="sendLogin();"/>
                <input type="button" id="buttonCreate" value="Create" onClick="createAccount();"/>
            </div>
        </div>
    </div>
    <div id='loggedInDiv'>
        <div>
        <textarea id='messageTextArea' readOnly='readonly' rows='10' cols='45'></textarea>
            <br/>
            <input type='text' autofocus id='messageText' size='100'/>
            <input type='button' value='Send' onClick='sendMessage();'/>
        </div>
    </div>
    <div id="userListWrapper">
        <p id="userListTitle"><strong>Users</strong></p>
        <div id="usersDiv">
        </div>
    </div>
</div>

</body>
<script>
    window.onload = function () {
        chatArea.style.display = 'none';
        userListWrapper.style.display = 'none';
        usernameField.focus();
    };
    var loggedIn = false;
    var hasCreatedAccount = false;
    var socketUrl = window.location.href.substring(4);
    var socketString = "ws" + socketUrl + "Chat";
    var websocket = new WebSocket(socketString);
    var usernameField = document.getElementById("username");
    var passwordField = document.getElementById("password");
    var chatArea = document.getElementById("loggedInDiv");
    var loginArea = document.getElementById("loginDiv");
    var chatMessages = document.getElementById("messageTextArea");
    var messageText = document.getElementById("messageText")
    var userListWrapper = document.getElementById("userListWrapper");
    var usernamesDiv = document.getElementById("usersDiv");

    websocket.onmessage = function processMessage(message) {
        var jsonData = JSON.parse(message.data);
        var newMessage = jsonData.message.toString();

        if (jsonData.message != null) {
            if (!loggedIn){
                loggedIn = true;
                chatArea.style.display = 'block';
                userListWrapper.style.display = 'block';
                loginArea.style.display = 'none';
                messageText.focus();
            }
            if (newMessage.indexOf("_GETUSERLIST_") === 0) {
                var list = newMessage.substring(13);
                var array = list.split(",");
                updateUsernameDiv(array);
            }
            else {
                if (chatMessages.value === "") {
                    chatMessages.value += jsonData.message;
                }
                else {
                    chatMessages.value += "\n" + jsonData.message;
                    chatMessages.scrollTop = chatMessages.scrollHeight;
                }
            }
        }
    };

    messageText.addEventListener("keyup", function(event) {
            event.preventDefault();
            if (event.keyCode === 13) {
                sendMessage();
            }
        });

    passwordField.addEventListener("keyup", function(event) {
        event.preventDefault();
        if (event.keyCode === 13) {
            sendLogin();
        }
    });

    function makeUL(array) {
        var list = document.createElement('ul');

        for(var i = 0; i < array.length; i++) {
            var item = document.createElement('li');
            item.appendChild(document.createTextNode(array[i]));
            list.appendChild(item);
        }
        return list;
    }

    function clearUL() {
        while (usernamesDiv.hasChildNodes()) {
            usernamesDiv.removeChild(usernamesDiv.lastChild);
        }
    }

    function updateUsernameDiv(array) {
        clearUL()
        usernamesDiv.appendChild(makeUL(array));
    }

    function sendMessage() {
        if (messageText.value !== "") {
            websocket.send(messageText.value);
            messageText.value = "";
        }
    }

    function sendLogin() {
        if (usernameField.value !== "" && passwordField.value !== "") {
            websocket.send(usernameField.value + "/" + passwordField.value + "/login");
            usernameField.value = "";
            passwordField.value = "";
        }
    }

    function createAccount() {
        if (usernameField.value !== "" && passwordField.value !== "") {
            if (!hasCreatedAccount) {
                hasCreatedAccount = true;
                var uname = usernameField.value;
                websocket.send(usernameField.value + "/" + passwordField.value + "/create");
                usernameField.value = "";
                passwordField.value = "";

                //show text indicating successful creation of account
                alert("Succesfully created account with username: " + uname);
                usernameField.focus();
            }
            else {
                //show text indicating we already created an account
                alert("Only 1 account can be created per user.")
            }
        }
    }
</script>
</html>
