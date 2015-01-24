# Customize the Renderer to use Namespacing
Backbone.Marionette.Renderer.render = (template, data) ->
  SkeletonTemplates[template](data)


# Create the Application
window.SkeletonApp = new Backbone.Marionette.Application


# Navigate to a route
SkeletonApp.navigate = (route, options) ->
  logger.debug "SkeletonApp.navigate route: #{ route }"
  options || ( options = {} )
  Backbone.history.navigate route, options
  if not options.trigger
    SkeletonApp.trackPage()


# Retrieve the current route
SkeletonApp.getCurrentRoute = ->
  Backbone.history.fragment


# Handle Backbone History 'route' Events
Backbone.history.on 'route', (router, route, params) ->
  logger.debug "Handling Backbone.history 'route' event"
  SkeletonApp.trackPage()


# Send Page Tracking Data to Google Analytics
# https://developers.google.com/analytics/devguides/collection/analyticsjs/pages
SkeletonApp.trackPage = ->
  logger.debug "SkeletonApp.trackPage"
  if ga?
    page = Backbone.history.root + Backbone.history.fragment
    logger.debug "send pageview #{ page }"
    ga 'send', 'pageview', page


# Create the top-level Regions
SkeletonApp.addRegions
  headerRegion  : '#header-region'
  contentRegion : '#content-region'
  dialogRegion  : '#dialog-region'
  footerRegion  : '#footer-region'


# Application start Callback Function
SkeletonApp.on 'start', (options) ->
  # Initialize the Router
  logger.debug "Backbone.history.start"
  Backbone.history.start()

  # Launch the Default View
  if SkeletonApp.getCurrentRoute() is ''
    SkeletonApp.execute 'content:home'


# Start the Application
$ ->
  # Configure log4javascript Library
  window.logger = log4javascript.getLogger()
  consoleAppender = new log4javascript.BrowserConsoleAppender()
  consoleAppender.setLayout new log4javascript.PatternLayout '%d{HH:mm:ss} %-5p - %m'
  window.logger.addAppender consoleAppender

  # Start Marionette Application
  logger.debug "SkeletonApp.start"
  SkeletonApp.start()
