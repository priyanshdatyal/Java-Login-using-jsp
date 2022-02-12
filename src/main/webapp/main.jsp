
<!DOCTYPE html>
<html>

<head>

    <title> KapGames | Login</title>
    <link rel="shortcut icon" type="image/x-icon" href="./icons/iconn.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" type="image/x-icon" href="./icons/iconn.png" >

    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg="nest"></script>

    <script src="./js/theme.js" ></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<style>
	:root {
    --accent-color: 225, 225, 255;
    --sub-color: 0, 0, 0;
}

body.dark {
    --accent-color: 0, 0, 0;
    --sub-color: 225, 225, 255;
}

* {
    margin: 0;
    padding: 0;
    overflow: hidden;
    background: red;
    color:green;
}

.styles-changer {
    display: block;
    width: 2em;
    height: 2em;
    position: fixed;
    bottom: 0;
    right: 0;
    margin: 1em;
    border-radius: 50%;
    z-index: 1000;
    padding: .25em;
    background: white;
    box-shadow: 0px 0px 15px -2px rgba(0, 0, 0, .7);
    /* transform: scale(.5); */
}

.day-night-toggle {
    width: 100%;
    height: 100%;
    margin: 0;
    background: url('/static/res/themeico.png') no-repeat;
    background-position: center;
    background-size: cover;
}

html,
body {
    width: 100%;
    height: 100vh;
}

.container {
    width: 80% !important;
    height: 80%;
    position: absolute;
    padding: 0;
    margin: 0;
    left: 10%;
    border-radius: 25px;
    top: 10%;
    box-shadow: 13px 13px 20px #555555, -13px -13px 20px rgb(255, 0, 0);
    background: rgba(var(--accent-color), 1);
    color: rgba(var(--sub-color), 1);
}

.container h1 {
    width: 100%;
    position: relative;
    display: block;
    text-align: center;
    padding: 0;
    margin: 0em;
    top: 40%;
}

.container a {
    width: 100%;
    position: relative;
    display: block;
    text-align: center;
    padding: 0;
    top: 45%;
    font-size: 1em;
    text-decoration: none;
    color: #ad73e0;
}

@media screen and (min-width:1366px) {
    .styles-changer {
        display: block;
        width: 2em;
        height: 2em;
        position: fixed;
        bottom: 0;
        right: 0;
        margin: 1em;
        border-radius: 50%;
        z-index: 1000;
        padding: .25em;
        background: white;
        box-shadow: 0px 0px 15px -2px rgba(0, 0, 0, .7);
        /* transform: scale(.5); */
    }
    .day-night-toggle {
        width: 100%;
        height: 100%;
        margin: 0;
        background: url('/static/res/themeico.png') no-repeat;
        background-position: center;
        background-size: cover;
    }
    body {
        width: 100%;
        height: 100vh;
    }
    .container {
        width: 70% !important;
        height: 70%;
        position: absolute;
        padding: 0;
        margin: 0;
        left: 15%;
        border-radius: 25px;
        top: 15%;
        box-shadow: 13px 13px 20px #555555, -13px -13px 20px rgb(255, 255, 255);
        background: rgba(var(--accent-color), 1);
        color: rgba(var(--sub-color), 1);
    }
    .container h1 {
        width: 100%;
        position: relative;
        display: block;
        text-align: center;
        padding: 0;
        margin: .125em;
        top: 40%;
    }
    .container a {
        width: 100%;
        position: relative;
        display: block;
        text-align: center;
        padding: 0;
        top: 45%;
        font-size: 1em;
        text-decoration: none;
        color: #ad73e0;
    }
}
	</style>

</head>


<body>


    <div class="styles-changer" id="shiti" onclick="changetheme()">
        <div class="day-night-toggle" id="daynighttoggle">
        </div>
    </div>




    <div class="container">
        <form action="logout" style="display:block; position: absolute; right:0; top:0; margin:1em; background:rgb(194, 95, 95); width:8em; height:2em; border-radius: 10px;">
            <input type="submit" name="Logout" style="display:block; background:rgb(153, 75, 75); width:100%; height:100%; border-radius: 10px; text-align:center; text-decoration:none; 
        font-size:1em; color:white;" value="Logout" />
        </form>

        <h1> Welcome to the homepage!</h1>
        {% if user.is_authenticated %}
        <h1>{{user.first_name}} {{user.last_name}}</h1>
        {% endif %}
        <a href="https://www.kapturecrm.com/" target="_blank">Visit OckyPocky</a>
    </div>

</body>

</html>