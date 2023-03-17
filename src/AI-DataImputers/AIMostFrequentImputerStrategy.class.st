"
I am a strategy that will use the most frequent value of a 2D collection column to define a fit value of imputers.
"
Class {
	#name : #AIMostFrequentImputerStrategy,
	#superclass : #AIAbstractImputerStrategy,
	#category : #'AI-DataImputers'
}

{ #category : #operation }
AIMostFrequentImputerStrategy >> getValuesFrom: aCollection [

	^ aCollection mode
]
