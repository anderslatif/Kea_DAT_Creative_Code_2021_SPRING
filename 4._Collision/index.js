const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

function draw() {
    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    ctx.fillStyle = "blue";
    ctx.fillRect(50, 50, 100, 100);
}

draw();

window.addEventListener("mousemove", (event) => {
    draw();

    ctx.fillStyle = "red";
    ctx.fillRect(event.clientX, event.clientY, 100, 100);
});

window.addEventListener("resize", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
});

window.addEventListener("load", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
});
