SkeletonApp.module 'Header', (Header, SkeletonApp, Backbone, Marionette, $, _) ->

  class Header.HeaderView extends Backbone.Marionette.ItemView

    template: 'header'

    className: 'container'
