{WorkspaceView} = require 'atom'
UpdatePackageDependencies = require '../lib/update-package-dependencies'

describe "Update Package Dependencies", ->
  mainModule = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    {mainModule} = atom.packages.activatePackage('update-package-dependencies', immediate: true)

  it "updates package dependencies", ->
    spyOn(mainModule, 'update')
    atom.workspaceView.trigger "update-package-dependencies:update"
    expect(mainModule.update).toHaveBeenCalled()
