{ #category : #baseline }
BaselineOfSandblocks >> baseline: spec [
  <baseline>

  spec for: #common do: [

    spec
      baseline: 'ActiveExpressions'
        with: [ spec repository: 'github://active-expressions/active-expressions-squeak:master/src' ];
      baseline: 'RatPack'
        with: [ spec repository: 'github://hpi-swa-teaching/RatPack2.0:develop/packages' ];
      baseline: 'QoppaS'
        with: [ spec repository: 'github://hpi-swa-lab/QoppaS/packages' ];
      baseline: 'Ohm'
        with: [ spec repository: 'github://hpi-swa/Ohm-S:master/packages' ];
      baseline: 'SimulationStudio'
        with: [
          spec
            repository: 'github://LinqLover/SimulationStudio:squeak60/packages';
            loads: #('SimulationStudio-Base' 'SimulationStudio-Sandbox') ].


    spec
      package: 'SVG-Morphic'     with: [ spec repository: 'http://www.squeaksource.com/SVGMorph' ];
      package: 'PoppyPrint-Core' with: [ spec repository: 'github://tom95/poppy-print/packages' ].


    spec
      package: 'Sandblocks-Utils';
      package: 'Sandblocks-Layout';
      package: 'Sandblocks-Morphs';
      package: 'Sandblocks-Core' with: [
        spec
          requires: #('SVG-Morphic' 'Sandblocks-Morphs' 'Sandblocks-Utils' 'Sandblocks-Layout');
          postLoadDoIt: #postLoadCore ];

      package: 'Sandblocks-Representation' with: [
        spec requires: #('Sandblocks-Core') ];

      package: 'Sandblocks-Drawing' with: [
        spec requires: #('Sandblocks-Core') ];

      package: 'Sandblocks-Explorer' with: [
        spec requires: #('Sandblocks-Core') ];

      package: 'Sandblocks-Watch' with: [
        spec requires: #('Sandblocks-Core') ];

      package: 'Sandblocks-Debugger' with: [
        spec requires: #('Sandblocks-Core') ];

      package: 'Sandblocks-Smalltalk' with: [

        spec requires: #('Sandblocks-Core' 'PoppyPrint-Core') ];

      package: 'Sandblocks-Plugin-StLivePreview' with: [
        spec requires: #('Sandblocks-Smalltalk') ];

      package: 'Sandblocks-Ohm' with: [
        spec requires: #('Sandblocks-Core' 'Sandblocks-Smalltalk' 'Ohm') ];

      package: 'Sandblocks-CustomJavascript' with: [
        spec requires: #('Sandblocks-Core' 'Sandblocks-Representation' 'Ohm') ];

      package: 'Sandblocks-Scheme' with: [
        spec requires: #('Sandblocks-Core' 'Sandblocks-Representation' 'QoppaS') ];

      package: 'Sandblocks-Compiler' with: [
        spec requires: #('Sandblocks-Core') ];

      package: 'Sandblocks-Babylonian' with: [
        spec requires: #('Sandblocks-Core' 'Sandblocks-Smalltalk') ];

      package: 'Sandblocks-ActiveExpression' with: [

        spec requires: #('Sandblocks-Core' 'ActiveExpressions') ];

      package: 'Sandblocks-RatPack' with: [

        spec requires: #('Sandblocks-Core' 'RatPack') ];

      package: 'Sandblocks-Tutorial' with: [

        spec requires: #(
          'Sandblocks-Core' 'Sandblocks-Smalltalk' 'Sandblocks-Explorer'
          'Sandblocks-Debugger' 'Sandblocks-Morphs' 'Sandblocks-Representation'
          'Sandblocks-Compiler' 'Sandblocks-Plugin-StLivePreview' 'Sandblocks-Babylonian'
          'Sandblocks-CustomJavascript' 'Sandblocks-Scheme' 'Sandblocks-Ohm'
          'Sandblocks-ActiveExpression' 'Sandblocks-RatPack') ].


    spec group: 'default' with: #(
      'Sandblocks-Utils' 'Sandblocks-Layout' 'Sandblocks-Morphs'
      'Sandblocks-Core' 'Sandblocks-Representation' 'Sandblocks-Drawing'
      'Sandblocks-Explorer' 'Sandblocks-Watch' 'Sandblocks-Debugger'
      'Sandblocks-Smalltalk' 'Sandblocks-Plugin-StLivePreview'
      'Sandblocks-Ohm' 'Sandblocks-CustomJavascript' 'Sandblocks-Scheme'
      'Sandblocks-Compiler' 'Sandblocks-Babylonian'
      'Sandblocks-ActiveExpression' 'Sandblocks-RatPack' 'Sandblocks-Tutorial') ].


  spec for: #'squeak6.x' do: [
    spec
      package: 'Sandblocks-Squeak6Fixes';
      package: 'Sandblocks-Simulation' with: [
        spec requires: #('Sandblocks-Core' 'SimulationStudio') ].

    "Make Core pull in Squeak fixes on this platform"
    (spec package: 'Sandblocks-Core') requires:
      ((spec package: 'Sandblocks-Core') requires copyWith: 'Sandblocks-Squeak6Fixes').


    spec group: 'default' with:
      (#(
        'Sandblocks-Utils' 'Sandblocks-Layout' 'Sandblocks-Morphs'
        'Sandblocks-Core' 'Sandblocks-Representation' 'Sandblocks-Drawing'
        'Sandblocks-Explorer' 'Sandblocks-Watch' 'Sandblocks-Debugger'
        'Sandblocks-Smalltalk' 'Sandblocks-Plugin-StLivePreview'
        'Sandblocks-Ohm' 'Sandblocks-CustomJavascript' 'Sandblocks-Scheme'
        'Sandblocks-Compiler' 'Sandblocks-Babylonian'
        'Sandblocks-ActiveExpression' 'Sandblocks-RatPack' 'Sandblocks-Tutorial')
        copyWithAll: #('Sandblocks-Squeak6Fixes' 'Sandblocks-Simulation')) ].
]
