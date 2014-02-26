Cell = require './cell'
CreatureDictionary = require '../creatures'

class World
  @Width: 12
  @Height: 12

  constructor: ->
    @cells = for i in [0...(World.Width * World.Height)]
      new Cell(i)
    @generation = 0

    @bornConditions = @makeBornConditions()

  start: ->
    @timer = setInterval @tick, 100

  stop: ->
    clearInterval @timer

  tick: =>
    for cell in @cells
      if cell.status == Cell.Status.None
        for cond in @bornConditions
          if cell.nutrient >= cond[1]
            cell.spawn cond[0]
            break
    @generation += 1

  affectCell: (cellIndex) ->
    targetCell = @cells[cellIndex]

    if targetCell.status == Cell.Status.Emerged
      info = CreatureDictionary[targetCell.creatureID]
      targetCell.crop()

      neighbors = @neighbors(cellIndex, info.scatter)

      for index in neighbors
        cell = @cells[index]
        cell.nutrient += Math.floor(info.nutrient / neighbors.length)

  makeBornConditions: ->
    conds = ([id, info.nutrient] for id, info of CreatureDictionary)
    conds.sort (a, b) -> b[1] - a[1]

  neighbors: (center, sizeName) ->
    neighbors = []

    switch sizeName
      when 'medium'
        neighbors = [1, 2, 3, 4, 5]

    neighbors

module.exports = World