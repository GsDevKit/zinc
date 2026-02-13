testing
testEchoWebSocketsDotOrg
	| webSocket message |
	true
		ifTrue: [ 
			"ws://echo.webserver.org is sending 301 response (premanently moved).  It has moved to secure alterantive wss://."
			^ self ].
	webSocket := self webSocketClass to: 'ws://echo.websocket.org'.
	message := 'Greetings from Gemstone Smalltalk @ ' , TimeStamp now printString.
	webSocket sendMessage: message.
	self assert: webSocket readMessage equals: message.
	webSocket close