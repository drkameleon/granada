class Home extends G.Controller

	constructor:()->
		@username = "Dr.Kameleon";
		@email = "drkameleon@gmail.com";
		@selected = true;
		@content = "someContent";

	index:()->
		@loadView("views/home");

	about:()->
		@loadView("views/about");

	###
	Modules
	###

	alert:()->
		window.alert("Done!");

