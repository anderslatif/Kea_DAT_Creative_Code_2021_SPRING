class EmptyBox extends Rectangle { 
    constructor(x, y, width, height) {
        super();
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    draw(ctx) {
        // define draw the empty box at x and y coordinates with width and height
        // then call it in your game loop

        ctx.beginPath();
        ctx.rect(this.x, this.y, this.width, this.height);
        ctx.stroke();
    }
}
