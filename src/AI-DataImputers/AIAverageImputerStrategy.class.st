Class {
	#name : #AIAverageImputerStrategy,
	#superclass : #AIAbstractImputerStrategy,
	#category : #'AI-DataImputers'
}

{ #category : #operation }
AIAverageImputerStrategy >> fit: aCollection [

	^ (1 to: aCollection size) collect: [ :index |
		  (aCollection
			   collect: [ :array | array at: index ]
			   thenReject: #isNil) average ]
]
