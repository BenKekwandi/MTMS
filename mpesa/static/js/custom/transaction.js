$(document).ready(function() {

    const csrfToken = $('meta[name=csrf-token]').attr('content');

    var table = $('#transactionTable').DataTable({
        responsive: true,
        //scrollX: 200,
        select: {
            selector: 'td:not(:first-child)',
            style: 'os'
        },
        order: [
            [0, 'desc']
        ],
        dom: 'Bfrtip',
        buttons: [{
                extend: 'copy',
                className: 'btn'
            },
            {
                extend: 'excel',
                className: 'btn'
            },
            {
                extend: 'print',
                className: 'btn'
            }
        ],
        ajax: {
            url: '/api/transaction',
            dataType: "json",
            type: "get",

            error: function(request) {
                alert("Error " + request);
            },
            success: function(array) {
                console.log(array);
                var dataSet = [];
                for (var i = 0; i < array.length; i++) {
                    var status = ''
                    if (array[i].status == 1) {
                        status = '<span class="btn btn-success">Received<span>'
                    } else {
                        status = '<span class="btn btn-primary">Pending<span>'
                    }
                    var actions = `
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Actions
                  </button>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item bg-success text-light" href="/transaction/${array[i].id}">View</a></li>
                    <li><a class="dropdown-item bg-dark text-light" href="/transaction-update/${array[i].id}">Edit</a></li>
                    <li><a class="dropdown-item bg-danger text-light delete-btn" data-bs-toggle="modal" data-bs-target="#deleteModal" data-transaction="${array[i].id}" href="#">Delete</a></li>
                  </ul>
                    `
                    dataSet.push([
                        array[i].id,
                        array[i].date_created,
                        array[i].tracking_code,
                        array[i].sending_amount,
                        status,
                        actions
                    ]);

                }
                table.clear().rows.add(dataSet).draw();
            },
            columnDefs: [
                { targets: '_all', className: 'text-left' }
            ]
        }
    });


    $(document).on('click', '.delete-btn', function(event) {
        var transactionID = $(this).data('transaction');
        console.log('clicked', 'transaction ID: ', transactionID)
        $('#deleteModal').data('transaction_id', transactionID);
    });

    $('#deleteModal').on('shown.bs.modal', function() {
        console.log("Delete Modal")
        var transactionID = $(this).data('transaction_id');

        $('#deleteModal #deleteTransactionForm').submit(function(e) {
            $.ajax({
                url: '/api/transaction/' + transactionID,
                type: 'delete',
                contentType: 'application/json',
                headers: {
                    'X-CSRFToken': csrfToken,
                },
                success: function(response) {
                    console.log(response)
                },
                error: function(error) {
                    console.log(error);
                }
            });
        });
    });


});