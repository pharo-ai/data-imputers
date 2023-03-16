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
	#category : #'AI-DataImputers-Tests'
}

{ #category : #running }
AISimpleImputerTest >> setUp [

	super setUp.
	collection := #( #( 7 2 5 6 ) #( 7 nil 5 9 ) #( 10 2 nil 6 ) ).
	imputer := AISimpleImputer new
]

{ #category : #tests }
AISimpleImputerTest >> testFitAndTransform [

	self assert: (imputer fitAndTransform: collection) equals: #( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )
]

{ #category : #tests }
AISimpleImputerTest >> testFitAverage [

	imputer
		useAverage;
		fit: collection.

	self assert: imputer statistics equals: #( 8 2 5 7 )
]

{ #category : #tests }
AISimpleImputerTest >> testFitContant [

	imputer
		useConstant: 10;
		fit: collection.

	self assert: imputer statistics equals: #( 10 10 10 10 )
]

{ #category : #tests }
AISimpleImputerTest >> testFitMedian [

	imputer
		useMedian;
		fit: collection.

	self assert: imputer statistics equals: #( 7 2 5 6 )
]

{ #category : #tests }
AISimpleImputerTest >> testFitMostFrequent [

	imputer
		useMostFrequent;
		fit: collection.

	self assert: imputer statistics equals: #( 7 2 5 6 )
]

{ #category : #tests }
AISimpleImputerTest >> testTransformAverage [

	imputer
		useAverage;
		fit: collection.

	self assert: (imputer transform: collection) equals: #( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )
]

{ #category : #tests }
AISimpleImputerTest >> testTransformConstant [

	imputer
		useConstant: 10;
		fit: collection.

	self assert: (imputer transform: collection) equals: #( #( 7 2 5 6 ) #( 7 10 5 9 ) #( 10 2 10 6 ) ).
]

{ #category : #tests }
AISimpleImputerTest >> testTransformMedian [

	imputer
		useAverage;
		fit: collection.

	self assert: (imputer transform: collection) equals: #( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )
]

{ #category : #tests }
AISimpleImputerTest >> testTransformMostFrequent [

	imputer
		useMostFrequent;
		fit: collection.

	self assert: (imputer transform: collection) equals: #( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )
]
