# Data Imputers

[![CI](https://github.com/pharo-ai/data-imputers/actions/workflows/ci.yml/badge.svg)](https://github.com/pharo-ai/data-imputers/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/data-imputers/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/data-imputers?branch=master)
[![Pharo version](https://img.shields.io/badge/Pharo-9-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PharoAI/data-imputers/master/LICENSE)

This is a Pharo library for transforming data to manage missing values.

## How to install it?

To install the project, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'AIDataImputers';
  repository: 'github://pharo-ai/data-imputers/src';
  load.
```

## How to depend on it?

If you want to add a dependency on this project to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'AIDataImputers'
  with: [ spec repository: 'github://pharo-ai/data-imputers/src' ].
```

If you are new to baselines and Metacello, check out this wonderful [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## Quick Start

I can be used to fill the missing values of a collection like this:

```st
| collection|
collection := #( #( 7 2 5 6 ) #( 7 nil 5 9 ) #( 10 2 nil 6 ) ).
	
AISimpleImputer new
	useMostFrequent;
	fit: collection;
	transform: collection "#( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )"
```

I can also be used to fill missing values of a [`DataFrame`](https://github.com/PolyMathOrg/DataFrame):

```st
AISimpleImputer mostFrequent fitAndTransform: (DataFrame withRows: #( #( 7 2 5 6 ) #( 7 nil 5 9 ) #( 10 2 nil 6 ) )) 
```

## Simple Imputer

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
	statistics; "This methods allows to get the replacement values once the imputer is fitted. In this case => #( 7 2 5 6 )"
	transform: collection "#( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )"
```

or

```st
AISimpleImputer new
	useMostFrequent;
	fitAndTransform: #( #( 7 2 5 6 ) #( 7 nil 5 9 ) #( 10 2 nil 6 ) ) "#( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )"
```

I can also be used with a [`DataFrame`](https://github.com/PolyMathOrg/DataFrame):

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
	fitAndTransform: #( #( 7 2 5 6 ) #( 7 false 5 9 ) #( 10 2 false 6 ) ) "#( #( 7 2 5 6 ) #( 7 2 5 9 ) #( 10 2 5 6 ) )"
```
