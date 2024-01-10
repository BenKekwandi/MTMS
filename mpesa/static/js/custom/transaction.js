$(document).ready(function () {

    var table = $('#transactionTable').DataTable({
        responsive: true,
        //scrollX: 200,
        select: {
            selector: 'td:not(:first-child)',
            style: 'os'
        },
        order: [[0, 'desc']],
        dom: 'Bfrtip',
        buttons: [
            {
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

            error: function (request) {
                alert("Error " + request);
            },
            success: function (array) {
                console.log(array);
                var dataSet = [];
                for (var i = 0; i < array.length; i++) {
                    var status = ''
                    if(array[i].status==1){
                        status = '<span class="btn btn-success">Received<span>'
                    }
                    else{
                        status = '<span class="btn btn-primary">Pending<span>'
                    }
                    var actions =  `
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Actions
                  </button>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item bg-dark text-light" href="/transaction/${array[i].id}">View</a></li>
                    <li><a class="dropdown-item bg-danger text-light" href="#">Delete</a></li>
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


});