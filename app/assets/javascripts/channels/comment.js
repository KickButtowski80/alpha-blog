App.comment = App.cable.subscriptions.create("CommentChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    // alert("I am here");
     return $('#comments').append(
    "<div class='well'>" +           
      data['comment'] + " by " + data['commenter'] +
    "</div>"); 
  }
});