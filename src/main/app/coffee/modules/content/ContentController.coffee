SkeletonApp.module 'Content', (Content, SkeletonApp, Backbone, Marionette, $, _) ->

  # Define the Router for the Content module
  class ContentRouter extends Marionette.AppRouter

    appRoutes:
      'home': 'showHome'

  # Define the Controller for the Content module
  class ContentController extends Marionette.Controller

    showHome: ->
      logger.debug "ContentController.showHome"
      homeView = new Content.HomeView
      SkeletonApp.contentRegion.show homeView


  # Create an instance
  controller = new ContentController


  # When the module is initialized...
  Content.addInitializer ->
    logger.debug "Content initializer"
    router = new ContentRouter
      controller: controller


  # Handle Application Messaging
  SkeletonApp.commands.setHandler 'content:home', ->
    SkeletonApp.navigate 'home'
    controller.showHome()
