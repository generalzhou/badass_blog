$(document).ready(function() {
  
  $('.post > form').submit( function(event) {
    event.preventDefault();
    var default_action = $(this).attr("action")
    
    $.post('/posts/validate', $(this).serialize(), function (data) {
      console.log(data)
      $('.return_message').html(data);
    });
  });
});
