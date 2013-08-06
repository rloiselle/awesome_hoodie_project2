$(document).ready(function(){
  $('.nav-tabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });

  $('.dropdown-toggle').dropdown();

 var counter = 0;
  $('#school-logo .dropdown-menu li a').on('click',function (e){
    $('#school-logo .btn:first-child').text($(this).text());
    $('#school-logo .btn:first-child').val($(this).text());
    counter++;
    e.preventDefault();
  });

   $('#size .dropdown-menu li a').on('click',function (e){
    $('#size .btn:first-child').text($(this).text());
    $('#size .btn:first-child').val($(this).text());
    counter++;
    e.preventDefault();
  });

  $('#quantity .dropdown-menu li a').on('click',function (e){
    $('#quantity .btn:first-child').text($(this).text());
    $('#quantity .btn:first-child').val($(this).text());
    counter++;
    e.preventDefault();
    if (counter == 3) {
       $('#submit').addClass('btn btn-success');
    }
  });

  $('#submit').on('click',function (e){
    var schoolLogo = $('#school-logo .btn:first-child').val();
    var size = $('#size .btn:first-child').val();
    var quantity = $('#quantity .btn:first-child').val();
    var price = 25;
    var subtotal = (price * quantity);
    var date = new Date();
    var style = "Bella+Canvas (c3939) Unisex Triblend Lightweight Hoodie";
    if (counter == 3) {
      $('#submit').data("logo",schoolLogo);
      $('#submit').data("size",size);
      $('#submit').data("quantity",quantity);
    }
    window.location.href ="/order_review/" + schoolLogo + "/" + size + "/" + quantity + "/" + subtotal + "/" + date + "/" + style;
    e.preventDefault();

    console.log(schoolLogo);
    console.log(size);
    console.log(quantity);
    console.log($('#submit'));
    console.log(document.getElementById('submit'));
    console.log($('#submit').data());
    console.log(counter);
  });

});

// var brandName = function(){
//   if (schoolLogo == "Portland Code School") {
//     return "Bella+Canvas (c3939) Unisex Triblend Lightweight Hoodie";
//   }
// };




