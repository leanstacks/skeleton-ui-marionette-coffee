SkeletonApp.module 'Feature.Dialog', (Dialog, SkeletonApp, Backbone, Marionette, $, _) ->

  # Define the Controller for the Content module
  class Dialog.Controller extends Marionette.Controller

    show: ->
      logger.debug "Dialog.Controller.show"
      view = new Dialog.FeatureView

      view.on 'dialog:show', ->
        dialogView = new SkeletonApp.Common.DialogView

        dialogView.on 'ok', ->
          logger.debug "Handling 'ok' dialog event"
          dialogView.triggerMethod 'hide'
          # Execute 'OK' logic

        dialogView.on 'cancel', ->
          logger.debug "Handling 'cancel' dialog event"
          dialogView.triggerMethod 'hide'
          # Execute 'Cancel' logic, if any

        SkeletonApp.dialogRegion.show dialogView

      view.on 'dialog:custom:show', ->
        dialogView = new SkeletonApp.Common.DialogView
          title: 'Terms and Conditions'
          body: 'Click ACCEPT to accept the terms and conditions.'
          buttons: [
            title: 'Cancel'
            triggerName: 'cancel'
            dismiss: true
          ,
            title: 'Accept'
            triggerName: 'accept'
            class: 'btn-success'
          ]

        dialogView.on 'accept', ->
          logger.debug "Handling 'accept' dialog event"
          dialogView.triggerMethod 'hide'
          # Execute 'Accept' logic

        dialogView.on 'cancel', ->
          logger.debug "Handling 'cancel' dialog event"
          dialogView.triggerMethod 'hide'
          # Execute 'Cancel' logic, if any

        SkeletonApp.dialogRegion.show dialogView

      SkeletonApp.contentRegion.show view
