as yet unclassified
flushComet
  "Flushes the receiver and answer if the socket is still in a valid state and both ends are properly connected. Free the socket, as a side-effect if there is a problem."

  | result |
  result := [ 
  self flush.
  true ]
    on: NetworkError , SpSocketError
    do: [ :err | false ].
  result := result and: [ self isConnected and: [ self isOtherEndConnected ] ].
  result
    ifFalse: [ self socket destroy ].
  ^ result