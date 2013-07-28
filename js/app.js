$(document).ready(function(){
  $('.nav-tabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });

  $('.dropdown-toggle').dropdown();

 var counter = 0;
  $('#school-logo .dropdown-menu li a').on('click',function(){
    $('#school-logo .btn:first-child').text($(this).text());
    $('#school-logo .btn:first-child').val($(this).text());
    // $('#school-logo .btn:first-child').html('<span class="caret"></span>');
    counter = counter + 1;

  });

   $('#size .dropdown-menu li a').on('click',function(){
    $('#size .btn:first-child').text($(this).text());
    $('#size .btn:first-child').val($(this).text());
    counter = counter + 1;
  });

  $('#quanity .dropdown-menu li a').on('click',function(){
    $('#quanity .btn:first-child').text($(this).text());
    $('#quanity .btn:first-child').val($(this).text());
    counter = counter + 1;
    if (counter == 3) {
       $('#submit').addClass('btn btn-success');
    }
  });

  $('#submit').on('click',function(){
    var schoolLogo = $('#school-logo .btn:first-child').val();
    var size = $('#size .btn:first-child').val();
    var quanity = $('#quanity .btn:first-child').val();
    if (counter == 3) {
      $('#submit').data("logo",schoolLogo);
      $('#submit').data("size",size);
      $('#submit').data("quanity",quanity);
    }
    console.log(schoolLogo);
    console.log(size);
    console.log(quanity);
    console.log($('#submit'));
    console.log(document.getElementById('submit'));
    console.log($('#submit').data());
    console.log(counter);
   
  });
});