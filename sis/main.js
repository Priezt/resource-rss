$(init);

function init(){
	$("div.close").click(function(){
		window.scrollTo(0, 0);
		$(this).parent().remove();
	});
	$("body").keypress(function(event){
		console.log(event);
		if(event.which == 100){// d
			$("div.close").first().click();
		}
	});
}
