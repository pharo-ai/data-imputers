Class {
	#name : #AIAbstractImputerStrategy,
	#superclass : #Object,
	#category : #'AI-DataImputers'
}

{ #category : #operation }
AIAbstractImputerStrategy >> fit: aCollection [

	^ self subclassResponsibility
]
