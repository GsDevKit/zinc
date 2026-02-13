testing
testStatus
  "Needs to be executed in ZnGsWebSocketTests context"
  | webSocket message gemServer |
  gemServer := self
    createGemServerMap: 'ws-status'
    to: ZnWebSocketStatusHandler new.
  self
    runGemServer: gemServer
    do: [ 
      webSocket := self webSocketClass to: 'ws://localhost:1701/ws-status'.
      message := webSocket readMessage.
      self
        assert:
          (#('GemStone' 'Free Space' 'Process')
            allSatisfy: [ :each | message includesSubstring: each ]).
      webSocket close ]