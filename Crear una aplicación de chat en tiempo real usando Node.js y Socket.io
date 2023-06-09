//JS
// index.js
const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const io = require('socket.io')(server);

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', (socket) => {
  console.log('Un usuario se ha conectado.');

  socket.on('disconnect', () => {
    console.log('Un usuario se ha desconectado.');
  });

  socket.on('chat message', (msg) => {
    console.log('Mensaje: ' + msg);
    io.emit('chat message', msg);
  });
});

server.listen(3000, () => {
  console.log('Servidor escuchando en el puerto 3000.');
});

//HTML

// index.js
const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const io = require('socket.io')(server);

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', (socket) => {
  console.log('Un usuario se ha conectado.');

  socket.on('disconnect', () => {
    console.log('Un usuario se ha desconectado.');
  });

  socket.on('chat message', (msg) => {
    console.log('Mensaje: ' + msg);
    io.emit('chat message', msg);
  });
});

server.listen(3000, () => {
  console.log('Servidor escuchando en el puerto 3000.');
});
