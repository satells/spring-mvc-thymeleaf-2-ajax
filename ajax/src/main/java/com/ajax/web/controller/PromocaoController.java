package com.ajax.web.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

		promocao.setLikes(0);
		;

		if (result.hasErrors()) {
			Map<String, String> erros = new HashMap<String, String>();
			List<FieldError> fieldErrors = result.getFieldErrors();

			for (FieldError error : fieldErrors) {
				erros.put(error.getField(), error.getDefaultMessage());
			}

			return ResponseEntity.unprocessableEntity().body(erros);

		}

		promocao.setDtCadastro(LocalDateTime.now());

//		LOG.info("Promocao {}", promocao.toString());
		promocaoRepository.save(promocao);

		return ResponseEntity.ok().build();
	}

	@GetMapping("/list")
	public String listarOfertas(ModelMap model) {

		Sort sort = Sort.by(Sort.Direction.DESC, "dtCadastro");
		PageRequest pageRequest = PageRequest.of(0, 8, sort);

		model.addAttribute("promocoes", promocaoRepository.findAll(pageRequest));

		return "promo-list";
	}

	@GetMapping("/list/ajax")
	public String listarCards(@RequestParam(name = "page", defaultValue = "1") int page, ModelMap model) {

		Sort sort = Sort.by(Sort.Direction.DESC, "dtCadastro");
		PageRequest pageRequest = PageRequest.of(page, 8, sort);

		model.addAttribute("promocoes", promocaoRepository.findAll(pageRequest));

		return "promo-card";
	}

	@PostMapping("/like/{id}")
	public ResponseEntity<?> adicionarLikes(@PathVariable("id") Long id) {
		System.out.println(id);

		promocaoRepository.updateSomarLikes(id);
		int likes = promocaoRepository.findLikesById(id);

		return ResponseEntity.ok(likes);
	}

}
