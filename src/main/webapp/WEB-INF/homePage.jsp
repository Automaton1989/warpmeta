<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="description" content="WarpMeta Gaming news, teams, content, & more!">
  <meta name="keywords" content="gaming, eSports, teams, The Elder Scrolls: Legends, Rainbow Six Siege, Blog, WarpMeta, tournaments">
  <meta name="author" content="Automaton">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WarpMeta Gaming | Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="fade-in">
	<nav class="navbar navbar-expand-lg navbar-dark">
	  <a class="navbar-brand" href="/">
	  	<img src="/img/Logo Long White.png" width="150" height="30" alt="WarpMeta Logo">
	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Full Auto
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="/fullauto">Team home</a>
	          <a class="dropdown-item" href="/fullauto/tesl">TESL</a>
	          <a class="dropdown-item" href="/fullauto/r6">R6 Siege</a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/blog">Blog</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/about">About</a>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-link" target="_blank" href="https://www.patreon.com/warpmeta">Patreon</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" target="_blank" href="https://streamlabs.com/warpmetagg/v2/merch?sl=172&t=46">Store</a>
	      </li>
		<c:if test="${user.id != null}">
	      <li class="nav-item">
	        <a class="nav-link" href="/logout">logout</a>
	      </li>
	     </c:if>
	    </ul>
		<c:if test="${user.id != null}">
		<span class="navbar-text text-light">
	      | Welcome <c:out value="${user.userName}"/>! | 
	    </span>
	    </c:if>
		<c:if test="${user.user_roles.contains(admin)}">
	    <span class="navbar-text text-light">
	    	<a href="/dashboard">Dashboard</a>
	    </span>
	    </c:if>
	    <c:if test="${user.user_roles.contains(author)}">
	    <span class="navbar-text text-light">
	    	| <a href="/create-post">Create Post</a>
	    </span>
	    </c:if>
	  </div>
	</nav>
	<div class="container-fluid">
	<div class="row">
			<div align="center" id="homeMain">
				<div class="d-none d-lg-block" id = "homeText">
					<h3>WarpMeta</h3>
					<p>WarpMeta is moving its gaming teams to Full Auto</p>
					<a href="/fullauto"><button class="btn">View Full Auto</button></a>
				</div>
				<div class="d-block d-sm-block d-md-block d-lg-none" id = "homeSmallText">
					<h3>WarpMeta</h3>
					<p>WarpMeta is moving its gaming teams to Full Auto</p>
					<a href="/fullauto"><button class="btn">View Full Auto</button></a>
				</div>
			</div>
	</div>
	<div class="row">
		<div id="homeTeams">
			<div class="d-none d-sm-none d-md-none d-lg-block offset-1 col-6">
				<h3 id="teamHeader">Teams</h3>
			</div>
			<div align="center" class="d-block d-sm-block d-md-block d-lg-none offset-3 col-6">
				<h3 id="teamHeader">Teams</h3>
			</div>
			<div class="row">
				<div align="center" class="col-xl-4 col-lg-6 col-med-10 col-sm-12 col-12">
					<div class="card">
					<a href="/fullauto/r6">
					<div class="container">
					  <img src="/img/R6Team.jpg" class="card-img-top" alt="R6 Team">
					  <div class="overlay">Rainbow Six Siege</div>
					</div>
					</a>
					</div>
				</div>
				<div align="center" class="col-xl-4 col-lg-6 col-med-10 col-sm-12 col-12">
					<div class="card">
					<a href="/fullauto/tesl">
					<div class="container">
					  <img src="/img/TESLTeam.jpg" class="card-img-top" alt="TESL Team">
					  <div class="overlay">The Elder Scrolls: Legends</div>
					</div>
					</a>
					</div>
				</div>
				<div align="center" class="col-xl-4 col-lg-6 col-med-10 col-sm-12 col-12">
					<div class="card">
					<a href="#">
					  <img style="opacity: 0.5;" src="https://www.agentdk.com/wp-content/uploads/2018/06/comingsoon.png" class="card-img-top" alt="Blank Team">
					</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="homeTournaments">
			<div class="d-none d-sm-none d-md-none d-lg-block offset-1 col-6">
				<h3 id="tournamentHeader">Upcoming Tournaments</h3>
			</div>
			<div align="center" class="d-block d-sm-block d-md-block d-lg-none offset-3 col-6">
				<h3 id="tournamentHeader">Upcoming Tournaments</h3>
			</div>
			<div class="row">
				<div align="center" class="col-xl-4 col-lg-6 col-med-10 col-sm-12 col-12">
					<a target="_blank" href="https://battlefy.com/warpmeta/warp-meta-september-qualifier-3/5d657214f455104094438630/info?infoTab=details">
					<div class="card">
					  <img style="height: 220px;" src="/img/TESLTeam.jpg" class="card-img-top" alt="TESL Tournament">
					    <div class="card-body">
						  <p class="card-text">WarpMeta September Qualifier 4</p>
						  <hr class="my-4">
						  <p class="card-text">Sep 22nd 2019, 9:00AM PDT</p>
						</div>
					</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<footer>
	<div class="row">
		<div align="center" class="col">
			<ul class="nav justify-content-center">
			  <li class="nav-item">
			    <a class="nav-link" href="/">Home</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/fullauto">Full Auto</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/blog">Blog</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/about">About</a>
			  </li>
			</ul>
		</div>
	</div>
	<div class="d-flex justify-content-center row">
		<div class="row">
			<div align="center" class="col">
				<a href="https://twitter.com/warpmetagg" target = "_blank"><img src="/img/twitter.png"></a>
			</div>
			<div align="center" class="col">
				<a href="https://www.twitch.tv/ianbits" target = "_blank"><img src="/img/twitch.png"></a>
			</div>
			<div align="center" class="col">
				<a href="https://discord.gg/kJt7WbF"><img style="width: 33px; height: 33px; margin-top: 2px;" src="/img/discord.png"></a>
			</div>
			<div align="center" class="col">
				<a href="https://www.patreon.com/warpmeta" target = "_blank"><img style="width: 30px; height: 30px; border-radius: 20px; margin-top: 3px;" src="/img/patreon.jpg"></a>
			</div>
			<div align="center" class="col">
				<a href="https://streamlabs.com/warpmetagg/v2/merch?sl=172&t=46" target = "_blank"><img style="width: 30px; height: 30px; margin-top: 2px;" src="/img/streamlabs.png"></a>
			</div>
		</div>
	</div>
	<div class="row">
		<div align="center" class="col">
			<p class='text-muted'>Copyright &#9400; 2019</p>
		</div>
	</div>
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript">
    window.doorbellOptions = {
        "id": "10602",
        "appKey": "b8WgceQ09IVYbJqRMGzzWx9JYGgVysF7XDvimubQf158Rizxq9Bg0FXj07Kz81DV"
    };
    (function(w, d, t) {
        var hasLoaded = false;
        function l() { if (hasLoaded) { return; } hasLoaded = true; window.doorbellOptions.windowLoaded = true; var g = d.createElement(t);g.id = 'doorbellScript';g.type = 'text/javascript';g.async = true;g.src = 'https://embed.doorbell.io/button/'+window.doorbellOptions['id']+'?t='+(new Date().getTime());(d.getElementsByTagName('head')[0]||d.getElementsByTagName('body')[0]).appendChild(g); }
        if (w.attachEvent) { w.attachEvent('onload', l); } else if (w.addEventListener) { w.addEventListener('load', l, false); } else { l(); }
        if (d.readyState == 'complete') { l(); }
    }(window, document, 'script'));
</script>
</body>
</html>