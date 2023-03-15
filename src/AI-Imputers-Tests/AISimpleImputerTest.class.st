"
An AISimpleImputerTest is a test class for testing the behavior of AISimpleImputer
"
Class {
	#name : #AISimpleImputerTest,
	#superclass : #TestCase,
	#instVars : [
		'collection',
		'imputer'
	],
	#category : #'AI-Imputers-Tests'
}

{ #category : #running }
AISimpleImputerTest >> setUp [

	super setUp.
	collection := #( #( 7 2 3 ) #( 4 nil 6 ) #( 10 5 nil ) ).
	imputer := AISimpleImputer new
]

{ #category : #tests }
AISimpleImputerTest >> testFitAverage [

	imputer
		useAverage;
		fit: collection.

	self assert: imputer statistics equals: #( 7 3.5 4.5 )
]

{ #category : #tests }
AISimpleImputerTest >> testTransformAverage [

	imputer
		useAverage;
		fit: collection.

	self assert: (imputer transform: collection) equals: #( #( 7 2 3 ) #( 4 3.5 6 ) #( 10 5 4.5 ) )
]
