<%--
  Created by IntelliJ IDEA.
  User: 石磊
  Date: 2018/8/13
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>film</title>
    <!--3.3.1的jquery-->
    <script type="text/javascript" src="../js/jquery3.3.1.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
    <h2>film界面</h2>
    <%--搭建显示页面--%>
    <div class="container">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12"><h1>SSM-CRUD</h1></div>
        </div>
        <%--按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <%--现实表格--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="cuxUsers_table">
                    <thead>
                    <tr>
                        <th>film_id</th>
                        <th>title</th>
                        <th>description</th>
                        <th>name</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <%--把数据遍历出来--%>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <%--显示分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6" id="page_info_area">

            </div>
            <%--分页条信息--%>
            <div class="col-md-6" id="page_nav_area">

            </div>
        </div>
    </div>

    <script type="text/javascript">
        //    页面加载完成以后直接发送一个ajax数据去要到分页数据
        //    在请求完后会返回json数据
        $(function(){
            to_page(1);
        });

        function to_delete(filmId){
            $.ajax({
                url:"${APP_PATH}/delete",
                data:"filmId="+filmId,
                type:"GET",
//            成功时候回调函数，返回的result
                success:function(result){
//                    //解析显示员工数据
//                    build_cuxUsers_table(result);
//                    //解析显示分页信息
//                    build_page_info(result);
//                    //解析显示分页条数据
//                    build_page_nav(result);
                }
            });
        }

        //    传入页码就发出一个ajax请求，通过点击页码数来传第几个页码并且会调用该方法
        function to_page(pn){
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn="+pn,
                type:"GET",
//            成功时候回调函数，返回的result
                success:function(result){
                    //解析显示员工数据
                    build_cuxUsers_table(result);
                    //解析显示分页信息
                    build_page_info(result);
                    //解析显示分页条数据
                    build_page_nav(result);
                }
            });
        }
        //    追加成员列表信息
        function build_cuxUsers_table(result){
//        每次点击页码发送ajax请求时候都要先清空一下
            $("#cuxUsers_table tbody").empty();
            var cuxUsers = result.extend.pageInfo.list;//得到返回结果对象获取到其中的list
            $.each(cuxUsers, function(index, cuxUser){
                var userId = $("<td></td>").append(cuxUser.filmId);//???
                var userName = $("<td></td>").append(cuxUser.title);//???
                var sex = $("<td></td>").append(cuxUser.description);//???
                var age = $("<td></td>").append(cuxUser.name);//???
                var editBtn =$("<button></button>").addClass("btn btn-primary btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append("编辑");
                var delBtn =$("<button></button>").addClass("btn btn-danger btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append("删除");
//                给删除按钮加上点击传送信息给servlet
                delBtn.click(function(){
                    to_delete(cuxUser.filmId);
                });
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(userId)
                    .append(userName)
                    .append(sex)
                    .append(age)
                    .append(btnTd)
                    .appendTo("#cuxUsers_table tbody");
            });
        }
        //    追加下方页数等信息
        function build_page_info(result){
//        每次点击页码发送ajax请求时候都要先清空一下
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+result.extend.pageInfo.pages+"页，总共"+result.extend.pageInfo.total+"条记录");
        }
        //    追加下方第几页等信息
        function build_page_nav(result){
//        每次点击页码发送ajax请求时候都要先清空一下
            $("#page_nav_area").empty();
//        ul
            var ul = $("<ul></ul>").addClass("pagination");
//        首页
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
//        尾页
            var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
//        上一页
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
//        下一页
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
//        如果没有上一页
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }
            else{
                prePageLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum-1);
                });
                firstPageLi.click(function(){
                    to_page(1);
                });
            }
//        若没有下一页
            if(result.extend.pageInfo.hasNextPage == false){
                lastPageLi.addClass("disabled");
                nextPageLi.addClass("disabled");
            }
            else{
                nextPageLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum+11);
                });
                lastPageLi.click(function(){
                    to_page(result.extend.pageInfo.pages);
                });
            }
//        产生123.....
//        在ul中添加首页和上一页
            ul.append(firstPageLi).append(prePageLi);
            $.each(result.extend.pageInfo.navigatepageNums, function(index, item){
                var numLi = $("<li></li>").append($("<a></a>").append(item));
//            如果遍历到的页面是当前页面
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function(){
                    to_page(item);
                });
                ul.append(numLi);
            });
//        在ul中添加下一页和尾页
            ul.append(nextPageLi).append(lastPageLi);
//        把ul加入到nav元素中
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }
    </script>
</body>
</html>
