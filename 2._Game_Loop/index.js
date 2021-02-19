const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

let horseImage = new Image();

let lastTime;
let requiredElapsed = 1000 / 15; // 15 fps

let circleX;
let circleY;

let firstBox;
let boxX = 20;

function setup() {
    circleX = canvas.width / 1000;
    circleY = canvas.height / 1000;
    firstBox = new EmptyBox(50, 50, 200, 300);
    draw();
}

function draw(now) {
    requestAnimationFrame(draw);

    if (!lastTime) {
        lastTime = now;
    }
    const elapsedTime = now - lastTime; // elapsed time is delta time
    if (elapsedTime > requiredElapsed) {
        // do stuff
        update();

        ctx.fillStyle = "lightblue";
        ctx.fillRect(0, 0, canvas.width, canvas.height);
    
        circleX += 1;
        circleY += 1;
        
        ctx.fillStyle = "red";
        ctx.beginPath();
        ctx.arc(circleX, circleY, 50, 0, Math.PI*2);
        ctx.fill();

        ctx.drawImage(horseImage, 0, 0, canvas.width, canvas.height);

        firstBox.draw(ctx);

        // then the last step
        lastTime = now;
    }
}

function update() {
    // updating game logic here
    boxX += 10;
    firstBox.x = boxX;
     
}


window.addEventListener("resize", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
});

window.addEventListener("load", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    horseImage.src = "./assets/horse.jpg";
    horseImage.onload = () => {
        setup();        
    }
});

