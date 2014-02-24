App = require '../app'
World = require '../models/world'
WorldView = require '../views/world-view'

class WorldScene
  constructor: (@stage) ->
    @world = new World()

  layout: ->
    @worldView = new WorldView @world
    @worldView.layout()
    @stage.addChild @worldView

    @world.start()

  update: ->
    @worldView.update()

  clickedCell: (index) ->
    @world.affectCell(index)

module.exports = WorldScene