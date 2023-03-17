"
I am a strategy that will use the average value of a 2D collection column to define a fit value of imputers.
"
Class {
	#name : #AIAverageImputerStrategy,
	#superclass : #AIAbstractImputerStrategy,
	#category : #'AI-DataImputers'
}

{ #category : #operation }
AIAverageImputerStrategy >> getValuesFrom: aCollection [

	^ aCollection average
]
