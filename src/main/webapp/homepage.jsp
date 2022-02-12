<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kapture.model.GameInfo" %>
<%@ page import="java.util.Iterator" %>
<%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<html>

	<head>
	    <title> KapGames | Home</title>
	    <link rel="shortcut icon" type="image/x-icon" href="./icons/iconn.png"/>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <link href="./css/homepage.css" rel="stylesheet" type="text/css"/>
	    <link rel="shortcut icon" type="image/x-icon" href="./icons/icon.ico" />
	
	    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
	    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg="nest"></script>
	
	    <script src="./js/daynight.js" type="text/javascript"></script>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script type="text/javascript">
			
			setTimeout(()=>{
				document.getElementById("message").style.opacity="0";
			}, 5000);

			setTimeout(()=>{
				document.getElementById("message").style.display="none";
			}, 6000);
			
		</script>
	</head>



<body class="dark">

     <% 
    	String name="";
	     try{
	     	if(request!=null){
	     		name = request.getAttribute("name").toString();
	     	}
	     }
	     catch(Exception e){
	     	System.out.println(e);
	     }
     %>
     
    <div class="contains">
    
    
     <%
    	String msg="";
	     try{
	     	if(request!=null){
	          	msg = request.getAttribute("message").toString();
	     	}
	     }
	     catch(Exception e){
	     	System.out.println(e);
	     }
	     %>
        <div class="styles-changer" id="shiti" onclick="changetheme()">
            <div class="day-night-toggle" id="daynighttoggle" style="background:url(./icons/themeico.png);">
            </div>
        </div>

        <form action="logout" method="post">
            <input type="submit" name="Logout" value="Logout" />
        </form>
        <div class="con-header">
            <div class="wlcm">
                <h1>Welcome to KapGames</h1>
                <h2><%=name %></h2>
            </div>
   		<span id="message" style="color:greenyellow;"><%=msg %></span>
        </div>

        <div class="main-container">
        
        <% 
    	List<GameInfo> res=null;
        	try{
		 		res = (List<GameInfo>) request.getAttribute("gamesinfo"); 
	        	}
	        catch(Exception e ){
	        	System.out.println("Hopeage error is : "+e.toString());
	        }
        	Iterator<GameInfo> games = res.iterator();
        	int i=0;
        		for(i=0;i<res.size();i++){
        		%>
        		 <div class="game-card">
                <div class="imgplaceholder">
                    Loading....
                </div>
                <div class="game-card-image">
                    <img src="<%=res.get(i).getLink() %>" />
                </div>
                <div class="game-card-info">

                    <div class="game-card-name">
                        <strong><%=res.get(i).getName() %></strong>
                    </div>
                    <div class="game-card-desc">
                        <%=res.get(i).getDesc() %>
                    </div>
                </div>
                <div class="play" id="{{m.machine_id   }}" onclick="customerContactToggle(this.id)">
                    Play
                </div>
            </div>
            <%
        	}
        %>
  
  		
  
         

        </div>

        <div class="footer">
            <a href="https://www.kapturecrm.com/" target="_blank">Visit Parent Company</a>
        </div>
    </div>

</body>

</html>