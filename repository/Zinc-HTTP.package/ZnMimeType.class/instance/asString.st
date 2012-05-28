printing
asString
	^String streamContents: [:s | self printOn: s]