CreatureDictionary = require '../creatures'

class Cell
  @Status:
    None: 1
    Emerged: 2

  constructor: (@index) ->
    @status = Cell.Status.None
    @nutrient = Math.floor(Math.random() * 32)

  spawn: (creatureID) ->
    @creatureID = creatureID
    @status = Cell.Status.Emerged

    info = CreatureDictionary[creatureID]
    @nutrient -= info.nutrient

  crop: ->
    @creatureID = null
    @status = Cell.Status.None

  allNutrient: ->
    nutrient = @nutrient
    nutrient += CreatureDictionary[@creatureID].nutrient if @creatureID
    nutrient

module.exports = Cell
