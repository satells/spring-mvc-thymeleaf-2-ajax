//Função para capturar as meta tags
$("#linkPromocao").on('change', function() {
	var url = $(this).val();
	
	
	
	
	
	if (url.length > 7) {
		$.ajax({
			method:"POST",
			url:"/meta/info?url="+url,
			cache:false,
			beforeSend:function(){
				$("#linkImagem").attr("src","");
				$("#alert").removeClass("alert alert-danger").text("");
				$("#titulo").val("")
				$("#site").text("");
				$("#loader-img").addClass("loader");
			},
			success:function(data){
				console.log(data);
				$("#titulo").val(data.title);
				$("#site").text(data.site.replace("@",""))
				$("#linkImagem").attr("src",data.image);
			},
			statusCode:{
				404:function(){
					$("#alert").addClass("alert alert-danger").text("Nenhuma informação pode ser recuperada dessa url.");
					$("#linkImagem").attr("src","/images/promo-dark.png");
				},
				
			},
			error:function(){
				$("#alert").addClass("alert alert-danger").text("Algo deu errado tente mais tarde.");
				$("#linkImagem").attr("src","/images/promo-dark.png");
			},
			complete:function(){
				$("#loader-img").removeClass("loader");			
			},
		});
	}
});