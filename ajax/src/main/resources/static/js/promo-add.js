$("#form-add-promo").submit(function(e) {
	e.preventDefault();

	var promo = {};

	promo.linkPromocao = $("#linkPromocao").val();
	promo.descricao = $("#descricao").val();
	promo.preco = $("#preco").val();
	promo.titulo = $("#titulo").val();
	promo.categoria = $("#categoria").val();
	promo.linkImagem = $("#linkImagem").attr("src");
	promo.site = $("#site").text();

	console.log(promo);

	$.ajax({
		method : "POST",
		url : "/promocao/save",
		data : promo,
		statusCode:{
			422:function(xhr){
				console.log("STATUS:", xhr.status);
				var errors = $.parseJSON(xhr.responseText);
				
				$.each(errors, function(key, val){
					$("#"+ key ).addClass("is-invalid");
					$("#error-" + key)
						.addClass("invalid-feedback")
						.append("<span class='error-span'>"+ val +"</span>");
				});
			}
		},
		beforeSend : function() {
			$("span").closest('.error-span').remove();
			
			$("#categoria").removeClass("is-invalid");
			$("#preco").removeClass("is-invalid");
			$("#linkPromocao").removeClass("is-invalid");
			$("#titulo").removeClass("is-invalid");
			
			
			$("#form-add-promo").hide();
			$("#loader-form").addClass("loader").show();
		},
		success : function() {
			$("#form-add-promo").each(function() {
				this.reset();
			});
			$("#linkImagem").attr("src", "/images/promo-dark.png");
			$("#site").text("");

			$("#alert").removeClass("alert-danger").addClass("alert alert-success").text("Promoção cadastrada com sucesso!");
		},
		error : function(xhr) {
			console.log(xhr.responseText);
			$("#alert").addClass("alert alert-danger").text("Não foi possível salvar esta promoção.");
		},
		complete : function() {
			$("#loader-form").fadeOut(800, function() {
				$("#form-add-promo").fadeIn(250);
				$("#loader-form").removeClass("loader");
			});
		},

	});

});

// Função para capturar as meta tags
$("#linkPromocao").on('change', function() {
	var url = $(this).val();

	if (url.length > 7) {
		$.ajax({
			method : "POST",
			url : "/meta/info?url=" + url,
			cache : false,
			beforeSend : function() {
				$("#linkImagem").attr("src", "");
				$("#alert").removeClass("alert alert-danger alert-success").text("");
				$("#titulo").val("")
				$("#site").text("");
				$("#loader-img").addClass("loader");
			},
			success : function(data) {
				console.log(data);
				$("#titulo").val(data.title);
				$("#site").text(data.site.replace("@", ""))
				$("#linkImagem").attr("src", data.image);
			},
			statusCode : {
				404 : function() {
					$("#alert").addClass("alert alert-danger").text("Nenhuma informação pode ser recuperada dessa url.");
					$("#linkImagem").attr("src", "/images/promo-dark.png");
				},

			},
			error : function() {
				$("#alert").addClass("alert alert-danger").text("Algo deu errado tente mais tarde.");
				$("#linkImagem").attr("src", "/images/promo-dark.png");
			},
			complete : function() {
				$("#loader-img").removeClass("loader");
			},
		});
	}
});