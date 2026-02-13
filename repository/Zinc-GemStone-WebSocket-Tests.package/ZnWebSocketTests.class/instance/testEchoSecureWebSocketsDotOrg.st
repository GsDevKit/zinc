testing
testEchoSecureWebSocketsDotOrg
	"Needs to be executed in ZnGsWebSocketTests context"
	| webSocket message |
	(Smalltalk at: #'GsSecureSocket') disableCertificateVerificationOnClient.
	webSocket := self webSocketClass to: 'wss://echo.websocket.org'.
	message := 'Greetings from Gemstone Smalltalk @ ' , TimeStamp now printString.
	webSocket sendMessage: message.
	self assert: webSocket readMessage equals: message.
	webSocket close