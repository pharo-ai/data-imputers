"
I am an abstract stategy. My subclasses will define how a `AISimpleImputer` will compute the missing values of a collection while calling `AISimpleImputer>>#fit:`.
"
Class {
	#name : #AIAbstractImputerStrategy,
	#superclass : #Object,
	#instVars : [
		'imputer'
	],
	#category : #'AI-DataImputers'
}

{ #category : #accessing }
AIAbstractImputerStrategy class >> imputer: anImputer [

	^ self new
		  imputer: anImputer;
		  yourself
]

{ #category : #operation }
AIAbstractImputerStrategy >> fit: aCollection [

	^ (1 to: aCollection first size) collect: [ :index |
		  | columnWithoutMissingValue |
		  columnWithoutMissingValue := aCollection asArray
			                               collect: [ :array | array at: index ]
			                               thenReject: [ :element | element = self imputer missingValue ].
		  self getValuesFrom: columnWithoutMissingValue ]
]

{ #category : #operation }
AIAbstractImputerStrategy >> getValuesFrom: aCollection [

	^ self subclassResponsibility
]

{ #category : #accessing }
AIAbstractImputerStrategy >> imputer [

	^ imputer
]

{ #category : #accessing }
AIAbstractImputerStrategy >> imputer: anObject [

	imputer := anObject
]
