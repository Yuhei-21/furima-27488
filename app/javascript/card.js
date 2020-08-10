$(function(){
  let form = $("#charge-form");
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  $('.buy-red-btn').on('click', function(e){
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    let card = {
      number: $("#payment_card_no").val(),
      cvc: $("#payment_card_cvc").val(),
      exp_month: $("#payment_expiration_date_1i").val(),
      exp_year: $("#payment_expiration_date_2i").val(),
    };
    
    Payjp.createToken(card, function(status, response) {
      if (status != 200) {
        $('buy-red-btn').prop('disabled', false);
        alert("カード情報が正しくありません。");
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        let token = response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      }
    });
  })
});