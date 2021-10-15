describe('Homepage rendering', () => {
  beforeEach(() => {
    cy.visit("/")
  });

  it("Footer contains promo", () => {
    cy.get('footer').contains("OliveTin")
  })

  it('Default buttons are rendered', () => {
    cy.get("button").should('have.length', 3)
  })
});


