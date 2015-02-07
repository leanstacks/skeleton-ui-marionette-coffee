SkeletonApp.module 'Common', (Common, SkeletonApp, Backbone, Marionette, $, _) ->

  # Define the View for a Modal Dialog
  class Common.DialogView extends Backbone.Marionette.ItemView

    defaultOptions =
      title: 'Confirm'
      body: 'Click OK to confirm.'
      buttons: [
        title: 'Cancel'
        triggerName: 'cancel'
        dismiss: true
      ,
        title: 'OK'
        triggerName: 'ok'
        class: 'btn-primary'
      ]

    template: 'dialog'

    className: 'modal fade'

    ui:
      dialogButton: '.js-dialog-button'

    events:
      'click @ui.dialogButton': 'onButtonClicked'

    initialize: (opts) ->
      logger.debug "DialogView.initialize"
      @options = _.defaults {}, opts, defaultOptions

    serializeData: ->
      @options

    onShow: ->
      @$el.modal 'show'

    onHide: ->
      @$el.modal 'hide'

    onButtonClicked: (e) ->
      logger.debug "DialogView.onButtonClicked"
      e.preventDefault()
      triggerName = $(e.target).attr 'data-trigger'
      @triggerMethod triggerName
