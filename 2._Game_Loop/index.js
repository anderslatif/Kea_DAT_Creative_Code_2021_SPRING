const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

let circleX;
let circleY;

let lastTime;
let requiredElapsed = 1000 / 66.666; // 15 fps


function setup() {
    circleX = canvas.width / 1000;
    circleY = canvas.height / 1000;
    draw();
}

function draw(now) {
    requestAnimationFrame(draw);

    if (!lastTime) {
        lastTime = now;
    }
    const elapsedTime = now - lastTime;
    if (elapsedTime > requiredElapsed) {
        // do stuff

        ctx.fillStyle = "lightblue";
        ctx.fillRect(0, 0, canvas.width, canvas.height);
    
        circleX += 1;
        circleY += 1;
        
        ctx.fillStyle = "red";
        ctx.beginPath();
        ctx.arc(circleX, circleY, 50, 0, Math.PI*2);
        ctx.fill();

        // then the last step
        lastTime = now;
    }
}



window.addEventListener("resize", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
});

window.addEventListener("load", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    setup();
});

