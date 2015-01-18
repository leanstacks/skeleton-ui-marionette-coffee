describe 'Content Module Suite', ->

  describe 'Content.HomeView Suite', ->

    homeView = null

    beforeEach ->
      #jasmine.getFixtures().fixturesPath = 'base/src/test/app/templates'
      #loadFixtures 'mainfixture.html'
      homeView = new window.SkeletonApp.Content.HomeView()

    it 'has className', ->
      expect(homeView.className).toBe('container')

    it 'has template', ->
      expect(homeView.template).toBe('home')

    it 'has $el', ->
      expect(homeView.$el).toBeMatchedBy('div.container')

    it 'has rendered $el', ->
      homeView.render()
      expect(homeView.$el).toContainElement('div.row')
