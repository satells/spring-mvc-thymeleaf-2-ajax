package com.ajax.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.ajax.web.domain.Promocao;

public interface PromocaoRepository extends JpaRepository<Promocao, Long> {

	@Modifying
	@Transactional(readOnly = false)
	@Query("update Promocao p set p.likes = p.likes + 1 where p.id = :id")
	void updateSomarLikes(@Param("id") Long id);

	@Query("select p.likes from Promocao p where p.id = :id")
	int findLikesById(@Param("id") Long id);

}
