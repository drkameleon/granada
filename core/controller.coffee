######################################################
# Granada MVC Web Framework
#
# Written in JS/CoffeeScript
# Copyright(c) 2015, Dr.Kameleon
# 					 aka Yanis Zafirópulos
#
#-----------------------------------------------------
# controller.coffee
######################################################

class Controller

	constructor:()->
		console.log("Controller:: in Super");

	loadView:(view,inside="body")->
		@container = inside;

		$.get("#{ view }.html",(result)=>
			@template = Handlebars.compile(result);
			$(inside).html(result);
			@render();
		);

	render:()->
		$(@container).html(@template(@));

	watch:()->
		watch(@,=>
			console.log("Controller:: watch: change observed");
			@render();
		);

	unwatch:()->
		unwatch(@);
