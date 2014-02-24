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

    @generationCounter = new PIXI.Text("gen:#{@world.generation}", font:'12px Arial', fill: 'white')
    @generationCounter.position.x = 400
    @stage.addChild @generationCounter

    @world.start()

  update: ->
    @generationCounter.setText "gen:#{@world.generation}"
    @worldView.update()

  clickedCell: (index) ->
    @world.affectCell(index)

module.exports = WorldScene