const http = require('http');
const express = require('express');
const socketIO = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIO(server);

let usuariosConectados = [];

io.on('connection', socket => {
  console.log('Nuevo usuario conectado');

  // Enviar la lista de usuarios conectados a todos los clientes
  io.emit('usuariosConectados', usuariosConectados);

  // Manejar el evento de un nuevo mensaje
  socket.on('nuevoMensaje', mensaje => {
    console.log(`Nuevo mensaje recibido: ${mensaje}`);
    io.emit('mensajeRecibido', mensaje);
  });

  // Manejar el evento de un usuario desconectado
  socket.on('disconnect', () => {
    console.log('Usuario desconectado');
    usuariosConectados
