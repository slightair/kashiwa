World = require '../models/world'
CellView = require './cell-view'

class WorldView extends PIXI.DisplayObjectContainer
  constructor: (@world) ->
    super

  layout: ->
    @cellViews = for cell, index in @world.cells
      cellView = new CellView(cell)
      cellView.position.x = CellView.Width * (index % World.Width)
      cellView.position.y = CellView.Height * Math.floor(index / World.Height)
      cellView.layout()

      @addChild cellView

      cellView

  update: ->
    cellView.update() for cellView in @cellViews

module.exports = WorldView