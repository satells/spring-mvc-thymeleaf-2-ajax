package com.ajax.web.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ajax.repository.CategoriaRepository;
import com.ajax.repository.PromocaoRepository;
import com.ajax.web.domain.Categoria;
import com.ajax.web.domain.Promocao;

@Controller
@RequestMapping("/promocao")
public class PromocaoController {

	private static Logger LOG = LoggerFactory.getLogger(PromocaoController.class);

	@Autowired
	private CategoriaRepository categoriaRepository;

	@Autowired
	private PromocaoRepository promocaoRepository;

	@ModelAttribute("categorias")
	public List<Categoria> getCategorias() {

		return categoriaRepository.findAll();

	}

	@GetMapping("/add")
	public String abrirCadastro() {

		return "promo-add";
	}

	@PostMapping("/save")
	public ResponseEntity<?> salvar(@Valid Promocao promocao, BindingResult result) {
//		LOG.info("Promocao {}", promocao.toString());

		if (result.hasErrors()) {
			Map<String, String> erros = new HashMap<String, String>();
			List<FieldError> fieldErrors = result.getFieldErrors();

			for (FieldError error : fieldErrors) {
				erros.put(error.getField(), error.getDefaultMessage());
			}

			return ResponseEntity.unprocessableEntity().body(erros);

		}

		promocao.setDtCadastro(LocalDateTime.now());

		promocaoRepository.save(promocao);

		return ResponseEntity.ok().build();
	}

}
