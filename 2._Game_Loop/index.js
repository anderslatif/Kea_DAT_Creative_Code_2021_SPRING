const canvas = document.getElementById("canvas");
const context = canvas.getContext("2d");

function setup() {
    context.fillStyle = "lightblue";
    context.fillRect(0, 0, canvas.width, canvas.height);
}


window.addEventListener("load", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    setup();
});

