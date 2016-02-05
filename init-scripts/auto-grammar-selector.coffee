detect = require 'language-detect'

atom.workspace.observeTextEditors (editor) ->
  if editor.getGrammar().name is 'Null Grammar'
    # console.log(editor.getGrammar().name);
    disposableInsertText = editor.onDidInsertText (change) ->
      console.log detect.classify change.text
    disposableGrammarChange = editor.onDidChangeGrammar () ->
      console.log editor.getGrammar().name
      disposableInsertText.dispose()
