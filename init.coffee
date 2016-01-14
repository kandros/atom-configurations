# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"


# Import other inits
fuzzyImport = require('./init-scripts/fuzzy-import');


# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave (change) ->
#     console.log change
#   if editor.getGrammar().name is 'Null Grammar'
#     console.log(editor.getGrammar().name);
