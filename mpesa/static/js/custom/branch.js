$(document).ready(function () {

    const csrfToken = $('meta[name=csrf-token]').attr('content');

    var table = $('#branchesTable').DataTable({
        responsive: true,
        //scrollX: 200,
        select: {
            selector: 'td:not(:first-child)',
            style: 'os'
        },
        order: [[0, 'desc']],
        ajax: {
            url: '/api/branch',
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
                        array[i].location,
                        array[i].staff_name,
                        array[i].status,
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


    $('#createBranchForm').submit(
        function(e){
            data = {
                "location":$('#createBranchForm #location').val(),
                "staff_name": $('#createBranchForm #staff_name').val(),
            }
            $.ajax({
                url: '/api/branch',
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