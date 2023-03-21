Extension { #name : #SequenceableCollection }

{ #category : #'*AI-DataImputers' }
SequenceableCollection >> copyReplace: missingValue in2DCollectionBy: arrayOfReplacementValues [
	"I am a 2D collection and the goal is to return a copy replace the missing values by the values of my second parameter. The good value is the index of the missing value in the sub collection."

	^ self collect: [ :subColl |
		  subColl withIndexCollect: [ :element :index |
			  element = missingValue
				  ifTrue: [ arrayOfReplacementValues at: index ]
				  ifFalse: [ element ] ] ]
]
