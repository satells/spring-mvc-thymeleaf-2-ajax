var table ;
var id;
$(this).ready(function() {
	
	moment.locale('pt-br');
	table = $("#table-server").DataTable({
		processing : true,
		serverSide : true,
		responsive : true,
		lengthMenu : [ 10, 15, 20, 25 ],
		ajax : {
			url : "/promocao/datatables/server",
			data : "data",
		},
		columns:[
			{data:'id'},
			{data:'titulo'},
			{data:'site'},
			{data:'linkPromocao'},
			{data:'descricao'},
			{data:'linkImagem'},
			{data:'preco', render: $.fn.dataTable.render.number('.',',',2,'R$')},
			{data:'likes'},
			{data:'dtCadastro', render:
				function(dtCadastro){
					return moment(dtCadastro).format('L');
				}
			},
			{data:'categoria.titulo'},
		],
		dom: 'Bfrtip',
		buttons:[
			{
				text:'Editar',
				attr:{
					id:'btn-editar',
					type:'button'
				},
				enabled: false
			},
			{
				text:'Excluir',
				attr: {
					id:'btn-excluir',
					type:'button'
				},
				enabled: false
			}
		]
	});
	
	table.buttons().disable();
	
	$("#table-server thead").on('click','tr',function(){
		table.buttons().disable();
		id="";
	});
	
	
	$("#table-server tbody").on('click','tr',function(){
		if ($(this).hasClass('selected')) {
			console.log('Selecionaro')
			$(this).removeClass('selected');
			table.buttons().disable();
			id="";
			console.log(`limpado ${id}`);
		}else{
			$('tr.selected').removeClass('selected');
			$(this).addClass('selected')
			table.buttons().enable();
			
			id = table.row(table.$('tr.selected')).data().id;
			console.log(`selecionado ${id}`);
		}
	});
	
	
	$("#btn-editar").on('click', function(){
		$.ajax({
			method:"GET",
			url:`/promocao/edit/${id}`,
			beforeSend:function(){
				$("#modal-form").modal('show'); 
				console.log(`editar ${id}`);
			},
			success:function(data){
				$("#edt_id").val(data.id);
				$("#edt_site").text(data.site);
				$("#edt_titulo").val(data.titulo);
				$("#edt_descricao").val(data.descricao);
				$("#edt_preco").val(data.preco.toLocaleString('pt-BR',{
					minimumFactionDigits:2,
					maximumFactionDigits:2
					
				}));
				$("#edt_categoria").val(data.categoria.id);
				$("#edt_linkImagem").val(data.linkImagem);
				$("#edt_imagem").attr('src', data.linkImagem);
			},
			error:function(){
				console.log("erro no retorno dos dados");
			}
		});
	});
	
	
	$("#btn-edit-modal").on('click', function(){
		
		
	});
	
	
	
	$("#btn-excluir").on('click', function(){
		$("#modal-delete").modal('show');
		console.log(`excluir ${id}`);
		
	});
	
	
	$("#btn-del-modal").on('click',function(){
		$.ajax({
			method:"GET", 
			url:`/promocao/delete/${id}`,
			success:function(){
				$("#modal-delete").modal('hide');
				table.ajax.reload();
				console.log(`Excluído com sucesso ${id}`);
			},
			error:function(){
				console.log("erro na exclusão")
			},
		});
	});
	
});