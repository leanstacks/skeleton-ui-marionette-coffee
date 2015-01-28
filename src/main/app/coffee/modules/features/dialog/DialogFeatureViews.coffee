SkeletonApp.module 'Feature.Dialog', (Dialog, SkeletonApp, Backbone, Marionette, $, _) ->

  class Dialog.FeatureView extends Backbone.Marionette.ItemView

    template: 'featuredialog'

    className: 'container'

    ui:
      dialogButton: '.js-dialog'

    triggers:
      'click @ui.dialogButton': 'dialog:show'
