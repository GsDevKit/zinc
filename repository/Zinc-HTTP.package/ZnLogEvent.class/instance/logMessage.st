accessing
logMessage
	| string |
	string:=self timeStamp asString , ' ' ,  self processId asString , ' ' , self category first asUppercase , ' '.
	self message isNil ifFalse: [ string := string , self message ].
	^string