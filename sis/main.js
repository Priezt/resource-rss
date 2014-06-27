$(init);

function init(){
	$("div.close").click(function(){
		$(this).parent().remove();
	});
}
