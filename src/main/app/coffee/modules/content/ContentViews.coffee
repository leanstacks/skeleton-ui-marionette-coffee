SkeletonApp.module 'Content', (Content, SkeletonApp, Backbone, Marionette, $, _) ->

  class Content.HomeView extends Backbone.Marionette.ItemView

    template: 'home'

    className: 'container'
