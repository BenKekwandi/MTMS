$(document).ready(function () {

    const csrfToken = $('meta[name=csrf-token]').attr('content');

    $('#receiveModalForm').submit(function(e){
        e.preventDefault();
        var tracking_code = $("#tracking_code").val();
        var flag = '';
        $.ajax({
            url: '/api/transaction',
            type: 'GET',
            contentType: 'application/json',
            success: function (response) {
                response.forEach(function(item){
                    console.log(tracking_code +' compared to '+item.tracking_code)
                    if(tracking_code == item.tracking_code)
                    {
                        flag = item.tracking_code;
                        console.log("Found : "+ item.tracking_code);
                        window.location.href = '/receive/'+ tracking_code;
                    }
                })
                if(flag == '')
                {
                    alert('Transaction not Found')
                    window.location.href = '/';
                }
                
            },
            
            error: function (error) {
                console.log('Error:', error);
            }
        });

    });

});