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
<title>WarpMeta Gaming | ${post.title}</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/style.css">
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
	<div class="container-fluid" id="post">
		<div class="row d-none d-sm-none d-md-block">
			<div align="center" id="postMain">
			<img src="/image/${post.fileName}">
			</div>
		</div>
		<div class="row">
			<div align="center" id="postTitle">
				<div class="col">
					<h3>${post.title}</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div id="postContent">
				<div class="offset-1 col-10">
					<div class="row">
						<div class="col">
							<p>${post.content}</p>
							<p>Author: ${post.creator.userName}</p>
							<p>Posted: ${post.createdAt}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr my-4>
		<div id="shareLinks" align="center" class="row">
			<div class="col">
				<p style="color: black;">Share this post!</p>
				<div style="margin-bottom: 10px;" class="col">
					<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-size="large" data-text="I just read this blog post! " data-via="@warpmetagg" data-hashtags="#WarpMeta" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>			
				</div>
				<div class="col">
					<!-- The text field -->
					<input type="text" value="www.warpmeta.com/blog/${post.title}" id="myInput" readonly>
					
					<!-- The button used to copy the text -->
					<button class="btn" id="copyText" onclick="myFunction()">Copy Link</button>
				</div>
			</div>
		</div>
		<c:if test="${user.user_roles.contains(admin) || user.user_roles.contains(author)}">
		<hr my-4>
		<div class="row">
			<div class="col">
				<h3>For Authors and Admins Only</h3>
			</div>
		</div>
		<div class="row post-buttons-row">
			<div class="col">
				<button class="btn delete-button" onclick="confirmDeletion()">Delete Post</button>
				<button class="btn publish-save-button" onclick="confirmPublish()">Publish Post</button>
				<a href="/blog/${post.title}/edit"><button class="btn publish-save-button">Edit Post</button></a>
			</div>
		</div>
		</c:if>
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
</body>
<script>
	function myFunction() {
	  /* Get the text field */
	  var copyText = document.getElementById("myInput");
	  /* Select the text field */
	  copyText.select();
	
	  /* Copy the text inside the text field */
	  document.execCommand("copy");
	
	  /* Alert the copied text */
	  alert("Copied the text: " + copyText.value);
	}
</script>
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

	function confirmDeletion() {
		var d = confirm("Are you sure you want to delete this post?");
		if (d == true) {
			window.location.href = "/blog/${post.title}/delete";
		}
	}

	function confirmPublish() {
	var p = confirm("Are you sure you want to publish this post?");
		if(p == true) {
			window.location.href = "/blog/${post.title}/publish";
		}
	}
</script>
</html>