$(document).ready(function() {

    const csrfToken = $('meta[name=csrf-token]').attr('content');

    $.ajax({
        url: '/api/branch',
        type: 'GET',
        contentType: 'application/json',
        success: function(response) {
            var selectElement = $('#received_branch');
            response.forEach(function(branch) {
                var optionText = branch.location + ' - ' + branch.staff_name;
                var option = $('<option>').val(branch.id).text(optionText);
                selectElement.append(option);
            });
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });

    $('#transactionForm').submit(function() {

    });





});