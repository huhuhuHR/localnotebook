$(function () {
    $('.saveNote').click(function () {
        $('.result').show();
        $('.mask-layer').show();
        var textName = $(":input[name='textName']").val();
        var data = {
            noteBookId: bookId,
            noteName: textName,
            noteText: editor.getContent(),
            noteId: ''

        };
        if (noteId) {
            data.noteId = noteId;
        }
        if (!textName || !noteText) {
            setTimeout(function () {
                $('.result').text('笔记标题不能为空，笔记内容不能为空');
            }, 1000);
            $('.mask-layer').hide();
            $('.result').hide();
            return;
        }
        $.ajax({
            type: 'POST',
            url: baseUrl + '/noteBook/addNote',
            dataType: 'json',
            data: data,
            success: function (data) {
                if (data && data.code == 1) {
                    setTimeout(function () {
                        $('.result').text(data.msg);
                        window.location.href = baseUrl + '/noteBook/initNotes?noteBookId=' + data.data;
                    }, 2000);
                } else {
                    $('.result').text(data ? data.msg : '新增失败');
                    $(":input[name='bookName']").attr('readonly', '');
                }
            }
        });
    });
});