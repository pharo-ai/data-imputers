"
I am a simple imputer whose goal is to fill missing values in 2D collections.

To use me you need 3 steps. The first one is to define the value to replace the missing values with:
- `#useAverage` (Default value)
- `#useMedian`
- `#useMostFrequent`
- `#useContant:`

Then you need to use `#fit:` to allow me to compute the missing value. Once it is done, you can use `#statistics` to get those values.

Finally you can use `#transform:` to fill the missing values of a 2D collection. 

An alternative is to use `#fitAndTransform:` if you want to fill the missing values using the same collection to compute them.

Example:

```st
	| collection|
	collection := #( #( 7 2 5 6 ) #( 7 nil 5 9 ) #( 10 2 nil 6 ) ).
	
	AISimpleImputer new
		useMostFrequent;
		fit: collection;
		transform: collection ""#( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )""
```

or

```st
	AISimpleImputer new
		useMostFrequent;
		fitAndTransform: #( #( 7 2 5 6 ) #( 7 nil 5 9 ) #( 10 2 nil 6 ) ) ""#( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )""
```

I can also be used with a `DataFrame`:

```st
	AISimpleImputer new
		useMostFrequent;
		fitAndTransform: (DataFrame withRows: #( #( 7 2 5 6 ) #( 7 nil 5 9 ) #( 10 2 nil 6 ) )) 
```

It is also possible to change the missing value in case you want to replace something else than nil values:

```st
	AISimpleImputer new
		useMostFrequent;
		missingValue: false;
		fitAndTransform: #( #( 7 2 5 6 ) #( 7 false 5 9 ) #( 10 2 false 6 ) ) ""#( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )""
```

Internal Representation and Key Implementation Points.

    Instance Variables
- missingValue:				<Object> 			The missing value to replace. By default: nil
- replacementStrategy:		<aStrategy>		The replacement strategy to use to fill missing values. By default: `AIAverageImputerStrategy`
- statistics:					<aCollection>	The list of values to use to replace missing values computed after calling `#fit:`

Depending on what the user want to use to fill missing values, I use a replacement strategy that is here to compute the statistics when calling `#fit:`


"
Class {
	#name : #AISimpleImputer,
	#superclass : #Object,
	#instVars : [
		'statistics',
		'replacementStrategy',
		'missingValue'
	],
	#category : #'AI-DataImputers'
}

{ #category : #'instance creation' }
AISimpleImputer class >> average [

	^ self new
		  useAverage;
		  yourself
]

{ #category : #'instance creation' }
AISimpleImputer class >> constant: aNumber [

	^ self new
		  useConstant: aNumber;
		  yourself
]

{ #category : #'instance creation' }
AISimpleImputer class >> median [

	^ self new
		  useMedian;
		  yourself
]

{ #category : #'instance creation' }
AISimpleImputer class >> mostFrequent [

	^ self new
		  useMostFrequent;
		  yourself
]

{ #category : #private }
AISimpleImputer >> ensureIs2D: aCollection [

	self assert: aCollection isCollection description: 'Imputer can only work on 2D collections.'.
	aCollection do: [ :coll | self assert: (coll isString not and: [ coll isCollection ]) description: 'Imputer can only work on 2D collections.' ]
]

{ #category : #api }
AISimpleImputer >> fit: aCollection [

	self ensureIs2D: aCollection.
	aCollection ifEmpty: [ self error: 'Cannot fit empty collection.' ].
	self statistics: (self replacementStrategy fit: aCollection)
]

{ #category : #accessing }
AISimpleImputer >> fitAndTransform: aCollection [

	^ self
		  fit: aCollection;
		  transform: aCollection
]

{ #category : #initialization }
AISimpleImputer >> initialize [

	super initialize.
	self useAverage
]

{ #category : #accessing }
AISimpleImputer >> missingValue [

	^ missingValue
]

{ #category : #accessing }
AISimpleImputer >> missingValue: anObject [

	missingValue := anObject
]

{ #category : #accessing }
AISimpleImputer >> replacementStrategy [

	^ replacementStrategy
]

{ #category : #accessing }
AISimpleImputer >> replacementStrategy: anObject [

	replacementStrategy := anObject
]

{ #category : #accessing }
AISimpleImputer >> statistics [

	^ statistics
]

{ #category : #accessing }
AISimpleImputer >> statistics: anObject [

	statistics := anObject
]

{ #category : #api }
AISimpleImputer >> transform: aCollection [

	self ensureIs2D: aCollection.
	self statistics ifNil: [ self error: '#fit: needs to be called before transforming.' ].

	^ aCollection copyReplace: missingValue in2DCollectionBy: statistics
]

{ #category : #options }
AISimpleImputer >> useAverage [

	self replacementStrategy: (AIAverageImputerStrategy imputer: self)
]

{ #category : #options }
AISimpleImputer >> useConstant: aNumber [

	self replacementStrategy: (AIConstantImputerStrategy imputer: self constant: aNumber)
]

{ #category : #options }
AISimpleImputer >> useMedian [

	self replacementStrategy: (AIMedianImputerStrategy imputer: self)
]

{ #category : #options }
AISimpleImputer >> useMostFrequent [

	self replacementStrategy: (AIMostFrequentImputerStrategy imputer: self)
]
