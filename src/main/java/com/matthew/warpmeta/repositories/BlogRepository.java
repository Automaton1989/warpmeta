package com.matthew.warpmeta.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.matthew.warpmeta.models.Blog;

@Repository
public interface BlogRepository extends CrudRepository<Blog, Long> {
    List<Blog> findAll();
    Blog findByTitleIs(String title);
}
