class App
  @Width: 512
  @Height: 384

  instance = null
  @getInstance: ->
    instance ?= new PrivateClass(@Width, @Height)

  class PrivateClass
    constructor: (@width, @height)->
      @stage = new PIXI.Stage 'black'
      @renderer = PIXI.autoDetectRenderer(@width, @height)

    attachTo: (viewElementID) ->
      $(viewElementID).append @renderer.view

    start: ->
      return unless @worldScene
      return if @timer

      @timer = setInterval =>
        @worldScene.world.tick()
      , 100

    stop: ->
      clearInterval @timer
      @timer = null

    tick: ->
      return unless @worldScene
      @worldScene.world.tick()

    started: -> !!@timer

    run: ->
      @loadSpriteSheets =>
        @worldScene = new WorldScene @stage

        @currentScene = @worldScene
        @currentScene.layout()

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

      @currentScene.update()

      @renderer.render @stage

module.exports = App

WorldScene = require './scenes/world-scene'
