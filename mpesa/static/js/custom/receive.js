$(document).ready(function() {

    const csrfToken = $('meta[name=csrf-token]').attr('content');

    $('#transactionForm').submit(function() {

        var transactionId = $('#transactionID').val();

        $.ajax({
            url: '/api/transaction-confirm/' + transactionId,
            type: 'POST',
            contentType: 'application/json',
            headers: {
                'X-CSRFToken': csrfToken,
            },
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log('Error:', error);
            }
        });
    });



});