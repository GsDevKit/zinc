testing
testEcho
  "Needs to be executed in ZnGsWebSocketTests context"
  | webSocket message gemServer |
  gemServer := self createGemServerMap: 'ws-echo' to: ZnWebSocketEchoHandler new.
  self
    runGemServer: gemServer
    do: [ 
      webSocket := self webSocketClass to: 'ws://localhost:1701/ws-echo'.
      message := 'Greetings from Gemstone Smalltalk @ '
        , TimeStamp now printString.
      webSocket sendMessage: message.
      self assert: webSocket readMessage equals: message.
      webSocket close ]