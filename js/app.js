$(document).ready(function(){
  $('.nav-tabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });

  $('.dropdown-toggle').dropdown();

<<<<<<< HEAD
 var counter = 0;
  $('#school-logo .dropdown-menu li a').on('click',function (e){
    e.preventDefault();
=======
  $('#school-logo .dropdown-menu li a').on('click',function(){
>>>>>>> 0779093bbe0cabe2d280bcda6f2e73471397b198
    $('#school-logo .btn:first-child').text($(this).text());
    $('#school-logo .btn:first-child').val($(this).text());
    counter++;
  });

   $('#size .dropdown-menu li a').on('click',function (e){
    e.preventDefault();
    $('#size .btn:first-child').text($(this).text());
    $('#size .btn:first-child').val($(this).text());
    counter++;
  });

  $('#quanity .dropdown-menu li a').on('click',function (e){
    e.preventDefault();
    $('#quanity .btn:first-child').text($(this).text());
    $('#quanity .btn:first-child').val($(this).text());
    counter++;
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
    window.location.href ="/order_review/" + schoolLogo + "/" + size;
    console.log(schoolLogo);
    console.log(size);
    console.log(quanity);
    console.log($('#submit'));
    console.log(document.getElementById('submit'));
    console.log($('#submit').data());
    console.log(counter);
  });
<<<<<<< HEAD
  
=======

  // $(function(){
  //   $("#submit").modal();
  // });

>>>>>>> 0779093bbe0cabe2d280bcda6f2e73471397b198
});