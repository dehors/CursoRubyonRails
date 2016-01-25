(function() {

  $(document).on('ajax:success', 'form#comments-form', function(ev, data) {
    console.log(data);
    $('#comments-box').append('<tr>' +
    	'<td>' + data.body + '</td>'+
    	 '<td>' + data.body + '</td>'+
    	 '<td>' + data.body + '</td>')+'<tr>';
    $(this).find('textarea').val('');
  });

}).call(this);
