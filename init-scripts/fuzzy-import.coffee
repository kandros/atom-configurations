atom.commands.add '.fuzzy-finder', 'custom:fuzzy-finder-import', (e) ->

  # utilities
  { relative, basename, dirname } = require 'path'

  getSelectedFilePathFromFuzzyFinderAndCloseIt = ->

    # weird hack to acquire space-pen instance — suggestions welcome
    { $ } = require 'space-pen'

    # obtain the FuzzyFinderView instance
    view = $(e.target).closest('.fuzzy-finder').view()

    # obtain the selected file path, and close the fuzzy finder
    { filePath } = view.getSelectedItem()
    view.cancel()

    filePath

  generateImportCode = (sourcePath, destinationPath) ->

    # handle special case for index file
    if basename(destinationPath).match(/^index\./)
      destinationPath = dirname(destinationPath)

    # figure out the relative path to that file
    relativePath = relative(dirname(sourcePath), destinationPath)
    relativePath = relativePath.replace(/^([^\.])/, './$1')
    relativePath = relativePath.replace(/\.jsx?$/, '')

    # figure out the variable name
    identifierName = basename(destinationPath).replace(/\..+/, '')

    # return the generated code
    "import #{identifierName} from '#{relativePath}';\n"

  do ->
    destinationPath = getSelectedFilePathFromFuzzyFinderAndCloseIt()
    editor = atom.workspace.getActiveTextEditor()
    sourcePath = editor.getPath()
    code = generateImportCode(sourcePath, destinationPath)
    editor.insertText code
