class Home extends G.Controller

	constructor:()->
		@username = "Dr.Kameleon";
		@email = "drkameleon@gmail.com";

	index:()->
		@loadView("views/home");

	about:()->
		console.log("In About");
