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


    $('#order_form').on('submit',function (){

    var schoolLogo = $('#school-logo .btn:first-child').val();
    var size = $('#size .btn:first-child').val();
    var quantity = $('#quantity .btn:first-child').val();
    
      $('#order_logo').val(schoolLogo);
      $('#order_size').val(size);
      $('#order_quantity').val(quantity);
      if ($('#order_logo').val() == null || $('#order_logo').val() == "") {
        alert('Please be sure to select a logo.');
        return false;
      }
      if ($('#order_size').val() == null || $('#order_size').val() == "") {
        alert('Please be sure to select a size.');
        return false;
      }
      if ($('#order_quantity').val() == null || $('#order_quantity').val() == "") {
        alert('Please be sure to select a quantity.');
        return false;
      }
      

  });



});





    // var validCheck = function() {
    //   var x = document.forms["order_form"]["order_quantity"].value;
    //   if (x == null || x== "")
    //     {
    //       alert("Order quantity must be filled out");
    //       return false;
    //     }

    //   });


