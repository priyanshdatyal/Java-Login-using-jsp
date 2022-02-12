var daynight = 0;

setTimeout(()=>{
	document.getElementById("message").style.opacity="0";
}, 5000);

setTimeout(()=>{
	document.getElementById("message").style.display="none";
}, 6000);
			
function changetheme() {
    document.body.classList.toggle("dark");
    if (daynight == 0) {
        daynight = 1;
    } else {
        daynight = 0;
    }
}