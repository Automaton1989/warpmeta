package com.matthew.warpmeta.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.matthew.warpmeta.models.Video;

public interface VideoRepository extends CrudRepository<Video, Long> {
	List<Video> findAll();
	Video findByTitleIs(String title);
	List<Video> findTop5ByOrderByIdDesc();
}
