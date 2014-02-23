World = require './world'

class App
  constructor: (viewElementID, @width, @height) ->
    @stage = new PIXI.Stage 'black'
    @renderer = PIXI.autoDetectRenderer(@width, @height)
    $(viewElementID).append @renderer.view

  run: ->
    @loadSpriteSheets =>
      @world = new World(@width, @height)
      @stage.addChild @world

      requestAnimationFrame @animate

  loadSpriteSheets: (onComplete) ->
    assets = [
      "resources/mapchip.json",
      "resources/mushroom.json"
    ]
    loader = new PIXI.AssetLoader(assets)
    loader.onComplete = onComplete
    loader.load()

  animate: =>
    requestAnimationFrame @animate
    @world.update()
    @renderer.render @stage

module.exports = App