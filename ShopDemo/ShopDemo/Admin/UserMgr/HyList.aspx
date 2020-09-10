﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HyList.aspx.cs" Inherits="ShopDemo.Admin.UserMgr.HyList" %>
<%@ Import Namespace="Model" %>
<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="renderer" content="webkit"/>
        <title></title>
        <link rel="stylesheet" href="../../css/pintuer.css"/>
        <link rel="stylesheet" href="../../css/admin.css"/>
        <script src="../../js/jquery.js" type="text/javascript"></script>
        <script src="../../js/pintuer.js" type="text/javascript"></script>
    </head>
    <body>
        <form method="post" action="" id="listform" runat="server">
          <div class="panel admin-panel">
            <div class="panel-head"><strong class="icon-reorder"> 会员列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
            <div class="padding border-bottom">
                <ul class="search" style="padding-left:10px;">
                    <li>搜索：</li>
                    <li></li>
                    <li>
                      <asp:TextBox ID="txtName" runat="server" type="text"  name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block"></asp:TextBox>
                      <asp:Button ID="btnSearch" runat="server" Text="搜索"  class="button border-main icon-search" OnClick="btnSearch_Click"/>
                      <!--<input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />-->
                      <!--<a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a>-->
                    </li>
                </ul>
            </div>
            <table class="table table-hover text-center">
                <tr>
                    <th width="103" style="text-align:left; padding-left:20px;">编号</th>
                    <th>姓名</th>
                    <th width="210">密码</th>
                    <th width="194">邮箱</th>
                    <th width="323">管理</th>
                </tr>
                    <%//取出session域中的user集合
                      List<User> users = (List<User>)Session["uList"];
                      //判断Session是否为空
                      if (users.Count != 0)/*users != null*/
                      {
                          //遍历集合，取出数据
                          foreach (User u in users)
                          { %>
                <tr>
                    <td style="text-align:left; padding-left:20px;"><%=u.UserID %></td>
                    <td width="138"><%=u.UserName %></td>
                    <td><%=u.Password %></td>
                    <td><%=u.Email %></td>
                    <td>
                        <div class="button-group"> 
                            <a class="button border-main" href="spedit.html"><span class="icon-edit"></span> 查看</a> 
                            <a class="button border-red" href="javascript:void(0)" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> 
                        </div>
                    </td>
                </tr>
                        <% }
                      }
                      else
                      {%>
                  <tr><td colspan="5"><p style="text-align:center; color:red; font-size:x-large; ">您搜索的用户不存在！</p></td></tr>
                  <%   } %>
                <tr>
                    <td colspan="5"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
                </tr>
            </table>
          </div>
        </form>
        <script type="text/javascript">

            //搜索
            function changesearch() {

            }

            //单个删除
            function del(id, mid, iscid) {
                if (confirm("您确定要删除吗?")) {

                }
            }

            //全选
            $("#checkall").click(function () {
                $("input[name='id[]']").each(function () {
                    if (this.checked) {
                        this.checked = false;
                    }
                    else {
                        this.checked = true;
                    }
                });
            })

            //批量删除
            function DelSelect() {
                var Checkbox = false;
                $("input[name='id[]']").each(function () {
                    if (this.checked == true) {
                        Checkbox = true;
                    }
                });
                if (Checkbox) {
                    var t = confirm("您确认要删除选中的内容吗？");
                    if (t == false) return false;
                    $("#listform").submit();
                }
                else {
                    alert("请选择您要删除的内容!");
                    return false;
                }
            }

            //批量排序
            function sorts() {
                var Checkbox = false;
                $("input[name='id[]']").each(function () {
                    if (this.checked == true) {
                        Checkbox = true;
                    }
                });
                if (Checkbox) {

                    $("#listform").submit();
                }
                else {
                    alert("请选择要操作的内容!");
                    return false;
                }
            }


            //批量首页显示
            function changeishome(o) {
                var Checkbox = false;
                $("input[name='id[]']").each(function () {
                    if (this.checked == true) {
                        Checkbox = true;
                    }
                });
                if (Checkbox) {

                    $("#listform").submit();
                }
                else {
                    alert("请选择要操作的内容!");

                    return false;
                }
            }

            //批量推荐
            function changeisvouch(o) {
                var Checkbox = false;
                $("input[name='id[]']").each(function () {
                    if (this.checked == true) {
                        Checkbox = true;
                    }
                });
                if (Checkbox) {


                    $("#listform").submit();
                }
                else {
                    alert("请选择要操作的内容!");

                    return false;
                }
            }

            //批量置顶
            function changeistop(o) {
                var Checkbox = false;
                $("input[name='id[]']").each(function () {
                    if (this.checked == true) {
                        Checkbox = true;
                    }
                });
                if (Checkbox) {

                    $("#listform").submit();
                }
                else {
                    alert("请选择要操作的内容!");

                    return false;
                }
            }


            //批量移动
            function changecate(o) {
                var Checkbox = false;
                $("input[name='id[]']").each(function () {
                    if (this.checked == true) {
                        Checkbox = true;
                    }
                });
                if (Checkbox) {

                    $("#listform").submit();
                }
                else {
                    alert("请选择要操作的内容!");

                    return false;
                }
            }

            //批量复制
            function changecopy(o) {
                var Checkbox = false;
                $("input[name='id[]']").each(function () {
                    if (this.checked == true) {
                        Checkbox = true;
                    }
                });
                if (Checkbox) {
                    var i = 0;
                    $("input[name='id[]']").each(function () {
                        if (this.checked == true) {
                            i++;
                        }
                    });
                    if (i > 1) {
                        alert("只能选择一条信息!");
                        $(o).find("option:first").prop("selected", "selected");
                    } else {

                        $("#listform").submit();
                    }
                }
                else {
                    alert("请选择要复制的内容!");
                    $(o).find("option:first").prop("selected", "selected");
                    return false;
                }
            }

        </script>
    </body>
</html>