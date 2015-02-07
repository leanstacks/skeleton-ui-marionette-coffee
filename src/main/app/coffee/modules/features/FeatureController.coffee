SkeletonApp.module 'Feature', (Feature, SkeletonApp, Backbone, Marionette, $, _) ->

  # Define the Router for the Feature module
  class FeatureRouter extends Marionette.AppRouter

    appRoutes:
      'features/dialog': 'showDialogFeature'

  # Define the Controller for the Feature module
  class FeatureController extends Marionette.Controller

    showDialogFeature: ->
      logger.debug "FeatureController.showDialogFeature"
      controller = new Feature.Dialog.Controller
      controller.show()


  # Create an instance
  controller = new FeatureController


  # When the module is initialized...
  Feature.addInitializer ->
    logger.debug "Content initializer"
    router = new FeatureRouter
      controller: controller


  # Handle Application Messaging
  SkeletonApp.commands.setHandler 'feature:dialog:show', ->
    SkeletonApp.navigate 'features/dialog'
    controller.showDialogFeature()
