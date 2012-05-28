as yet unclassified
next: anInteger 
	"We use our own collectionSpecies."

	^ self collectionSpecies streamContents: [ :out | | count |
		count :=0.
		[ self atEnd or: [ count >= anInteger ] ] whileFalse: [
			out nextPut: self next.
			count := count + 1 ] ]