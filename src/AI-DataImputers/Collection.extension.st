Extension { #name : #Collection }

{ #category : #'*AI-DataImputers' }
Collection >> mode [
	^ self asBag sortedCounts first value
]
