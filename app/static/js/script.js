var myIndex = 0;
var fade = document.getElementById("slideshow");
carousel();

function carousel() {
var i;
var x = document.getElementsByClassName("mySlides");
for (i = 0; i < x.length; i++) {
	x[i].style.display = "none";
}

myIndex++;

if (myIndex > x.length) {
	myIndex = 1;
}

x[myIndex-1].style.display = "block";
setTimeout(carousel, 5000);
}


function allowDrop(ev) {
	ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
}

