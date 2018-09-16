# juery能干什么
### jQuery库包含以下功能：
* HTML 元素选取
* HTML 元素操作
* CSS 操作
* HTML 事件函数
* JavaScript 特效和动画
* HTML DOM 遍历和修改
* AJAX
* HTML 事件操作

### html 元素选取
* 元素选择器 
> 选取页面上所有的p元素,$("p")
* id选择器
> 选取id为toHidden元素,$('#toHidden')
* .class选择器
> 选取class为changeRed的元素,$('.changeRed')
### 其它
    $("*")选取所有元素	
    $(this)选取当前HTML元素
    $("p.intro")选取 class 为 intro 的 <p> 元素
    $("p:first")选取第一个 <p> 元素
    $("ul li:first")选取第一个 <ul> 元素的第一个 <li> 元素	
    $("ul li:first-child")	选取每个 <ul> 元素的第一个 <li> 元素	
    $("[href]")	选取带有 href 属性的元素	
    $("a[target='_blank']")	选取所有 target 属性值等于 "_blank" 的 <a> 元素	
    $("a[target!='_blank']")选取所有 target 属性值不等于 "_blank" 的 <a> 元素	
    $(":button")选取所有 type="button" 的 <input> 元素 和 <button> 元素	
    $("tr:even")选取偶数位置的 <tr> 元素	
    $("tr:odd")	选取奇数位置的 <tr> 元素