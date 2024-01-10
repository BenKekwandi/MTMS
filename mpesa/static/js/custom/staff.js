$(document).ready(function() {

    const csrfToken = $('meta[name=csrf-token]').attr('content');

    var table = $('#staffTable').DataTable({
        responsive: true,
        // scrollX: 200,
        select: {
            selector: 'td:not(:first-child)',
            style: 'os'
        },
        order: [
            [0, 'desc']
        ],
        ajax: {
            url: '/api/staff',
            dataType: "json",
            type: "get",

            error: function(request) {
                alert("Error " + request);
            },
            success: function(array) {
                console.log(array);
                var dataSet = [];

                for (var i = 0; i < array.length; i++) {
                    var userType = '';
                    if (array[i].is_superuser == 1) {
                        userType = 'Admin'
                    } else {
                        userType = 'Staff'
                    }
                    dataSet.push([
                        array[i].id,
                        array[i].first_name,
                        array[i].last_name,
                        array[i].email,
                        userType,
                        array[i].date_joined,
                        `
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Actions
                          </button>
                          <ul class="dropdown-menu">
                          <li><a class="dropdown-item bg-dark text-light edit-btn" data-bs-toggle="modal" data-bs-target="#editModal"  data-staff=${array[i].id} href="#">Edit</a></li>
                          <li><a class="dropdown-item bg-secondary text-light delete-btn" data-bs-toggle="modal" data-bs-target="#deleteModal" data-staff=${array[i].id} href="#">Delete</a></li>
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


    $(document).on('click', '.edit-btn', function(event) {
        var staffID = $(this).data('staff');
        console.log('clicked', 'staff ID: ', staffID)
        $('#editModal').data('staff_id', staffID);
    });

    $(document).on('click', '.delete-btn', function(event) {
        var staffID = $(this).data('staff');
        console.log('clicked', 'staff ID: ', staffID)
        $('#deleteModal').data('staff_id', staffID);
    });

    $('#deleteModal').on('shown.bs.modal', function() {
        console.log("Delete Modal")
        var staffID = $(this).data('staff_id');

        $('#deleteModal #deleteStaffForm').submit(function(e) {
            $.ajax({
                url: '/api/staff/' + staffID,
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

    $('#editModal').on('shown.bs.modal', function() {
        console.log("Edit Modal")
        var staffID = $(this).data('staff_id');
        $.ajax({
            url: '/api/staff/' + staffID,
            type: 'GET',
            dataType: 'json',
            success: function(staffData) {
                console.log(staffData)
                $('#editModal #first_name').val(staffData.first_name);
                $('#editModal #last_name').val(staffData.last_name);
                $('#editModal #email').val(staffData.email);
                $('#editModal #username').val(staffData.username);
                $('#editModal #password').val('');
            },
            error: function(error) {
                console.log(error);
            }
        });
        $('#editModal #editStaffForm').submit(function(e) {
            data = {
                'first_name': $('#editModal #first_name').val(),
                'last_name': $('#editModal #last_name').val(),
                'email': $('#editModal #email').val(),
                'username': $('#editModal #username').val(),
                'password': $('#editModal #password').val()
            }
            $.ajax({
                url: '/api/staff/' + staffID,
                type: 'put',
                data: JSON.stringify(data),
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




    $('#createStaffForm').submit(
        function(e) {
            data = {
                "first_name": $('#createStaffForm #first_name').val(),
                "last_name": $('#createStaffForm #last_name').val(),
                "email": $('#createStaffForm #email').val(),
                "username": $('#createStaffForm #username').val(),
                "password": $('#createStaffForm #password').val(),
            }
            $.ajax({
                url: '/api/staff',
                type: 'POST',
                data: JSON.stringify(data),
                contentType: 'application/json',
                headers: {
                    'X-CSRFToken': csrfToken,
                },
                success: function(response) {
                    console.log(response);
                    location.reload();
                },
                error: function(error) {
                    console.log(error);
                },
            });
        }
    );


});