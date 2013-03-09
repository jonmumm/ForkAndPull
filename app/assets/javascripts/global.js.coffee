$ ->
  new FP.Routers.Main
  Backbone.history.start
    pushState: true
    silent: true

  $(".donate a").on "click", (event) ->
    amount = $(event.currentTarget).attr "data-amount"
    event.preventDefault()

    StripeCheckout.open
      key: FP.Config.StripePublishableKey
      address: false
      amount: amount * 100
      name: "Fork & Pull"
      panelLabel: "Donate"
      image: FP.Assets.Avatar
      description: "Thank you!"
      token: (event) ->
        $("#donation_token").val event.id
        $("#donation_amount").val(amount * 100)
        $(".new_donation").submit()

  $("img").hisrc()

  setTimeout =>
    $("body").addClass "body-loaded"
  , 200
