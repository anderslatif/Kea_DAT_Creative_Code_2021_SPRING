class EmptyBox extends Rectangle { 
    constructor(x, y, width, height) {
        super();
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    draw(ctx, x, y) {
        ctx.beginPath();
        ctx.rect(x || this.x, y || this.y, this.width, this.height);
        ctx.stroke();
    }
}
