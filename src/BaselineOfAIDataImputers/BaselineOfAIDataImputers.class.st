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
	spec for: #common do: [ "Packages"
		spec
			package: 'AI-DataImputers';
			package: 'AI-DataImputers-Tests' with: [ spec requires: #( 'AI-DataImputers' ) ].

		"Groups"
		spec
			group: 'Core' with: #( 'AI-DataImputers' );
			group: 'Tests' with: #( 'AI-DataImputers-Tests' ) ]
]

{ #category : #accessing }
BaselineOfAIDataImputers >> projectClass [
	^ MetacelloCypressBaselineProject
]
