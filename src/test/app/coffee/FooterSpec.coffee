describe 'Footer Module Suite', ->

  describe 'Footer View Suite', ->

    footerView = null

    beforeEach ->
      #jasmine.getFixtures().fixturesPath = 'base/src/test/app/templates'
      #loadFixtures 'mainfixture.html'
      footerView = new window.SkeletonApp.Footer.FooterView()

    it 'has className', ->
      expect(footerView.className).toBe('container')

    it 'has template', ->
      expect(footerView.template).toBe('footer')

    it 'has $el', ->
      expect(footerView.$el).toBeMatchedBy('div.container')

    it 'has rendered $el', ->
      footerView.render()
      expect(footerView.$el).toContainElement('div.row')
