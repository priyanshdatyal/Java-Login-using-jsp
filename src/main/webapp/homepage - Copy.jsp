<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.sql.ResultSet" %>
        <%@ page import="java.util.List"; %>
            <!DOCTYPE html>
            <html>

            <head>
                <title> KapGames | Home</title>
                <link rel="shortcut icon" type="image/x-icon" href="./icons/iconn.png" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link href="./css/homepage.css" rel="stylesheet" type="text/css" />
                <link rel="shortcut icon" type="image/x-icon" href="./icons/icon.ico" />

                <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
                <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg="nest"></script>

                <script src="./js/daynight.js" type="text/javascript"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

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
                                <h2>
                                    <%=name %>
                                </h2>
                            </div>
                        </div>

                        <div class="main-container">

                            <% List res = (List) request.getAttribute("gamesinfo"); 
        	ResultSet rs = (ResultSet) request.getAttribute("gamesinfo"); 
        	
        	while(rs.next()){
        		out.println("")
        	}
        %>



                                <c:forEach var="game" items="${gamesinfo}">
                                    <div class="game-card">
                                        <div class="imgplaceholder">
                                            Loading....
                                        </div>
                                        <div class="game-card-image">
                                            <img src="<c:out value=" ${game.link} " />" />
                                        </div>
                                        <div class="game-card-info">

                                            <div class="game-card-name">
                                                <strong><c:out value="${game.name}" /></strong>
                                            </div>
                                            <div class="game-card-desc">
                                                <c:out value="${game.desc}" />
                                            </div>
                                        </div>
                                        <div class="play" id="{{m.machine_id   }}" onclick="customerContactToggle(this.id)">
                                            Play
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="game-card">
                                    <div class="imgplaceholder">
                                        Loading....
                                    </div>
                                    <div class="game-card-image">
                                        <img src="https://apprecs.org/ios/images/app-icons/256/13/1039627283.jpg" />
                                    </div>
                                    <div class="game-card-info">

                                        <div class="game-card-name">
                                            <strong>Sudoku</strong>
                                        </div>
                                        <div class="game-card-desc">
                                            This is a logic based game
                                        </div>
                                    </div>
                                    <div class="play" id="{{m.machine_id   }}" onclick="customerContactToggle(this.id)">
                                        Play
                                    </div>
                                </div>

                        </div>

                        <div class="footer">
                            <a href="https://www.kapturecrm.com/" target="_blank">Visit Parent Company</a>
                        </div>
                    </div>

            </body>

            </html>