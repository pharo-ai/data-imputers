Class {
	#name : #AISimpleImputerDataFrameTest,
	#superclass : #TestCase,
	#instVars : [
		'imputer'
	],
	#category : #'AI-DataImputers-DataFrame-Tests'
}

{ #category : #running }
AISimpleImputerDataFrameTest >> setUp [

	super setUp.
	imputer := AISimpleImputer new
]

{ #category : #running }
AISimpleImputerDataFrameTest >> testFit [

	| collection |
	collection := DataFrame withRows: #( #( #a #x ) #( nil #y ) #( #a nil ) #( #b #y ) ).
	imputer
		useMostFrequent;
		fit: collection.

	self assert: imputer statistics equals: #( #a #y )
]

{ #category : #running }
AISimpleImputerDataFrameTest >> testTranform [

	| collection |
	collection := DataFrame withRows: #( #( #a #x ) #( nil #y ) #( #a nil ) #( #b #y ) ).
	imputer
		useMostFrequent;
		fit: collection.

	self assert: (imputer transform: collection) equals: (DataFrame withRows: #( #( #a #x ) #( #a #y ) #( #a #y ) #( #b #y ) ))
]
