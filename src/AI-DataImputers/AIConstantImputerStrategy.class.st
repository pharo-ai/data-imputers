"
I am a strategy that will use a constant value to define a fit value of imputers.
"
Class {
	#name : #AIConstantImputerStrategy,
	#superclass : #AIAbstractImputerStrategy,
	#instVars : [
		'constant'
	],
	#category : #'AI-DataImputers'
}

{ #category : #accessing }
AIConstantImputerStrategy class >> imputer: anImputer constant: aNumber [

	^ (self imputer: anImputer)
		  constant: aNumber;
		  yourself
]

{ #category : #accessing }
AIConstantImputerStrategy >> constant [

	^ constant
]

{ #category : #accessing }
AIConstantImputerStrategy >> constant: anObject [

	constant := anObject
]

{ #category : #api }
AIConstantImputerStrategy >> fit: aCollection [

	^ (1 to: aCollection first size) collect: [ :index | self constant ]
]

{ #category : #operation }
AIConstantImputerStrategy >> getValuesFrom: aCollection [
	"#fit: does not need it here."

	<ignoreForCoverage>
	self shouldNotImplement
]
