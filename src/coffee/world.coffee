Cell = require './cell'

class World extends PIXI.DisplayObjectContainer
  constructor: (@width, @height) ->
    super

    cellSize = 32
    numLineCells = 12
    numLines = 12

    @cells = for i in [0...(numLineCells * numLines)]
      cell = new Cell(cellSize, cellSize)
      cell.position.x = cellSize * (i % numLineCells)
      cell.position.y = cellSize * Math.floor(i / numLineCells)
      cell

    @addChild cell for cell in @cells

  update: ->
    cell.update() for cell in @cells

module.exports = World