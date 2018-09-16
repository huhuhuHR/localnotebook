<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/bootstrap-grid.css" rel="stylesheet"/>
    <link href="../css/bootstrap-reboot.css" rel="stylesheet"/>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link rel="stylesheet" href="../css/icon/iconfont.css"/>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap.bundle.js"></script>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var editor = UE.getEditor('container');
        var bookId = '${bookId}';
        var noteId = '${note.noteId}';
        var noteName = '${note.noteName}';
        if (noteName) {
            $(document).ready(function () {
                $(":input[name=textName]").val(noteName);
            });
        }
        var baseUrl = '${basePath}';

        function confrimAddNoteSubmit() {
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
            if (!data.noteName || !data.noteText) {
                $('.result').text('笔记标题不能为空，笔记内容不能为空');
                $('.mask-layer').hide();
                return;
            }
            $.ajax({
                type: 'POST',
                url: baseUrl + '/v1/addNote',
                dataType: 'json',
                data: data,
                success: function (data) {
                    if (data && data.code == 1) {
                        setTimeout(function () {
                            $('.result').text(data.msg);
                            window.location.href = baseUrl + '/v1/initNotes?noteBookId=' + data.data;
                        }, 2000);
                    } else {
                        $('.result').text(data ? data.msg : '新增失败');
                    }
                }
            });
        }
    </script>
    <style>
        .margin-top-20 {
            margin-top: 20px;
        }

        .margin-bottom-20 {
            margin-bottom: 20px;
        }

        .width-100 {
            width: 100px;
        }

        .head {
            cursor: pointer;
        }

        .hide {
            display: none;
        }
    </style>
</head>
<body style="background-color: #b2bac2;">
<div class="container margin-top-20 margin-bottom-20">
    <button type="button" class="btn btn-success" onclick="javascript:history.back(-1);">
        <i class="iconfont icon-cancel"></i>
    </button>
</div>
<div class="container margin-top-20">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">文章标题</span>
        </div>
        <input type="text" name="textName" class="form-control" aria-label="Default"
               aria-describedby="inputGroup-sizing-default" maxlength="50">
    </div>
</div>
<div class="container">
    <div class="input-group-prepend">
        <span class="input-group-text" id="inputGroup-sizing-default">正文:</span>
    </div>
</div>
<div class="container margin-top-20">
    <!-- 加载编辑器的容器 -->
    <script id="container" name="content" type="text/plain">${note.noteText}</script>
</div>
<div class="container d-flex justify-content-center  margin-top-20 margin-bottom-20">
    <button type="button" class="btn btn-primary" onclick="confrimAddNoteSubmit()">确定</button>
    <span class="width-100"></span>
    <button type="button" class="btn btn-primary" onclick="javascript:history.back(-1);">取消</button>
</div>
<button type="button" class="btn btn-dark hide result"
        style="position: fixed;
                               top: 0px;
                               left: 0px;
                               right: 0px;
                               width: 300px;
                               text-overflow: ellipsis;
                               white-space: nowrap;
                               margin-left: auto;
                               margin-right: auto;
                               background-color: #000000;
                               z-index: 10000;">
    watting...
</button>
<div class="mask-layer hide"
     style="
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.6);
    z-index: 1001;">
</body>
</html>