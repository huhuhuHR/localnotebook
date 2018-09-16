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
    <script>
        var baseUrl = '${basePath}';

        function deleteV2Book(id) {
            $('#mask').show();
            $('#deleteBook').show();
            $('#currentBookId').html(id);
        }

        function edit(id, name) {
            $('#mask').show();
            $('#addNewBook').show();
            $(":input[name='bookName']").val(name);
            $('#currentBookId').text(id);
        }

        function goNotes(id) {
            $('#mask').show();
            $('#result').show();
            window.location.href = baseUrl + '/v1/initNotes?noteBookId=' + id;
        }
    </script>
    <script type="text/javascript" src="../js/v2book.js"></script>
    <style>
        .margin-top-bottom-30 {
            margin: 30px 0;
        }

        .padding-top-bottom-30 {
            padding: 30px 0;
        }

        .margin-left-20 {
            margin-left: 16px;
        }

        .margin-top-20 {
            margin-top: 20px;
        }

        .margin-rigth-15 {
            margin-right: 20px;
        }

        .relative-left-30 {
            position: relative;
            right: 16px;
        }

        .hide, .title, .note-name {
            display: none;
        }

        .addBook, .deleteBook {
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

        .delete-info {
            text-align: center;
        }

        .box {
            position: relative;
            text-align: right;
        }

        .cancel {
            position: absolute;
            top: -17px;
        }

        .padding-15 {
            padding: 15px;
        }

        .btn-confirm {
            width: 100%;
            height: 40px;
            color: #fff;
            background-color: #007fff;
            border-radius: 2px;
            outline: none;
            box-sizing: border-box;
        }

        .box-delete {
            display: flex;
            justify-content: center;
            margin: 25px 10px;
        }

        .sureDleteBook {
            margin-right: 20px;
        }

        .sureDleteBook, .noSure {
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

        .head {
            cursor: pointer;
        }

        .space-between {
            justify-content: space-between;
        }
    </style>
</head>
<body style="background-color: #b2bac2;">
<div class="container">
    <div class="d-flex margin-top-bottom-30 relative-left-30">
        <button type="button" class="btn btn-success" id="addBook">
            <span style="cursor:pointer;"><i class="iconfont icon-xinzeng"></i></span>
            <span>新建笔记本</span>
        </button>
        <div class="form-inline my-2 my-lg-0 margin-left-20">
            <input name='search' class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchBook">Search</button>
        </div>
    </div>
</div>
<div class="container bg-light padding-top-bottom-30">
    <button type="button" class="btn btn-primary margin-left-20">
        笔记本<span class="badge badge-light">${books?size}</span>
    </button>
    <div class="d-flex flex-wrap">
    <#if (books?exists)&&(books?size>0)>
        <#list books as book>
            <div class="col-sm-3 margin-top-20">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${book.noteBookName}(${book.notesCount})</h5>
                        <p class="card-text">创建时间:${book.createTime}</p>
                        <p class="card-text">更新时间:${book.updateTime}</p>
                        <div class="d-flex space-between">
                            <button class="btn btn-primary" onclick="edit('${book.noteBookId}','${book.noteBookName}')">
                                <i
                                        class="iconfont icon-bianji"></i></button>
                            <button class="btn btn-primary" onclick="deleteV2Book('${book.noteBookId}')"><i
                                    class="iconfont icon-shanchu"></i>
                            </button>
                            <button class="btn btn-primary" onclick="goNotes('${book.noteBookId}')"><i
                                    class="iconfont icon-arrow-right"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </#list>
    <#else>
        <div>
            一条笔记本都还没有哎！
        </div>
    </#if>
    </div>
</div>
<div class="deleteBook hide" id="deleteBook">
    <div id="currentBookId" hidden></div>
    <div class="delete-info">
        是否确认删除?
    </div>
    <div class="box-delete">
        <div class="sureDleteBook head" id="confirmDelete">确定</div>
        <div class="noSure head" id="cancelDelete">取消</div>
    </div>
</div>
<div id="addNewBook" class="addBook hide">
    <div class="box" id="cancelAddBook">
        <span class="cancel"><i class="iconfont icon-quxiao"></i></span>
    </div>
    <div class="padding-15">
        <input type="text" class="form-control" name="bookName" placeholder="请输入笔记本名" maxlength="15"/>
    </div>
    <button class="btn-confirm" id="confirmAddBook">确定</button>
</div>
<button id="result" type="button" class="btn btn-dark hide"
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
<div id="mask"
     class="mask-layer hide"
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