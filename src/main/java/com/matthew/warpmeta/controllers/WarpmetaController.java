package com.matthew.warpmeta.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.matthew.warpmeta.models.Blog;
import com.matthew.warpmeta.models.Post;
import com.matthew.warpmeta.models.Role;
import com.matthew.warpmeta.models.User;
import com.matthew.warpmeta.services.WarpmetaService;
import com.matthew.warpmeta.validator.UserValidator;

@Controller
public class WarpmetaController {
	private final WarpmetaService warpService;
    private final UserValidator userValidator;
	
	public WarpmetaController(WarpmetaService warpService, UserValidator userValidator) {
		this.warpService = warpService;
		this.userValidator = userValidator;
	}
	
	@RequestMapping("/")
    public String homePage(@ModelAttribute("user") User user, Model model, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "homePage.jsp";
    	}
        Long userId = (Long) session.getAttribute("userId");
        User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        model.addAttribute("author", a);
        model.addAttribute("user", u);
        model.addAttribute("admin", r);
        return "homePage.jsp";
    }
	
	@RequestMapping("/about")
	public String aboutUs(@ModelAttribute("user")User user, Model model, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "aboutUs.jsp";
    	}
        Long userId = (Long) session.getAttribute("userId");
        User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        model.addAttribute("user", u);
        model.addAttribute("admin", r);
        model.addAttribute("author", a);
		return "aboutUs.jsp";
	}
	
	@RequestMapping("/blog")
	public String blogPage(@ModelAttribute("user")User user, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
	        Blog b = warpService.findBlogByTitle("WarpMeta Herald");
	        List<Post> posts = warpService.reversePosts("WarpMeta Herald");
	        model.addAttribute("posts", posts);
	        model.addAttribute("blog", b);
			return "blog.jsp";
		}
        Long userId = (Long) session.getAttribute("userId");
        User u = warpService.findUserById(userId);
        Blog b = warpService.findBlogByTitle("WarpMeta Herald");
        List<Post> posts = warpService.reversePosts("WarpMeta Herald");
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        model.addAttribute("author", a);
        model.addAttribute("user", u);
        model.addAttribute("admin", r);
        model.addAttribute("blog", b);
        model.addAttribute("posts", posts);
        return "blog.jsp";
	}
	
	@RequestMapping("/blog/{title}")
	public String postPage(@ModelAttribute("user")User user, @PathVariable("title") String title,  Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
	        Post p = warpService.findPostByTitle(title);
	        model.addAttribute("post", p);
			return "viewPost.jsp";
		}
        Long userId = (Long) session.getAttribute("userId");
        User u = warpService.findUserById(userId);
        Post p = warpService.findPostByTitle(title);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        model.addAttribute("author", a);
        model.addAttribute("user", u);
        model.addAttribute("admin", r);
        model.addAttribute("post", p);
        return "viewPost.jsp";
	}
	
	@RequestMapping("/fullauto")
	public String fullAutoHome(@ModelAttribute("user")User user, Model model, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "fullautoHome.jsp";
    	}
        Long userId = (Long) session.getAttribute("userId");
        User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        model.addAttribute("author", a);
        model.addAttribute("user", u);
        model.addAttribute("admin", r);
		return "fullautoHome.jsp";
	}
	
	@RequestMapping("/fullauto/r6")
	public String fullAutoR6(@ModelAttribute("user")User user, Model model, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "fullautoR6.jsp";
    	}
        Long userId = (Long) session.getAttribute("userId");
        User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        model.addAttribute("author", a);
        model.addAttribute("user", u);
        model.addAttribute("admin", r);
		return "fullautoR6.jsp";
	}
	
	@RequestMapping("/fullauto/tesl")
	public String fullAutoTESL(@ModelAttribute("user")User user, Model model, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "fullautoTESL.jsp";
    	}
        Long userId = (Long) session.getAttribute("userId");
        User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        model.addAttribute("author", a);
        model.addAttribute("user", u);
        model.addAttribute("admin", r);
		return "fullautoTESL.jsp";
	}
	
	@RequestMapping("/register_login")
	public String registerUser(@ModelAttribute("user")User user) {
		return "login&registration.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String adminDashboard(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
        Long userId = (Long) session.getAttribute("userId");
        User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        if(u.getUser_roles().contains(r)) {
        	System.out.println("Entry Successful");
            List<User> users = warpService.findAll();
            List<Role> roles = warpService.findAllRoles();
            model.addAttribute("user", u);
            model.addAttribute("author", a);
            model.addAttribute("users", users);
            model.addAttribute("roles", roles);
    		return "dashboard.jsp";
        } else {
        	System.out.println("Failed Entry");
    		return "redirect:/";
        }
	}
	
    @RequestMapping(value="/add_role", method=RequestMethod.POST)
    public String addRole(@RequestParam("role") Long roleid, @RequestParam("user") Long userid ) {
    	User user = warpService.findUserById(userid);
    	Role role = warpService.findRoleById(roleid);
    	warpService.addRole(role, user);
    	return "redirect:/";
    }
	
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
    	userValidator.validate(user, result);
    	if(result.hasErrors()) {
        	return "login&registration.jsp";
        }
    	User u = warpService.registerUser(user);
    	session.setAttribute("userId", u.getId());
    	return "redirect:/";
    	// if result has errors, return the registration page (don't worry about validations just now)
        // else, save the user in the database, save the user id in session, and redirect them to the /home route
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@ModelAttribute("user") User user, @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
        boolean isAuthenticated = warpService.authenticateUser(email, password);
        if(isAuthenticated) {
        	User u = warpService.findByEmail(email);
        	session.setAttribute("userId", u.getId());
        	return "redirect:/";
        } else {
        	model.addAttribute("error", "Invalid Credentials, Please try again!");
        	return "login&registration.jsp";
        }
    	// if the user is authenticated, save their user id in session
        // else, add error messages and return the login page
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    @RequestMapping(value = "/new-post", method=RequestMethod.POST)
    public String uploadResources( HttpServletRequest servletRequest,
                                 @ModelAttribute("post") Post post,
                                 Model model, HttpSession session, @RequestParam("blog") Long blogId)
    {
        //Get the uploaded files and store them
        MultipartFile file = post.getImage();
        String fileName = file.getOriginalFilename();
        
        File imageFile = new File(servletRequest.getServletContext().getRealPath("/image"), fileName);
        try {
            file.transferTo(imageFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Blog blog = warpService.findBlogById(blogId);
        post.setFileName(fileName);
        post.setBlog(blog);
        warpService.createPost(post);
        model.addAttribute("post", post);
        return "redirect:/blog";
    }
    
    @RequestMapping("/blog/{title}/edit")
    public String editPost(@PathVariable("title")String title, Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
    	Post post = warpService.findPostByTitle(title);
    	if(post.getCreator().equals(a) | u.getUser_roles().contains(r)) {
    		System.out.println("You are either creator or admin");
            model.addAttribute("user", u);
            model.addAttribute("admin", r);
            model.addAttribute("author", a);
            model.addAttribute("post", post);
        	return "editPost.jsp";
    	}
    	else {
    		System.out.println("You are not creator or admin");
    		return "redirect:/blog";
    	}
    }
     
    @RequestMapping(value="/edit-post/{id}/edit", method=RequestMethod.PUT)
    public String updatePost(@ModelAttribute("post")Post post, Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        if(post.getCreator().equals(a) | u.getUser_roles().contains(r)) {
    		System.out.println("You are either creator or admin");
    		warpService.updatePost(post.getId(), post.getTitle(), post.getDescription(), post.getContent());
        	return "redirect:/blog";
    	} else {
    		return "redirect:/";
    	}
    }
    
    @RequestMapping(value = "/create-post")
    public String createPost(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
        Long userId = (Long) session.getAttribute("userId");
        User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
        Role a = warpService.findRoleByName("Author");
        if(u.getUser_roles().contains(r) | u.getUser_roles().contains(a)) {
        	System.out.println("Create Post Entry Successfull");
            model.addAttribute("post", new Post());
            model.addAttribute("user", u);
            model.addAttribute("admin", r);
            model.addAttribute("author", a);
            return "postForm.jsp";
        } else {
        	System.out.println("Failed Entry");
    		return "redirect:/";
        }
    }
    @RequestMapping("/blog/{title}/draft")
    public String draftPost(@PathVariable("title")String title, Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
    	Post post = warpService.findPostByTitle(title);
    	if(post.getCreator().equals(u) | u.getUser_roles().contains(r)) {
            model.addAttribute("post", post);
            model.addAttribute("user", u);
            model.addAttribute("admin", r);
        	return "postDraft.jsp";
    	}
    	else {
    		System.out.println("You are not creator or admin");
    		return "redirect:/blog";
    	}
    }
    
    @RequestMapping("/blog/{title}/publish")
	public String publishPost(@PathVariable("title")String title, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
    	Post post = warpService.findPostByTitle(title);
    	if(post.getCreator().equals(u) | u.getUser_roles().contains(r)) {
    		System.out.println("You are either creator or admin");
        	warpService.publishPost(post);
        	return "redirect:/blog";
    	}
    	else {
    		System.out.println("You are not creator or admin");
    		return "redirect:/blog";
    	}
    }
    
    @RequestMapping("/blog/{title}/unpublish")
	public String unpublishPost(@PathVariable("title")String title, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
    	Post post = warpService.findPostByTitle(title);
    	if(post.getCreator().equals(u) | u.getUser_roles().contains(r)) {
    		System.out.println("You are either creator or admin");
        	warpService.unpublishPost(post);
        	return "redirect:/blog";
    	}
    	else {
    		System.out.println("You are not creator or admin");
    		return "redirect:/blog";
    	}
    }
    
    @RequestMapping("/blog/{title}/delete")
	public String deletePost(@PathVariable("title")String title, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	User u = warpService.findUserById(userId);
        Role r = warpService.findRoleByName("Admin");
    	Post post = warpService.findPostByTitle(title);
    	if(post.getCreator().equals(u) | u.getUser_roles().contains(r)) {
    		System.out.println("You are either creator or admin");
        	warpService.deletePost(title);
        	return "redirect:/blog";
    	}
    	else {
    		System.out.println("You are not creator or admin");
    		return "redirect:/blog";
    	}
    }
}
