$(document).ready(function() {
  var $comment_list = $('ul.comment_list');

  $comment_list.on('submit', 'form.edit_comment', function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: 'PUT',
      url: $target.attr('action'),
      data: $target.serialize()
    }).done(function(response) {
      $target.closest('li').html(response);
    })
  })

  //$('a.edit_comment_link').on('click', function(event) {
  $comment_list.on('click', 'a.edit_comment_link', function(event){
    event.preventDefault();
    var $target = $(event.target);

    $target.closest('.comment').children('.update_form_box').first().show();
  })


  $comment_list.on('submit', 'form.new_comment', function(event) {
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

  $comment_list.on('submit', 'form.comment_delete', function(event) {
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
