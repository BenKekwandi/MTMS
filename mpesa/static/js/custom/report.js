$(document).ready(function() {

    var table = $('#reportTable').DataTable({
        responsive: true,
        //scrollX: 200,
        select: {
            selector: 'td:not(:first-child)',
            style: 'os'
        },
        order: [
            [0, 'desc']
        ],
        dom: '<"top"fB>rt<"bottom"lip>',
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
            url: '/api/report',
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
                    var transactionInfo = `<div>
                    <span style="font-weight:bolder">Processed By</span> : ${array[i].operator},
                    </div>
                    <div>
                    <span style="font-weight:bolder">Processed At</span> : ${array[i].branch},
                    </div>
                    `
                    if (array[i].status == 1) {
                        transactionInfo += `<div>
                        <span style="font-weight:bolder">Received At</span> : ${array[i].received_branch},
                        </div>
                        <div>
                        <span style="font-weight:bolder">Processed(R) By</span> : ${array[i].received_user}
                        </div>`
                    }

                    transactionInfo += `<div>
                    Status:${status}
                    </div>`

                    var receiver = array[i].infos['receiver_first_name'] + ' ' + array[i].infos['receiver_last_name']
                    var sender = array[i].infos['sender_first_name'] + ' ' + array[i].infos['sender_last_name']
                    var client = `
                    <div><span style="font-weight:bolder">Sender</span> : ${sender},</div>
                    <div><span style="font-weight:bolder">Receiver</span> : ${receiver}</div>
                    `
                    dataSet.push([
                        array[i].id,
                        array[i].date_created,
                        array[i].tracking_code,
                        client,
                        transactionInfo,
                        array[i].sending_amount
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