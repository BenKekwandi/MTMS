$(document).ready(function () {

    const csrfToken = $('meta[name=csrf-token]').attr('content');

    var table = $('#feesTable').DataTable({
        responsive: true,
        //scrollX: 200,
        select: {
            selector: 'td:not(:first-child)',
            style: 'os'
        },
        order: [[0, 'desc']],
        ajax: {
            url: '/api/fee',
            dataType: "json",
            type: "get",

            error: function (request) {
                alert("Error " + request);
            },
            success: function (array) {
                console.log(array);
                var dataSet = [];
                for (var i = 0; i < array.length; i++) {
                    dataSet.push([
                    array[i].id,
                        array[i].amount_from,
                        array[i].amount_to,
                        array[i].fee,
                        `
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Actions
                      </button>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item bg-dark text-light edit-btn" data-bs-toggle="modal" data-bs-target="#editModal" data-fee="${array[i].id}" href="#">Edit</a></li>
                        <li><a class="dropdown-item bg-secondary text-light delete-btn" data-bs-toggle="modal" data-bs-target="#deleteModal" data-fee="${array[i].id}" href="#">Delete</a></li>
                      </ul>
                        `
                    ]);

                }
                table.clear().rows.add(dataSet).draw();
            },
            columnDefs: [
                { targets: '_all', className: 'text-left' }
            ]
        }
    });

    $(document).on('click', '.edit-btn', function (event) {
        var feeID =  $(this).data('fee');
        console.log('clicked','fee ID: ',feeID)
        $('#editModal').data('fee_id', feeID);
    });

    $(document).on('click', '.delete-btn', function (event) {
        var feeID =  $(this).data('fee');
        console.log('clicked','fee ID: ',feeID)
        $('#deleteModal').data('fee_id', feeID);
    });

    $('#deleteModal').on('shown.bs.modal', function () {
        console.log("Delete Modal")
        var feeID =  $(this).data('fee_id');

        $('#deleteModal #deleteFeeForm').submit(function(e){
            $.ajax({
                url: '/api/fee/' + feeID,
                type: 'delete',
                contentType: 'application/json',
                headers: {
                    'X-CSRFToken': csrfToken,
                },
                success: function (response) {
                    console.log(response)
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    });


    $('#editModal').on('shown.bs.modal', function () {
        console.log("Edit Modal")
        var feeID =  $(this).data('fee_id');
        $.ajax({
            url: '/api/fee/' + feeID,
            type: 'GET',
            dataType: 'json',
            success: function (feeData) {
                console.log(feeData)
                $('#editModal #amount_from').val(feeData.amount_from);
                $('#editModal #amount_to').val(feeData.amount_to);
                $('#editModal #fee').val(feeData.fee);
            },
            error: function (error) {
                console.log(error);
            }
        });
        $('#editModal #editFeeForm').submit(function(e){
            data = {
                'amount_from':$('#editModal #amount_from').val(),
                'amount_to': $('#editModal #amount_to').val(),
                'fee': $('#editModal #fee').val()
            }
            $.ajax({
                url: '/api/fee/' + feeID,
                type: 'put',
                data: JSON.stringify(data),
                contentType: 'application/json',
                headers: {
                    'X-CSRFToken': csrfToken,
                },
                success: function (response) {
                    console.log(response)
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    });



    $('#createFeeForm').submit(
        function(e){
            data = {
                "amount_from":$('#createFeeForm #amount_from').val(),
                "amount_to": $('#createFeeForm #amount_to').val(),
                "fee": $('#createFeeForm #fee').val(),
            }
            $.ajax({
                url: '/api/fee',
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