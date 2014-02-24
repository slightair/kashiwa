class Cell
  @Status:
    None: 1
    Emerged: 2

  constructor: (@index) ->
    @status = Cell.Status.None
    @nutrient = Math.floor(Math.random() * 100)

  spawn: (objectIndex) ->
    @objectIndex = objectIndex
    @status = Cell.Status.Emerged
    @nutrient -= 30

  crop: ->
    @objectIndex = null
    @status = Cell.Status.None

module.exports = Cell