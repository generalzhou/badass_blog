$(document).ready(function() {
  
  $('.post_form').submit( function(event) {
    event.preventDefault();
    var default_action = $(this).attr("action")
    
    $.post('/posts/validate', $(this).serialize(), function (data) {
      console.log(data)
      $('.return_message').html(data);
      if (data == 'Successfully saved!') {
        setTimeout(3000)
        $('.post > form').submit();
      }
    });

  });
});

