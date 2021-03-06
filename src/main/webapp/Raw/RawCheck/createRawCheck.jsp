<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/19
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>新增抽检</title>
    <link type="text/css" href="../../css/style.css" rel="stylesheet" /> <!-- the layout css file -->
    <link type="text/css" href="../../css/jquery.cleditor.css" rel="stylesheet" />
   <script type='text/javascript' src='../../js/jquery-1.4.2.min.js'></script>	<!-- jquery library -->
    <script type='text/javascript' src='../../js/jquery-ui-1.8.5.custom.min.js'></script> <!-- jquery UI -->
    <script type='text/javascript' src='../../js/cufon-yui.js'></script> <!-- Cufon font replacement -->
    <script type='text/javascript' src='../../js/ColaborateLight_400.font.js'></script> <!-- the Colaborate Light font -->
    <script type='text/javascript' src='../../js/easyTooltip.js'></script> <!-- element tooltips -->
    <script type='text/javascript' src='../../js/jquery.tablesorter.min.js'></script> <!-- tablesorter -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/addRawCheck.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>
   <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>--%>
    <!--[if IE 8]>
    <script type='text/javascript' src='js/excanvas.js'></script>
    <link rel="stylesheet" href="css/IEfix.css" type="text/css" media="screen" />
    <![endif]-->

    <!--[if IE 7]>
    <script type='text/javascript' src='js/excanvas.js'></script>
    <link rel="stylesheet" href="css/IEfix.css" type="text/css" media="screen" />
    <![endif]-->
    <script type='text/javascript' src='../../js/visualize.jQuery.js'></script> <!-- visualize plugin for graphs / statistics -->
    <script type='text/javascript' src='../../js/iphone-style-checkboxes.js'></script> <!-- iphone like checkboxes -->
    <script type='text/javascript' src='../../js/jquery.cleditor.min.js'></script> <!-- wysiwyg editor -->
    <script type='text/javascript' src='../../js/custom.js'></script> <!-- the "make them work" script -->
</head>

<body>
<form action="addRawtobacco.do" method="post" id="rawform">
<fieldset>
    <h1>新增抽检</h1>
   <%-- <p>
        <label>抽检单号</label>
        <input class="sf" name="checknum" type="text"  />
        <span class="field_desc">Field description</span>
    </p>--%>
    <p>
        <label>发货单位</label>
        <select name="deliverycompany" class="dropdown">
            <option>Please select an option</option>
            <c:forEach items="${companies}" var="co">
            <option value="${co.id}">${co.name}</option>
            </c:forEach>
        </select>
    </p>
    <p>
        <label>委托方</label>
        <select name="client" class="dropdown">
            <option>Please select an option</option>
            <c:forEach items="${companies}" var="co">
                <option value="${co.id}">${co.name}</option>
            </c:forEach>
        </select>
    </p>
    <p>
        <label>车牌号</label>
        <input class="sf" name="carnum" type="text"  />
        <span class="field_desc">Field description</span>
    </p>
    <p>
        <label>烟叶年度</label>
        <input class="sf" name="producingyear" type="text"  />
        <span class="field_desc">Field description</span>						</p>
    <p>
        <label>烟叶产地</label>
       <%-- <input class="sf" name="producingarea" type="text"/>--%>
        <select name="producingarea" class="dropdown">
            <option>Please select an option</option>
            <c:forEach items="${producingareas}" var="producingareas">
                <option value="${producingareas.id}">${producingareas.name}</option>
            </c:forEach>
        </select>
        <span class="field_desc">Field description</span> </p>
    <p>
        <label>烟叶等级</label>
        <select name="level" class="dropdown">
            <option>Please select an option</option>
            <c:forEach items="${tobaccoleve}" var="to">
                <option value="${to.levelid}">${to.levelname}</option>
            </c:forEach>
        </select>
    </p>
    <p>
        <label>烟叶品种</label>
        <select name="tobaccocategory" class="dropdown">
            <option>Please select an option</option>
            <c:forEach items="${tobaccocategories}" var="tobaccocategories">
                <option value="${tobaccocategories.id}">${tobaccocategories.name}</option>
            </c:forEach>
        </select>
    </p>
    <p>
        <label>抽检员</label>
      <%--  <input class="sf" name="sf" type="text" value="small input field" />--%>
        <select name="operator" class="dropdown">
            <option>Please select an option</option>
            <c:forEach items="${users}" var="users">
                <option value="${users.id}">${users.name}</option>
            </c:forEach>
        </select>
        <span class="field_desc">Field description</span>
    </p>
    <p>
        <label>抽检日期 </label>
       <%-- <input name="checkdate" class="datepicker" type=""/>--%>
        <input name="checkdate"  type="date"/>
    </p>
    <input type="hidden" name="tempdata" id="hira"  />
    <p><a class="button_link CRCdialog_link">添加明细</a>	</p>
    <div id="CRCdialog" title="添加明细">

           <%-- <p>
                <label for="name">序号</label>
                <input type="text" name="sequence" id="number"  />
            </p>--%>
            <p>
                <label for="email">重量</label>
                <input type="text" name="checkweight" id="weight" value=""  />
                公斤</p>

    </div>
    <table id="users" class="fullwidth normal">
        <thead>
        <tr>
            <th>序号</th>
            <th>重量</th>
            <th>操作</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <td>3John</td>
            <td>john.doe@example.com</td>
            <td>
                <a href="#" title="Edit this user" class="tooltip table_icon">
                    <img src="../../assets/icons/actions_small/Pencil.png" alt="" width="16" height="16" /></a>
                <a href="#" title="Preferences" class="tooltip table_icon">
                    <img src="../../assets/icons/actions_small/Preferences.png" alt="" /></a>
                <a href="#" title="Delete this user" class="tooltip table_icon">
                    <img src="../../assets/icons/actions_small/Trash.png" alt="" /></a>
            </td>
        </tr>
        </tbody>
    </table>
    <div align="center"><a href="#">首页</a>
        <a href="#">上一页</a>
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">下一页</a>
        <a href="#">尾页</a>
    </div>
    <p><input class="button" type="submit" value="Submit"  onclick="addall()"/><input class="button" type="reset" value="Reset" /></p>
</fieldset>
</form>
</body>
</html>

