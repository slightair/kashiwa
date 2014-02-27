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
    switch sizeName
      when 'medium'
        @mediumNeighbors center
      else
        []

  mediumNeighbors: (center) ->
    if center == 0
      [center + 1, center + World.Width]
    else if center == World.Width - 1
      [center - 1, center + World.Width]
    else if center == World.Width * (World.Height - 1)
      [center - World.Width, center + 1]
    else if center == World.Width * World.Height - 1
      [center - World.Width, center - 1]
    else if center < World.Width
      [center - 1, center + 1, center + World.Width]
    else if center > World.Width * (World.Height - 1)
      [center - 1, center + 1, center - World.Width]
    else if center % World.Width == 0
      [center - World.Width, center + 1, center + World.Width]
    else if center % World.Width == (World.Width - 1)
      [center - World.Width, center - 1, center + World.Width]
    else
      [center - World.Width, center + 1, center + World.Width, center - 1]

module.exports = World
