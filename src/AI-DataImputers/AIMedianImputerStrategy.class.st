"
I am a strategy that will use the median value of a 2D collection column to define a fit value of imputers.
"
Class {
	#name : #AIMedianImputerStrategy,
	#superclass : #AIAbstractImputerStrategy,
	#category : #'AI-DataImputers'
}

{ #category : #operation }
AIMedianImputerStrategy >> getValuesFrom: aCollection [

	^ aCollection median
]
