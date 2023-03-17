Class {
	#name : #AISimpleImputerDataFrameTest,
	#superclass : #TestCase,
	#instVars : [
		'imputer',
		'collection'
	],
	#category : #'AI-DataImputers-DataFrame-Tests'
}

{ #category : #running }
AISimpleImputerDataFrameTest >> setUp [

	super setUp.
	collection := DataFrame withRows: #( #( 7 2 5 6 ) #( 7 nil 5 9 ) #( 10 2 nil 6 ) ).
	imputer := AISimpleImputer new
]

{ #category : #tests }
AISimpleImputerDataFrameTest >> testFit [

	collection := DataFrame withRows: #( #( #a #x ) #( nil #y ) #( #a nil ) #( #b #y ) ).
	imputer
		useMostFrequent;
		fit: collection.

	self assert: imputer statistics equals: #( #a #y )
]

{ #category : #tests }
AISimpleImputerDataFrameTest >> testTranform [

	collection := DataFrame withRows: #( #( #a #x ) #( nil #y ) #( #a nil ) #( #b #y ) ).
	imputer
		useMostFrequent;
		fit: collection.

	self assert: (imputer transform: collection) equals: (DataFrame withRows: #( #( #a #x ) #( #a #y ) #( #a #y ) #( #b #y ) ))
]

{ #category : #tests }
AISimpleImputerDataFrameTest >> testTransformAverage [

	imputer
		useAverage;
		fit: collection.

	self assert: (imputer transform: collection) equals: (DataFrame withRows: #( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) ))
]

{ #category : #tests }
AISimpleImputerDataFrameTest >> testTransformConstant [

	imputer
		useConstant: 10;
		fit: collection.

	self assert: (imputer transform: collection) equals: (DataFrame withRows: #( #( 7 2 5 6 ) #( 7 10 5 9 ) #( 10 2 10 6 ) ))
]

{ #category : #tests }
AISimpleImputerDataFrameTest >> testTransformMedian [

	imputer
		useAverage;
		fit: collection.

	self assert: (imputer transform: collection) equals: (DataFrame withRows: #( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) ))
]

{ #category : #tests }
AISimpleImputerDataFrameTest >> testTransformMostFrequent [

	imputer
		useMostFrequent;
		fit: collection.

	self assert: (imputer transform: collection) equals: (DataFrame withRows: #( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) ))
]
