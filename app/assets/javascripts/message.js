$(function(){
  function buildHTML(message){
    var insertImage = '';
    if (message.image.url) {
      insertImage = `<img src="${message.image.url}">`;
    }
    var html = `<div class="messages__message">
                  <div class="messages__message--upper-message">
                    <div class="message-user">${message.name}</div>
                    <div class="message-date">${message.created_at}</div>
                  </div>
                  <div class="messages__message--lower-message">
                  <p>${message.body}</p>
                  ${insertImage}
                  </div>
                </div>`;
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html)
      $('.textarea').val('')
      $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight}, 'slow');
    })
    .fail(function(){
      alert('error');
    })
  })
});
