########################################################################
# Granada MVC Web Framework
#
# Written in JS/CoffeeScript
# Copyright(c) 2015, Dr.Kameleon (aka Yanis Zafirópulos)
#
#-----------------------------------------------------------------------
# controller.coffee
########################################################################

class Controller

	constructor:()->
		@name = "undefined";

	loadView:(view,inside="body")->
		@container = inside;

		$.get("#{ view }.html",(result)=>
			@template = G.Template.compile(result);
			$(inside).html(result);
			@render();
		);

	render:()->
		rendered = @template(@);
		$(@container).html("<div controller='#{ @name }'>#{ rendered }</div>");
		@attachEvents();

	attachEvents:()->
		$("[controller=#{ @name }] button[do]").click((e)=>
			action = $(e.target).attr("do");
			eval("_this.#{ action }");
		);

		$("[controller=#{ @name }] input[type=text]").on('change',(e)=>
			bound = $(e.target).attr("bind");
			_this[bound] = $(e.target).val();
		);

		$("[controller=#{ @name }] input[type=checkbox]").click((e)=>
			bound = $(e.target).attr("bind");
			_this[bound] = "#{e.target.checked}"=="true"
		);

		$("[controller=#{ @name }] textarea").on('change',(e)=>
			bound = $(e.target).attr("bind");
			_this[bound] = $(e.target).val();
		);

		$("[go]").on('click',(e)=>
			destination = $(e.target).attr("go");
			G.router = new G.Router("#!#{ destination }");
			G.router.load();
			e.preventDefault();
		);

	watch:()->
		watch(@,=>
			console.log("Controller:: watch: change observed");
			@render();
		);

	unwatch:()->
		unwatch(@);
