$(document).ready(function () {

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
                        <li><a class="dropdown-item bg-dark text-light" data-bs-toggle="modal" data-bs-target="#editModal" href="#">Edit</a></li>
                        <li><a class="dropdown-item bg-secondary text-light" href="#">Delete</a></li>
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


});