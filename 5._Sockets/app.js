const app = require('express')();
const server = require('http').createServer(app);

const io = require('socket.io')(server);

io.on('connection', () => { /* … */ });

app.get("/", (req, res) => {
    res.sendFile(__dirname + "/canvas.html");
});

server.listen(3000);
