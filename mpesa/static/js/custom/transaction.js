$(document).ready(function () {

    var table = $('#transactionTable').DataTable({
        responsive: true,
        //scrollX: 200,
        select: {
            selector: 'td:not(:first-child)',
            style: 'os'
        },
        order: [[0, 'desc']],
        ajax: {
            url: '/api/transaction',
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
                        array[i].tracking_code,
                        array[i].branch_id,
                        array[i].sending_amount,
                        array[i].fee,
                        array[i].purpose,
                        array[i].user_id,
                        array[i].status,
                        array[i].date_created,
                        'Actions'
                    ]);

                }
                table.clear().rows.add(dataSet).draw();
            },
            columnDefs: [
                { targets: '_all', className: 'text-left' }
            ]
        }
    });


});