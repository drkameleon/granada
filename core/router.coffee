########################################################################
# Granada MVC Web Framework
#
# Written in JS/CoffeeScript
# Copyright(c) 2015, Dr.Kameleon (aka Yanis Zafirópulos)
#
#-----------------------------------------------------------------------
# router.coffee
########################################################################

class Router

	constructor:()->
		@argv = {};
		@path = ["home","index"];

		url = window.location.href.split("#!").filter((n)=>return n!="");

		if url.length>1
			parts = url[1].split("?").filter((n)=>return n!="");
			if parts.length>1
				@argv = @parseArgs(parts[1]);
				@path = @parsePath(parts[0]);
			else
				@path = @parsePath(url[1]);

		console.log("Path: ",@path);
		console.log("Argv: ",@argv);


	parseArgs:(s)->
		result = {};
		args = s.split("&").filter((n)=>return n!="");

		for arg in args
			kvs = arg.split("=").filter((n)=>return n!="");

			if kvs[1]?
				result[kvs[0]] = kvs[1];
			else
				result[kvs[0]];

		return result;

	parsePath:(s)->
		return s.split("/").filter((n)=>return n!="");

	redirect:()->
		controller = @path[0].charAt(0).toUpperCase() + @path[0].slice(1);

		controller = new window[controller]();
		G.controllers.push(controller);
		controller.watch();
		controller[@path[1]]();