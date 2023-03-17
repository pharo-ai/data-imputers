"
I am a baseline to define the structure and dependencies of the AIDataImputers project.
"
Class {
	#name : #BaselineOfAIDataImputers,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIDataImputers
}

{ #category : #baseline }
BaselineOfAIDataImputers >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self dataFrame: spec.

		"Packages"
		spec
			package: 'AI-DataImputers';
			package: 'AI-DataImputers-Tests' with: [ spec requires: #( 'AI-DataImputers' ) ];
			package: 'AI-DataImputers-DataFrame-Tests' with: [ spec requires: #( 'AI-DataImputers-Tests' 'AIExternalDataFrame' ) ].

		"Groups"
		spec
			group: 'default' with: #( 'Core' 'Tests' );
			group: 'Core' with: #( 'AI-DataImputers' );
			group: 'DataFrame' with: #( 'AI-DataImputers-DataFrame-Tests' );
			group: 'Tests' with: #( 'AI-DataImputers' 'AI-DataImputers-Tests' ) ]
]

{ #category : #accessing }
BaselineOfAIDataImputers >> dataFrame: spec [

	spec baseline: 'AIExternalDataFrame' with: [ spec repository: 'github://pharo-ai/external-dependencies' ]
]

{ #category : #accessing }
BaselineOfAIDataImputers >> projectClass [
	^ MetacelloCypressBaselineProject
]
