$(document).ready(function() {
  $('form.new_comment').on('submit', function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $target.children('input[type=submit]').val("Submitting...");

    $.ajax({
      type: 'POST',
      url: $target.attr('action'),
      data: $target.serialize()
    }).done(function (response) {
      $target.closest('.article').children('.comment_list').first().append('<li>' + response + '</li>')
      $target[0].reset();
      $target.children('input[type=submit]').val("Submit");

    })
  })

  $('form.comment_delete').on('submit', function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: 'DELETE',
      url: $target.attr('action')
    }).done(function(response) {
      $target.closest('.comment').remove()
    })
  });
});
