World = require './world'

class App
  constructor: (viewElementID, @width, @height) ->
    @stage = new PIXI.Stage 'black'
    @renderer = PIXI.autoDetectRenderer(@width, @height)
    $(viewElementID).append @renderer.view

  run: ->
    @world = new World(@width, @height)
    @stage.addChild @world

    requestAnimationFrame @animate

  animate: =>
    requestAnimationFrame @animate
    @world.update()
    @renderer.render @stage

module.exports = App