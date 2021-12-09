package com.ajax.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ajax.web.domain.Promocao;

public interface PromocaoRepository extends JpaRepository<Promocao, Long> {

}
