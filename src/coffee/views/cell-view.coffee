App = require '../app'
Cell = require '../models/cell'

class CellView extends PIXI.DisplayObjectContainer
  @Width: 32
  @Height: 32

  constructor: (@cell) ->
    super

    @worldScene = App.getInstance().currentScene
    @interactive = true

    @emerging = false

  layout: ->
    background = PIXI.Sprite.fromFrame "grass1.png"
    @addChild background

    @nutrientCounter = new PIXI.Text(@cell.nutrient, font:'12px Arial')
    @addChild @nutrientCounter

    @prevCellStatus = @cell.status

  update: ->
    @nutrientCounter.setText "#{@cell.nutrient}"

    currentStatus = @cell.status

    if @prevCellStatus == Cell.Status.None && currentStatus == Cell.Status.Emerged
      @object = PIXI.Sprite.fromFrame "mushroom#{@cell.objectIndex}.png"
      @object.anchor.x = 0.5
      @object.anchor.y = 0.5
      @object.position.x = CellView.Width / 2
      @object.position.y = CellView.Height / 2
      @object.scale.x = 0
      @object.scale.y = 0

      @addChild @object

      @emerging = true

    if @prevCellStatus == Cell.Status.Emerged && currentStatus == Cell.Status.None
      @removeChild @object
      @object = null
      @emerging = false

    if @emerging
      @object.scale.x += 0.05
      @object.scale.y += 0.05

      @emerging = false if @object.scale.x >= 1.0

    @prevCellStatus = currentStatus

  click: (interactionData) ->
    @worldScene.clickedCell(@cell.index)

module.exports = CellView