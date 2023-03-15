Class {
	#name : #AISimpleImputer,
	#superclass : #Object,
	#instVars : [
		'statistics',
		'replacementStrategy'
	],
	#category : #'AI-DataImputers'
}

{ #category : #api }
AISimpleImputer >> fit: aCollection [

	aCollection ifEmpty: [ self error: 'Cannot fit empty collection.' ].
	statistics := replacementStrategy fit: aCollection
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

{ #category : #operations }
AISimpleImputer >> transform: aCollection [

	statistics ifNil: [ self error: '#fit: needs to be called before transforming.' ].

	^ aCollection collect: [ :subcoll | subcoll collectWithIndex: [ :elem :index | elem ifNil: [ statistics at: index ] ] ]
]

{ #category : #options }
AISimpleImputer >> useAverage [

	replacementStrategy := AIAverageImputerStrategy new
]
