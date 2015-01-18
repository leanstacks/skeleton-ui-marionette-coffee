describe 'Header Module Suite', ->

  describe 'Header View Suite', ->

    headerView = null

    beforeEach ->
      #jasmine.getFixtures().fixturesPath = 'base/src/test/app/templates'
      #loadFixtures 'mainfixture.html'
      headerView = new window.SkeletonApp.Header.HeaderView()

    it 'has className', ->
      expect(headerView.className).toBe('container')

    it 'has template', ->
      expect(headerView.template).toBe('header')

    it 'has $el', ->
      expect(headerView.$el).toBeMatchedBy('div.container')

    it 'has rendered $el', ->
      headerView.render()
      expect(headerView.$el).toContainElement('div.row')
