$(function () {
    $('#goBooks').click(function () {
        window.location.href = baseUrl + '/v1/initNoteBookList';
    });
    $('.toSearchNotes').click(function () {
        $('.mask-layer').show();
        $('.result').show();
        var key = $(":input[name='searchNotes']").val();
        var url = window.location.href;
        var baseUrl = url.split('&')[0];
        key === '' ? window.location.href = baseUrl : window.location.href = baseUrl + "&searchKey=" + key;
    });
    $("input[name=searchNotes]").keypress(function (e) {
        var eCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        if (eCode === 13) {
            $('.mask-layer').show();
            $('.result').show();
            var key = $(":input[name='searchNotes']").val();
            var url = window.location.href;
            var baseUrl = url.split('&')[0];
            key === '' ? window.location.href = baseUrl : window.location.href = baseUrl + "&searchKey=" + key;
        }
    });


    $('.card').click(function () {
            $('.bg-secondary').removeClass('bg-secondary');
            $(this).addClass('bg-secondary');
        }
    );
    $('#cancelDelete').click(function () {
        $('.mask-layer').hide();
        $('.deleteNotes').hide();
        $('.nbookId').html('');
        $('.noteId').html('');
    });
    $('#confirmDeleteNotes').click(function () {
        $('.result').show();
        var bookId = $('.nbookId').html();
        var noteId = $('.noteId').html();
        $.ajax({
            type: 'POST',
            url: baseUrl + '/v1/deleteNote',
            dataType: 'json',
            data: {
                noteId: noteId
            },
            success: function (data) {
                if (data && data.code === '1') {
                    setTimeout(function () {
                        window.location.href = baseUrl + '/v1/initNotes?noteBookId=' + bookId;
                    }, 800);
                }
            }
        });
    });
});