$(document).ready(function(){
  $('.nav-tabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });

  $('.dropdown-toggle').dropdown();
 
  $('#school-logo .dropdown-menu li a').on('click',function(){
    $('#school-logo .btn:first-child').text($(this).text());
    $('#school-logo .btn:first-child').val($(this).text());
  });

   $('#size .dropdown-menu li a').on('click',function(){
    $('#size .btn:first-child').text($(this).text());
    $('#size .btn:first-child').val($(this).text());
  });

  $('#quanity .dropdown-menu li a').on('click',function(){
    $('#quanity .btn:first-child').text($(this).text());
    $('#quanity .btn:first-child').val($(this).text());
  });

  $('#submit').on('click',function(){
    var schoolLogo = $('#school-logo .btn:first-child').val();
    var size = $('#size .btn:first-child').val();
    var quanity = $('#quanity .btn:first-child').val();
    console.log(schoolLogo);
    console.log(size);
    console.log(quanity);
  });
});