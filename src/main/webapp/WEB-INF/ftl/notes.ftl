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
    <style>
        .margin-top-bottom-30 {
            margin: 30px 0;
        }

        .padding-30 {
            padding: 30px;
        }

        .margin-left-20 {
            margin-left: 16px;
        }

        .border-radius-5 {
            border-radius: 5px;
        }

        .margin-left-15 {
            margin-left: 15px;
        }

        .margin-rigth-15 {
            margin-right: 15px;
        }

        .font-size-12 {
            font-size: 12px;
        }

        .height-600 {
            max-height: 600px;
        }

        .min-height-600 {
            min-height: 600px;
        }

        .over-flow-scroll-y {
            overflow-y: scroll;
        }

        .over-flow-scroll-y::-webkit-scrollbar {
            display: none;
        }

        .deleteNotes {
            padding: 20px;
            background-color: #ffffff;
            width: 300px;
            height: 150px;
            position: absolute;
            right: 0;
            left: 0;
            bottom: 0;
            top: 0;
            margin: auto;
            z-index: 1002;
        }

        .confirmDeleteNotes {
            margin-right: 20px;
        }

        .confirmDeleteNotes {
            width: 80px;
            height: 40px;
            line-height: 40px;
            color: #fff;
            background-color: #007fff;
            border-radius: 2px;
            outline: none;
            text-align: center;
            box-sizing: border-box;
        }

        .box-delete {
            display: flex;
            justify-content: center;
            margin: 25px 10px;
        }

        .head {
            cursor: pointer;
        }

        .note-name {
            padding: 10px 0;
            height: 50px;
            font-size: 24px;
            width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            border-bottom: solid 1px #c3c3c3;
            font-weight: bold;
        }

        .note-text {
            margin-top: 10px;
        }

        .title {
            display: flex;
            font-size: 24px;
            padding: 0 0 10px 0;
            font-weight: bold;
        }

        .createTime {
            margin-right: 15px;
        }

        .hide {
            display: none;
        }

        .font-weight {
            font-weight: bold;
            font-size: 20px;
        }

        .cancelDelete {
            width: 80px;
            height: 40px;
            line-height: 40px;
            color: #fff;
            background-color: #007fff;
            border-radius: 2px;
            outline: none;
            text-align: center;
            box-sizing: border-box;
        }
    </style>
    <script type="text/javascript">
        var baseUrl = '${basePath}';

        function editNote(bookId, noteId, event) {
            window.location.href = baseUrl + '/v1/editNote?noteBookId=' + bookId + '&noteId=' + noteId;
            event.stopPropagation();
        }

        function deleteNote(bookId, noteId) {
            $('.mask-layer').show();
            $('.deleteNotes').show();
            $('.nbookId').html(bookId);
            $('.noteId').html(noteId);
        }

        function choose(noteId) {
            $.ajax({
                type: 'POST',
                url: baseUrl + '/v1/swithNoteId',
                dataType: 'json',
                data: {
                    noteId: noteId
                },
                success: function (data) {
                    if (data && data.code === '1' && data.data) {
                        $('.notes-text').html(data.data);
                    }
                }
            });
        }
    </script>
    <script type="text/javascript" src="../js/v2note.js"></script>
</head>
<body style="background-color: #b2bac2;">
<div class="container-fluid">
    <div class="d-flex margin-top-bottom-30 margin-left-15">
        <button type="button" class="btn btn-success" id="goBooks">
            <i class="iconfont icon-bijiben"></i>
        </button>
        <button type="button" class="btn btn-success margin-left-20" onclick="editNote('${bookId}','-1')">
            <span style="cursor:pointer;"><i class="iconfont icon-xinzeng"></i></span>
            <span>新建笔记</span>
        </button>
        <div class="form-inline my-2 my-lg-0 margin-left-20">
            <input class="form-control mr-sm-2" name="searchNotes" type="search" placeholder="Search"
                   aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0 toSearchNotes" type="submit">Search</button>
        </div>
    </div>
</div>
<div class="container-fluid d-flex">
    <div class="col-3 over-flow-scroll-y height-600">
    <#if (notes?exists)&&(notes?size>0)>
        <#list notes as note>
            <#if note_index== 0>
                <div class="card bg-secondary" onclick="choose('${note.noteId}')">
                    <div class="card-body">
                        <h6 class="card-title font-weight">${note.noteName}</h6>
                        <p class="card-text font-size-12">创建时间:${note.createTime}</p>
                        <p class="card-text font-size-12">更新时间:${note.updateTime}</p>
                        <button class="btn btn-primary margin-rigth-15"
                                onclick="editNote('${note.noteBookId}','${note.noteId}',event)"><i
                                class="iconfont icon-bianji"></i></button>
                        <button class="btn btn-primary margin-rigth-15"
                                onclick="deleteNote('${note.noteBookId}','${note.noteId}')"><i
                                class="iconfont icon-shanchu"></i></button>
                        <button class="btn btn-primary"><i
                                class="iconfont icon-arrow-right"></i></button>
                    </div>
                </div>
            <#else>
                <div class="card" onclick="choose('${note.noteId}')">
                    <div class="card-body">
                        <h6 class="card-title font-weight">${note.noteName}</h6>
                        <p class="card-text font-size-12">创建时间:${note.createTime}</p>
                        <p class="card-text font-size-12">更新时间:${note.updateTime}</p>
                        <button class="btn btn-primary margin-rigth-15"
                                onclick="editNote('${note.noteBookId}','${note.noteId}',event)"><i
                                class="iconfont icon-bianji"></i></button>
                        <button class="btn btn-primary margin-rigth-15"
                                onclick="deleteNote('${note.noteBookId}','${note.noteId}')"><i
                                class="iconfont icon-shanchu"></i></button>
                        <button class="btn btn-primary"><i
                                class="iconfont icon-arrow-right"></i></button>
                    </div>
                </div>
            </#if>
        </#list>
    <#else>
        <div>
            一条笔记都还没有哎！
        </div>
    </#if>
    </div>
<#if oneNote?exists>
    <div class="col-9 bg-light border-radius-5 notes-text min-height-600 padding-30">
    ${oneNote.noteText}
    </div>
</#if>
</div>
<div class="deleteNotes hide">
    <div class="noteId" hidden></div>
    <div class="nbookId" hidden></div>
    <div class="delete-info">
        是否确认删除?
    </div>
    <div class="box-delete">
        <div class="confirmDeleteNotes head" id="confirmDeleteNotes">确定</div>
        <div class="cancelDelete head" id="cancelDelete">取消</div>
    </div>
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
</div>
</body>
</html>