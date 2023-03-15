Class {
	#name : #AIAbstractImputerStrategy,
	#superclass : #Object,
	#category : #'AI-Imputers'
}

{ #category : #operation }
AIAbstractImputerStrategy >> fit: aCollection [

	^ self subclassResponsibility
]
