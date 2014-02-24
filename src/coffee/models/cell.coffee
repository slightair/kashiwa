class Cell
  @Status:
    None: 1
    Emerged: 2

  constructor: (@index) ->
    @status = Cell.Status.None

  spawn: (objectIndex) ->
    @objectIndex = objectIndex
    @status = Cell.Status.Emerged

  crop: ->
    @objectIndex = null
    @status = Cell.Status.None

module.exports = Cell