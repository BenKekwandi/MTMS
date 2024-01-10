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
                        `
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Actions
                      </button>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item bg-dark text-light edit-btn" data-bs-toggle="modal" data-bs-target="#editModal"  data-branch=${array[i].id} href="#">Edit</a></li>
                        <li><a class="dropdown-item bg-secondary text-light delete-btn" data-bs-toggle="modal" data-bs-target="#deleteModal" data-branch=${array[i].id} href="#">Delete</a></li>
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
        var branchID =  $(this).data('branch');
        console.log('clicked','branch ID: ',branchID)
        $('#editModal').data('branch_id', branchID);
    });

    $(document).on('click', '.delete-btn', function (event) {
        var branchID =  $(this).data('branch');
        console.log('clicked','branch ID: ',branchID)
        $('#deleteModal').data('branch_id', branchID);
    });

    $('#deleteModal').on('shown.bs.modal', function () {
        console.log("Delete Modal")
        var branchID =  $(this).data('branch_id');

        $('#deleteModal #deleteBranchForm').submit(function(e){
            $.ajax({
                url: '/api/branch/' + branchID,
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
        var branchID =  $(this).data('branch_id');
        $.ajax({
            url: '/api/branch/' + branchID,
            type: 'GET',
            dataType: 'json',
            success: function (branchData) {
                console.log(branchData)
                $('#editModal #location').val(branchData.location);
                $('#editModal #staff_name').val(branchData.staff_name);
            },
            error: function (error) {
                console.log(error);
            }
        });
        $('#editModal #editBranchForm').submit(function(e){
            data = {
                'location':$('#editModal #location').val(),
                'staff_name': $('#editModal #staff_name').val()
            }
            $.ajax({
                url: '/api/branch/' + branchID,
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