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

	constructor:(redirect=null)->
		@argv = {};
		@path = ["home","index"];

		if redirect?
			history.replaceState(null,null,redirect);

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

	load:()->
		controllerName = @path[0].charAt(0).toUpperCase() + @path[0].slice(1);

		if !G.controllers[controllerName]?

			controller = new window[controllerName]();
			controller.name = controllerName;

			G.controllers[controllerName] = controller;
		else
			controller = G.controllers[controllerName];

		controller.watch();
		controller[@path[1]]();
