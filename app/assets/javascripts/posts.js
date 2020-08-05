$(function(){
  $('.price-content').on('keyup', function(){
    let price = $('input:text[name="item[price]"]').val();
    let tax = price * 0.1;
    let profit = price * 0.9;
    let num1 = Math.floor(tax);
    let num2 = Math.floor(profit);
    if (!tax)
      $('#add-tax-price').html("半角数字のみ入力可能");
    else
      $('#add-tax-price').html(num1);
      console.log(num1)
    if (!profit)
      $('#profit').html("半角数字のみ入力可能");
    else
      $('#profit').html(num2);
  })
})