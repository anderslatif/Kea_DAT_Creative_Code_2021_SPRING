const app = require('express')();
const server = require('http').createServer(app);

const io = require('socket.io')(server);

io.on('connection', (socket) => { 
    console.log("A socket joined");
});

// serve the html page through the server
app.get("/", (req, res) => {
    res.sendFile(__dirname + "/canvas.html");
});

server.listen(3000);
