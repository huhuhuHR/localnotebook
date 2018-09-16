$(function () {
    function maskShow() {
        $('#mask').show();
    }

    function maskHide() {
        $('#mask').hide();
    }

    function addNewBookShow() {
        $('#addNewBook').show();
    }

    function addNewBookHide() {
        $('#addNewBook').hide();
    }

    $('#cancelDelete').click(function () {
        maskHide();
        $('#deleteBook').hide();
        $('#currentBookId').html('');
    });
    $('#addBook').click(function () {
        maskShow();
        addNewBookShow();
    });
    $('#cancelAddBook').click(function () {
        maskHide();
        addNewBookHide();
        $(":input[name='bookName']").val('');
    });

    function toEdit(bookId) {
        var bookName = $(":input[name='bookName']").val();
        if (bookName === '' || $(":input[name='bookName']").attr('readonly') === 'readonly') {
            return;
        }

        if (bookName === '') {
            window.location.href = baseUrl + '/v1/initNoteBookList';
        }
        $(":input[name='bookName']").attr('readonly', 'readonly');
        $('#result').show();
        $.ajax({
            type: 'POST',
            url: baseUrl + '/v1/updateNoteBook',
            dataType: 'json',
            data: {
                noteBookName: bookName,
                noteBookId: bookId
            },
            success: function (data) {
                if (data && data.code === '1') {
                    setTimeout(function () {
                        $('#result').text(data.msg);
                        window.location.href = baseUrl + '/v1/initNoteBookList';
                    }, 800);
                } else {
                    $('#result').text(data ? data.msg : '修改失败');
                    window.location.href = baseUrl + '/v1/initNoteBookList';
                }
            }
        });
    }

    $('#confirmAddBook').click(function () {
        var bookId = $('#currentBookId').html();
        if (bookId !== '') {
            toEdit(bookId);
            return;
        }
        var bookName = $(":input[name='bookName']").val();
        if (bookName === '' || $(":input[name='bookName']").attr('readonly') === 'readonly') {
            return;
        }
        $(":input[name='bookName']").attr('readonly', 'readonly');
        $('#result').show();
        $.ajax({
            type: 'POST',
            url: baseUrl + '/v1/addNoteBook',
            dataType: 'json',
            data: {
                noteBookName: bookName
            },
            success: function (data) {
                if (data && data.code === '1') {
                    setTimeout(function () {
                        $('#result').text(data.msg);
                        window.location.href = baseUrl + '/v1/initNoteBookList';
                    }, 1000);
                } else {
                    $('#result').text(data ? data.msg : '新增失败');
                    $(":input[name='bookName']").attr('readonly', '');
                }
            }
        });
    });
    $('#confirmDelete').click(function () {
        $('#result').show();
        var id = $('#currentBookId').html();
        $.ajax({
            type: 'POST',
            url: baseUrl + '/v1/deleteBook',
            dataType: 'json',
            data: {
                noteBookId: id
            },
            success: function (data) {
                if (data && data.code === '1') {
                    setTimeout(function () {
                        $('#result').text(data.msg);
                        window.location.href = baseUrl + '/v1/initNoteBookList';
                    }, 800);
                } else {
                    $('#result').text(data ? data.msg : '删除失败');
                    setTimeout(function () {
                        $('#result').hide();
                    }, 800);
                }
            }
        });
    });
    $("input[name=search]").keypress(function (e) {
        var eCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
        if (eCode === 13) {
            maskShow();
            $('#result').show();
            var key = $(":input[name='search']").val();
            key === '' ? window.location.href = baseUrl + '/v1/initNoteBookList' : window.location.href = baseUrl + '/v1/initNoteBookList?noteBookName=' + key;

        }
    });
    $('#searchBook').click(function () {
        maskShow();
        $('#result').show();
        var key = $(":input[name='search']").val();
        key === '' ? window.location.href = baseUrl + '/v1/initNoteBookList' : window.location.href = baseUrl + '/v1/initNoteBookList?noteBookName=' + key;
    });
});