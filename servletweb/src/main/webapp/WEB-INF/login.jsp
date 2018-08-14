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
    <title>login</title>
    <!--3.3.1的jquery-->
    <script type="text/javascript" src="../js/jquery3.3.1.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
    <h2>登陆界面</h2>
    <form action="/loginByName" method="post">
        <div class="col-lg-6">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="用户名" name="firstName">
                <span class="input-group-btn">
                <intput class="btn btn-default"  type="submit" value="login">登陆</intput>
                </span>
            </div><!-- /input-group -->
        </div><!-- /.col-lg-6 -->
    </form>
</body>
</html>
