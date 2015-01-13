SkeletonApp.module 'Header', (Header, SkeletonApp, Backbone, Marionette, $, _) ->

  # Define the Controller for the Header module
  class HeaderController extends Marionette.Controller

    show: ->
      logger.debug "HeaderController.show"
      headerView = new Header.HeaderView()
      SkeletonApp.headerRegion.show headerView


  # Create an instance
  controller = new HeaderController()


  # When the module is initialized...
  Header.addInitializer ->
    logger.debug "Header initializer"
    controller.show()
