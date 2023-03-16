Class {
	#name : #AIMostFrequentImputerStrategy,
	#superclass : #AIAbstractImputerStrategy,
	#category : #'AI-DataImputers'
}

{ #category : #operation }
AIMostFrequentImputerStrategy >> getValuesFrom: aCollection [

	^ aCollection mode
]
