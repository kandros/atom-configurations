atom.workspace.observeTextEditors (editor) ->
  if editor.getGrammar().name is 'Null Grammar'
    # console.log(editor.getGrammar().name);
    disposableInsertText = editor.onDidInsertText (change) ->
      console.log change
    disposableGrammarChange = editor.onDidChangeGrammar () ->
      console.log editor.getGrammar().name
      disposableInsertText.dispose()
