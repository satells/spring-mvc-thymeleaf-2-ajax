package com.ajax.web.controller;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.ajax.repository.PromocaoRepository;
import com.ajax.web.domain.Promocao;

@Service
public class PromocaoDataTablesService {

	private String[] cols = { "id", "titulo", "site", "linkPromocao", "descricao", "linkImagem", "preco", "likes", "dtCadastro", "categoria" };

	public Map<String, Object> execute(PromocaoRepository repository, HttpServletRequest request) {
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		int draw = Integer.parseInt(request.getParameter("draw"));

		int current = currentPage(start, length);

		String column = columnName(request);
		Sort.Direction direction = orderBy(request);
		String search = searchBy(request);

		Pageable pageable = PageRequest.of(current, length, direction, column);

		Map<String, Object> json = new LinkedHashMap<String, Object>();
		Page<Promocao> page = queryBy(search, repository, pageable);

		json.put("draw", draw);
		json.put("recordsTotal", page.getTotalElements());
		json.put("recordsFiltered", page.getTotalElements());
		json.put("data", page.getContent());

		return json;

	}

	private String searchBy(HttpServletRequest request) {
		String parameter = request.getParameter("search[value]");
		if (parameter.isEmpty()) {
			return "";
		}

		return parameter;
	}

	private Page<Promocao> queryBy(String search, PromocaoRepository repository, Pageable pageable) {
		if (search.isEmpty()) {
			return repository.findAll(pageable);
		}

		if (search.matches("^[0-9]+([.,][0-9]{2})?$")) {
			search = search.replace(",", ".");
			return repository.findByPreco(new BigDecimal(search), pageable);
		}

		return repository.findByTituloOrCategoria(search, pageable);

	}

	private Direction orderBy(HttpServletRequest request) {
		String order = request.getParameter("order[0][dir]");
		Sort.Direction sort = Sort.Direction.ASC;
		if (order.equalsIgnoreCase("desc")) {
			sort = Sort.Direction.DESC;
		}

		return sort;
	}

	private String columnName(HttpServletRequest request) {
		int iCol = Integer.parseInt(request.getParameter("order[0][column]"));
		return cols[iCol];
	}

	private int currentPage(int start, int length) {
		return start / length;
	}
}