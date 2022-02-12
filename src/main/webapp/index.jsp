
<!DOCTYPE html>

<html>

	<head>
	    <title> KapGames | Login</title>
	    <link rel="shortcut icon" type="image/x-icon" href="./icons/iconn.png"/>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <link href="./css/loginstyle.css" rel="stylesheet" type="text/css"/>
	    <link rel="shortcut icon" type="image/x-icon" href="./icons/icon.ico" />
	
	    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
	    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg="nest"></script>
	
	    <script src="./js/loginstyle.js" type="text/javascript"></script>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</head>


<body>

     <%
    	String err="";
     try{
     	if(request!=null){
          	err = request.getAttribute("error").toString();
     	}
     }
     catch(Exception e){
     	System.out.println(e);
     }
     %>
    <div class="con-auth-img">
        <img src="./image/index.jpg" />
    </div>
    <div class="authblock">
        <div class="con-login" id="login-block">

            <div class="headerauth">
                <h1>Login</h1>
                <a href="https://www.kapturecrm.com/" target="_blank">KapGames</a>
            </div>
            <form action="userlogin" method="post">
                <div class="row">
                    <label for="loginmail">User Name</label>
                    <input type="text" name="loginmail" id="l_name" autocomplete="on" placeholder="Username" required>
                </div>
                <div class="row">
                    <label for="l_password">Password</label>
                    <input type="password" name="l_password" id="l_password" placeholder="Password" required>
                    <a class="frgt" id="forgotpass" href="reset_password">Forgot/Update Password?</a>
                </div>
                <button type="submit">Login</button>
                <div class="row">
                    <a class="frgt" id="hidelogin" onclick="hidelogin()">Create Account/Sign Up</a>
                </div>
            </form>
        </div>


        <div class="con-login" id="signup-block">
            <div class="headerauth">
                <h1>SignUp</h1>
                <a href="https://www.ockypocky.com/" target="_blank">OckyPocky</a>
            </div>
            <form action="signup" method="post">
                <div class="row">
                    <label for="name">User Name</label>
                    <input type="text" name="name" id="name" autocomplete="on" id="s_name" placeholder="FirstName_ LastName" required>
                </div>
                <div class="row">
                    <label for="password">Create Password</label>
                    <input type="password" name="crpassword" id="s_crpassword" placeholder="Create Password" required>
                </div>
                <div class="row">
                    <label for="password">Confirm Password</label>
                    <input type="password" name="cnpassword" id="s_cnpassword" placeholder="Confirm Password" required>
                </div>
                <button type="submit">Create Account</button>
                <div class="row">
                    <a class="frgt" id="showlogin" onclick="showlogin()">Already have an account</a>
                </div>
                
            </form>
       </div>
        
   		<span><%=err %></span>

    </div>
</body>

</html>