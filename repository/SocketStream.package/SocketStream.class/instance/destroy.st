as yet unclassified
destroy
  "Destroy the receiver and its underlying socket. Does not attempt to flush the output buffers. For a graceful close use SocketStream>>close instead."

  socket ifNotNil: [ self socket close ]