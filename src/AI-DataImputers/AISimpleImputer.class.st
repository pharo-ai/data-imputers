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

{ #category : #private }
AISimpleImputer >> ensureIs2D: aCollection [

	self assert: aCollection isCollection description: 'Imputer can only work on 2D collections.'.
	aCollection do: [ :coll | self assert: coll isCollection description: 'Imputer can only work on 2D collections.' ]
]

{ #category : #api }
AISimpleImputer >> fit: aCollection [

	self ensureIs2D: aCollection.
	aCollection ifEmpty: [ self error: 'Cannot fit empty collection.' ].
	self statistics: (self replacementStrategy fit: aCollection)
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

	self ensureIs2D: aCollection.
	self statistics ifNil: [ self error: '#fit: needs to be called before transforming.' ].

	^ aCollection collect: [ :subcoll |
		  subcoll withIndexCollect: [ :elem :index |
			  elem = self missingValue
				  ifTrue: [ statistics at: index ]
				  ifFalse: [ elem ] ] ]
]

{ #category : #options }
AISimpleImputer >> useAverage [

	self replacementStrategy: (AIAverageImputerStrategy imputer: self)
]

{ #category : #options }
AISimpleImputer >> useConstant: aNumber [

	self replacementStrategy: (AIConstantImputerStrategy imputer: self constant: aNumber)
]

{ #category : #options }
AISimpleImputer >> useMedian [

	self replacementStrategy: (AIMedianImputerStrategy imputer: self)
]

{ #category : #options }
AISimpleImputer >> useMostFrequent [

	self replacementStrategy: (AIMostFrequentImputerStrategy imputer: self)
]
