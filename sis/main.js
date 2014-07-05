var killed = [];
var libnotify = humane.create({baseCls: 'humane-libnotify', addnCls: 'humane-libnotify-info'})
$(init);

function show_div_count(){
	humane.remove(function(){});
	libnotify.log($("div.thread").size());
}

function delete_div(){
	window.scrollTo(0, 0);
	killed.push($(this).parent());
	if(killed.length > 10){
		killed.shift();
	}
	console.log(killed);
	$(this).parent().remove();
	show_div_count();
}

function init(){
	$("div.close").click(delete_div);
	$("body").keypress(function(event){
		//console.log(event);
		if(event.which == 100){// d
			$("div.close").first().click();
		}else if(event.which == 114){// r
			if(killed.length > 0){
				var last_div = killed.pop();
				last_div.insertBefore($("div.close").first().parent());
				last_div.find("div.close").click(delete_div);
				console.log(killed);
				show_div_count();
			}
		}
	});
}
