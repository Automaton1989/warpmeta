package com.matthew.warpmeta.services;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.matthew.warpmeta.models.Blog;
import com.matthew.warpmeta.models.Post;
import com.matthew.warpmeta.models.Role;
import com.matthew.warpmeta.models.User;
import com.matthew.warpmeta.repositories.BlogRepository;
import com.matthew.warpmeta.repositories.PostRepository;
import com.matthew.warpmeta.repositories.RoleRepository;
import com.matthew.warpmeta.repositories.UserRepository;

@Service
public class WarpmetaService {
    private final UserRepository userRepo;
    private final RoleRepository roleRepo;
    private final PostRepository postRepo;
    private final BlogRepository blogRepo;
    
    public WarpmetaService(UserRepository userRepo, RoleRepository roleRepo, PostRepository postRepo, BlogRepository blogRepo) {
        this.userRepo = userRepo;
        this.roleRepo = roleRepo;
        this.postRepo = postRepo;
        this.blogRepo = blogRepo;
    }
    
    public void addRole(Role role, User user) {
    	user.setRole(role);
    	userRepo.save(user);
    }
    
    public void removeRole(Role role, User user) {
    	user.getUser_roles().remove(role);
    	userRepo.save(user);
    }
    
    public List<Role> findAllRoles(){
    	return roleRepo.findAll();
    }
    
    // register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }
    
    // find user by email
    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = userRepo.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    public Role findRoleById(Long id) {
    	Optional<Role> r = roleRepo.findById(id);
    	if(r.isPresent()) {
    		return r.get();
    	} else {
    		return null;
    	}
    }
    
    public Role findRoleByName(String name) {
    	return roleRepo.findByRoleIs(name);
    }
    
    public Blog findBlogByTitle(String title) {
    	return blogRepo.findByTitleIs(title);
    }
    
    public Post findPostByTitle(String title) {
    	return postRepo.findByTitleIs(title);
    }
    
    public List<Post> reversePosts(String title) {
    	Blog blog = blogRepo.findByTitleIs(title);
    	List<Post> posts = blog.getPosts();
    	Collections.reverse(posts);
    	return posts;
    }
    
	public void deletePost(String title) {
		// TODO Auto-generated method stub
		Post post = postRepo.findByTitleIs(title);
		postRepo.delete(post);
	}
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepo.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

	public List<User> findAll() {
		return userRepo.findAll();
	}
	
	public Post publishPost(Post post) {
		post.setPublishedOfPost(post);
		return postRepo.save(post);
	}
	
	public Post unpublishPost(Post post) {
		post.setDraftOfPost(post);
		return postRepo.save(post);
	}

	public Post createPost(Post post) {
		return postRepo.save(post);
	}
	
	public Post updatePost(Long id, String title, String description, String content) {
		Optional<Post> updatePost = postRepo.findById(id);
		if(updatePost.isPresent()) {
			Post post = updatePost.get();
			post.setTitle(title);
			post.setDescription(description);
			post.setContent(content);
			return postRepo.save(post);
		}
		else {
			return null;
		}
	}
	
	public List<Post> findLastPost() {
		return postRepo.findTop5ByOrderByIdDesc();
	}
	
	public Blog findBlogById(Long blogId) {
    	Optional<Blog> b = blogRepo.findById(blogId);
    	
    	if(b.isPresent()) {
            return b.get();
    	} else {
    	    return null;
    	}
	}
	
}
