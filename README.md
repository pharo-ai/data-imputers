# Data Imputers

[![CI](https://github.com/pharo-ai/data-imputers/actions/workflows/ci.yml/badge.svg)](https://github.com/pharo-ai/data-imputers/actions/workflows/ci.yml)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PharoAI/data-imputers/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)


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
  baseline: 'AIDataImputerss'
  with: [ spec repository: 'github://pharo-ai/data-imputers/src' ].
```

If you are new to baselines and Metacello, check out this wonderful [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## Quick Start

TODO

## Simple Imputer

TODO