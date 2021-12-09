package com.ajax.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ajax.web.domain.Categoria;

public interface CategoriaRepository extends JpaRepository<Categoria, Long> {

}
