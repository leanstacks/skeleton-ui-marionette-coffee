SkeletonApp.module 'Feature.Dialog', (Dialog, SkeletonApp, Backbone, Marionette, $, _) ->

  class Dialog.FeatureView extends Backbone.Marionette.ItemView

    template: 'featuredialog'

    className: 'container'

    ui:
      dialogButton: '.js-dialog'
      customDialogButton: '.js-dialog-alt'

    triggers:
      'click @ui.dialogButton': 'dialog:show'
      'click @ui.customDialogButton': 'dialog:custom:show'
