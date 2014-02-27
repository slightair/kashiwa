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

    @debugCounter = new PIXI.Text(@debugCounterText(), font:'12px Arial', fill: 'white')
    @debugCounter.position.x = 400
    @stage.addChild @debugCounter

    @world.start()

  update: ->
    @debugCounter.setText @debugCounterText()
    @worldView.update()

  clickedCell: (index) ->
    @world.affectCell(index)

  debugCounterText: ->
    "gen:#{@world.generation}\nnutrients:#{@world.allNutrients()}"

module.exports = WorldScene
