package com.ajax;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.ajax.service.SocialMetaTagService;

@SpringBootApplication
public class AjaxApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(AjaxApplication.class, args);

	}

	@Autowired
	SocialMetaTagService service;

	@Override
	public void run(String... args) throws Exception {

//		long start = System.currentTimeMillis();
//
//		SocialMetaTag socialMetaTag1 = service
//				.getSocialMetaTagByUrl("https://www.mobly.com.br/sofacama-3-lugares-casal-corsega-azul-turquesa-553624.html?origin=jetmobly");
//		SocialMetaTag socialMetaTag2 = service.getSocialMetaTagByUrl("https://www.nuuvem.com/item/project-cars-2");
//
//		System.out.println(System.currentTimeMillis() - start);
//
//		System.out.println(socialMetaTag1);
//		System.out.println(socialMetaTag2);

	}
}