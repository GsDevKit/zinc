as yet unclassified
upToEnd
	"We use out own collectionSpecies."

	| newStream |

	newStream := (self collectionSpecies new: 100) writeStream.
	[ self atEnd ] whileFalse: [ newStream nextPut: self next ].
	^ newStream contents