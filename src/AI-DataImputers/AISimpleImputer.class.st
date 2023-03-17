Class {
	#name : #AISimpleImputer,
	#superclass : #Object,
	#instVars : [
		'statistics',
		'replacementStrategy',
		'missingValue'
	],
	#category : #'AI-DataImputers'
}

{ #category : #api }
AISimpleImputer >> fit: aCollection [

	aCollection ifEmpty: [ self error: 'Cannot fit empty collection.' ].
	statistics := replacementStrategy fit: aCollection
]

{ #category : #accessing }
AISimpleImputer >> fitAndTransform: aCollection [

	^ self
		  fit: aCollection;
		  transform: aCollection
]

{ #category : #initialization }
AISimpleImputer >> initialize [

	super initialize.
	self useAverage
]

{ #category : #accessing }
AISimpleImputer >> missingValue [

	^ missingValue
]

{ #category : #accessing }
AISimpleImputer >> missingValue: anObject [

	missingValue := anObject
]

{ #category : #accessing }
AISimpleImputer >> replacementStrategy [

	^ replacementStrategy
]

{ #category : #accessing }
AISimpleImputer >> replacementStrategy: anObject [

	replacementStrategy := anObject
]

{ #category : #accessing }
AISimpleImputer >> statistics [

	^ statistics
]

{ #category : #accessing }
AISimpleImputer >> statistics: anObject [

	statistics := anObject
]

{ #category : #api }
AISimpleImputer >> transform: aCollection [

	statistics ifNil: [ self error: '#fit: needs to be called before transforming.' ].

	^ aCollection collect: [ :subcoll |
		  subcoll withIndexCollect: [ :elem :index |
			  elem = self missingValue
				  ifTrue: [ statistics at: index ]
				  ifFalse: [ elem ] ] ]
]

{ #category : #options }
AISimpleImputer >> useAverage [

	replacementStrategy := AIAverageImputerStrategy imputer: self
]

{ #category : #options }
AISimpleImputer >> useConstant: aNumber [

	replacementStrategy := AIConstantImputerStrategy imputer: self constant: aNumber
]

{ #category : #options }
AISimpleImputer >> useMedian [

	replacementStrategy := AIMedianImputerStrategy imputer: self
]

{ #category : #options }
AISimpleImputer >> useMostFrequent [

	replacementStrategy := AIMostFrequentImputerStrategy imputer: self
]
