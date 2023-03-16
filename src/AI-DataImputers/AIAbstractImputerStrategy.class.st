Class {
	#name : #AIAbstractImputerStrategy,
	#superclass : #Object,
	#category : #'AI-DataImputers'
}

{ #category : #operation }
AIAbstractImputerStrategy >> fit: aCollection [

	^ (1 to: aCollection first size) collect: [ :index |
		  self getValuesFrom: (aCollection
				   collect: [ :array | array at: index ]
				   thenReject: #isNil) ]
]

{ #category : #operation }
AIAbstractImputerStrategy >> getValuesFrom: aCollection [

	^ self subclassResponsibility
]
