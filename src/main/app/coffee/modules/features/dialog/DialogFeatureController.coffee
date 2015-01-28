SkeletonApp.module 'Feature.Dialog', (Dialog, SkeletonApp, Backbone, Marionette, $, _) ->

  # Define the Controller for the Content module
  class Dialog.Controller extends Marionette.Controller

    show: ->
      logger.debug "Dialog.Controller.show"
      view = new Dialog.FeatureView
      
      view.on 'dialog:show', ->
        dialogView = new SkeletonApp.Common.DialogView
          title: 'Prompt'

        dialogView.on 'ok', ->
          logger.debug "Handling 'ok' dialog event"
          dialogView.triggerMethod 'hide'
          # Execute 'OK' logic

        dialogView.on 'cancel', ->
          logger.debug "Handling 'cancel' dialog event"
          dialogView.triggerMethod 'hide'
          # Execute 'Cancel' logic, if any

        SkeletonApp.dialogRegion.show dialogView

      SkeletonApp.contentRegion.show view
