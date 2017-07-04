$(document).ready(function() {
	// console.log("intro js");
		$(".edit_post").on("submit", function(){
			event.preventDefault();
			$(".hidden_form", this).slideToggle("slow");			
		});
	// console.log("post js");
});
