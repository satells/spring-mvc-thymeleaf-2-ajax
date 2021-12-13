// infinit scroll
var pageNumber = 0;

$(document).ready(function(){
	$("#loader").hide();
	$("#fim-btn").hide();
});






$(window).scroll(function(){
	
	var scrollTop = $(this).scrollTop();
	var conteudo = $(document).height() - $(window).height();
	//console.log(`scrolltop: ${scrollTop} | conteudo: ${conteudo}`);
	
	if (scrollTop >= conteudo) {
		pageNumber++;
		
		//delay do javascript atraso de 200 milisegundos
		setTimeout(function(){
			loadByScrollBar(pageNumber);
		}, 200);
	}
	
});



function loadByScrollBar(pageNumber){
	var site = $("#autocomplete-input").val();
	
	$.ajax({
		method:"GET",
		url:"/promocao/list/ajax",
		data:{
			page: pageNumber,
			site: site,
		},
		befoSend:function(){
			$("#loader-img").show();
		},
		
		
		success:function(response){
			var tamanhoDoObjetoDeResposta = 150;
			//tamanho do objeto de resposta 
			if(response.length>tamanhoDoObjetoDeResposta){
//				console.log(`resposta > ${response}   ${response.length}`);
				console.log(`resposta > ${response.length}`);
				//carrega de form gradual
				$(".row").fadeIn(250, function(){
					$(this).append(response);
 				});
			}else{
				$("#fim-btn").show();
				$("#loader-img").removeClass("loader");
			}
		},
		complete:function(){
			$("#loader-img").hide();
		},
		error:function(xhr){
			console.log(`Ops, ocorreu um erro: ${xhr.status} - ${xhr.statusText}`);
		},
	});
}
//Adicionar likes

//O * indica ao jQuery esperar um clique em qualquer botão que tenha a instrução "likes-btn-" 
$(document).on("click", "button[id*='likes-btn-']",function(){
	var id = $(this).attr("id").split("-")[2];
	console.log(`id: ${id}`);
	
	
	// ver eventos delegados - delegar ao jQuery os objetos adcionados posteriormente à criação do objeto DOM  
	$.ajax({
		method:"POST",
		url:`/promocao/like/${id}`,
		success:function(response){
			$(`#likes-count-${id}`).text(response);
		},
		error:function(xhr){
			console.log(`Ocorreu, um erro: ${xhr.status} - ${xhr.statusText}`);
		}
	});
});



$("#autocomplete-input").autocomplete({
	source:function(request, response){
		$.ajax({
			method:"GET",
			url:"/promocao/site",
			data:{
				termo:request.term,
			},
			success:function(result){
				response(result);
			}
	
			
		});
	}
});


//$("button[id*='likes-btn-']").on("click",function(){
//	var id = $(this).attr("id").split("-")[2];
//	console.log(`id: ${id}`);
//	
//	
//	// ver eventos delegados - delegar ao jQuery os objetos adcionados posteriormente à criação do objeto DOM  
//	$.ajax({
//		method:"POST",
//		url:`/promocao/liks/${id}`,
//		success:function(response){
//			$(`#likes-count-${id}`).text(response);
//		},
//		error:function(xhr){
//			console.log(`Ocorreu, um erro: ${xhr.status} - ${xhr.statusText}`);
//		}
//	});
//});



$("#autocomplete-submit").on("click", function(){
	
	var site = $("#autocomplete-input").val();
	
	$.ajax({
		method:"GET",
		url:"/promocao/site/list",
		data:{
			site:site
		},
		beforeSend:function(){
			pageNumber = 0;	
 			$("#fim-btn").hide();
			$(".row").fadeOut(400, function(){
				$(this).empty();//limpa tudo dentro do div
			});
		},
		success:function(response){
			$(".row").fadeIn(250, function(){
				$(this).append(response);//limpa tudo dentro do div
			});
		},
		error: function(xhr){
			console.log("Algo deu errado ${xhr.status} - ${xhr.statusText}");
		}
	});
});



