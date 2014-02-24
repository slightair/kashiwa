Cell = require './cell'

class World
  @Width: 12
  @Height: 12

  constructor: ->
    @cells = for i in [0...(World.Width * World.Height)]
      new Cell(i)
    @generation = 0

  start: ->
    @timer = setInterval @tick, 100

  stop: ->
    clearInterval @timer

  tick: =>
    for cell in @cells
      if cell.status == Cell.Status.None
        if cell.nutrient >= 30
          objectIndex = Math.floor(Math.random() * 6) + 1
          cell.spawn(objectIndex)
    @generation += 1

  affectCell: (cellIndex) ->
    targetCell = @cells[cellIndex]

    targetCell.crop() if targetCell.status == Cell.Status.Emerged

module.exports = World