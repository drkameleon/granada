########################################################################
# Granada MVC Web Framework
#
# Written in JS/CoffeeScript
# Copyright(c) 2015, Dr.Kameleon (aka Yanis Zafirópulos) 					 
#
#-----------------------------------------------------------------------
# granada.coffee
########################################################################

class Granada

	constructor:()->
		@Controller = Controller;
		@Router = Router;
		@Template = Handlebars;

		@router = new Router();
		@controllers = {};

		$ =>
			@router.load();


@G = new Granada() unless @G;