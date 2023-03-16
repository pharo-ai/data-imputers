Class {
	#name : #AIMedianImputerStrategy,
	#superclass : #AIAbstractImputerStrategy,
	#category : #'AI-DataImputers'
}

{ #category : #operation }
AIMedianImputerStrategy >> getValuesFrom: aCollection [

	^ aCollection median
]
