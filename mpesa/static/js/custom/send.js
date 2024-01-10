$(document).ready(function () {

    const csrfToken = $('meta[name=csrf-token]').attr('content');

    $.ajax({
        url: '/api/branch',
        type: 'GET',
        contentType: 'application/json',
        success: function (response) {
            var selectElement = $('#branch_id');
            response.forEach(function (branch) {
                var optionText = branch.location + ' - ' + branch.staff_name;
                var option = $('<option>').val(branch.id).text(optionText);
                selectElement.append(option);
            });
        },
        error: function (error) {
            console.error('Error:', error);
        }
    });

    $('#sending_amount').on('input',function () {
        var sendingAmount = parseFloat($('#sending_amount').val());
        function getFee(amount) {
            $.ajax({
                url: '/api/fee',
                type: 'GET',
                contentType: 'application/json',
                success: function (response) {
                    var f = 0;
                    response.forEach(function (item)
                    {
                        if (amount >= item.amount_from && amount <= item.amount_to)
                        {
                            f = item.fee;
                        }
                    });
                    var payableAmount = sendingAmount + f;
                    var fee = Math.floor(f);
                    var payableAmount = Math.floor(payableAmount);
                    $('#fee').val(fee);
                    $('#payable_amount').val(payableAmount);
                },
                error: function (error) {
                    console.log('Error:', error);
                }
            });
        }
        getFee(sendingAmount);
    });
    


    $('#transactionForm').submit(
        function (e) {
            e.preventDefault();
            alert("Sending Form submission")
            data = {
                "sender_first_name": $('#transactionForm #sender_first_name').val(),
                "sender_last_name": $('#transactionForm #sender_last_name').val(),
                "sender_middle_name": $('#transactionForm #sender_middle_name').val(),
                "sender_contact": $('#transactionForm #sender_contact').val(),
                "sender_address": $('#transactionForm #sender_address').val(),
                "receiver_first_name": $('#transactionForm #receiver_first_name').val(),
                "receiver_last_name": $('#transactionForm #receiver_last_name').val(),
                "receiver_middle_name": $('#transactionForm #receiver_middle_name').val(),
                "receiver_contact": $('#transactionForm #receiver_contact').val(),
                "receiver_address": $('#transactionForm #receiver_address').val(),
                "sending_amount": $('#transactionForm #sending_amount').val(),
                "fee": $('#transactionForm #fee').val(),
                "purpose": $('#transactionForm #purpose').val(),
                "branch_id": $('#transactionForm #branch_id').val(),
            }
            $.ajax({
                url: '/api/transaction',
                type: 'POST',
                data: JSON.stringify(data),
                contentType: 'application/json',
                headers: {
                    'X-CSRFToken': csrfToken,
                },
                success: function (response) {
                    console.log(response);
                },
                error: function (error) {
                    console.log(error);
                },
            });
        }
    );


});