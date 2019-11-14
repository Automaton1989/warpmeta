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
<script src="http://js.nicedit.com/nicEdit-latest.js"></script>

<script>

	bkLib.onDomLoaded(function() {
		new nicEditor().panelInstance('NicEdit');
	});

</script>

</head>
<body>
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
	        <a class="nav-link" target="_blank" href="https://streamlabs.com/warpmetagg/v2/merch?sl=172&t=46">Store</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/blog">Blog</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/about">About</a>
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
	<div class="container-fluid" id="createVideo">
	    <div class="row">
		    <div class="offset-2 col-8">
		        <form:form id="createVideoForm" modelAttribute='video' action="new-video" method="post">
		            <fieldset>
		                <legend>Add a video</legend>
		                <div class="form-group">
		                    <label for="title">Video Title: </label>
		                    <form:input path="title" class="form-control" />
		                    <form:errors path="title"/>
		                </div>
		               	<div class="form-group">
		                    <label for="description">Video description: </label>
		                    <form:input type="text" path="description" class="form-control" />
		                </div>
		               	<div class="form-group">
		                    <label for="imageURL">Video Header: </label>
		                    <form:input type="text" path="imageURL" class="form-control"/>
		                </div>
		                <div class="form-group">
		                	<label for="videoURL">Video URL</label>
		                	<form:input type="text" path="videoURL" class="form-control"/>
		                </div>
		                <div class="form-group">
		                	<label for="creator">Video creator</label>
		                	<form:input type="text" path="creator" class="form-control"/>
		                </div>
		                <div class="form-group">
		                	<label for="editor">Video Editor</label>
		                	<form:input type="text" path="editor" class="form-control"/>
		                </div>
		                <div>	                    
		                <button type="reset" tabindex="4" class="btn">Reset</button>
		                <button type="submit" tabindex="5" class="btn">Create Video!</button>
		                </div>
		            </fieldset>
		        </form:form>
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
			    <a class="nav-link" target="_blank" href="https://streamlabs.com/warpmetagg/v2/merch?sl=172&t=46">Store</a>
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
				<a href="https://twitter.com/warpmetagg"><img src="/img/twitter.png"></a>
			</div>
			<div align="center" class="col">
				<a href="https://www.twitch.tv/warpmetagg"><img src="/img/twitch.png"></a>
			</div>
			<div align="center" class="col">
				<a href="https://discord.gg/kJt7WbF"><img style="width: 33px; height: 33px; margin-top: 2px;" src="/img/discord.png"></a>
			</div>
		</div>
	</div>
	<div class="row">
		<div align="center" class="col">
			<p class='text-muted'>Copyright &#9400; 2019</p>
		</div>
	</div>
</footer>
</body>
</html>