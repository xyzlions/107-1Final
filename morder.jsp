<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>岡南塑膠發泡有限公司</title>
    <link rel="shortcut icon" type="image/png" href="./images/logo.png"/>
    <!-- CSS文件載入 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/style.css">
    <!-- js文件載入 -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
</head><%String mid;%>
<body>
    <%@include file ="header.jsp"%>
    <!-- 購物車/start -->
    <section class="page-content">
        <div class="container pt-5 pb-5">
            <div class="row">
                <!-- 產品清單/start -->
                <div class="col-12 mb-3">
                    <h2 class="mb-3">產品列表</h2>
                    <div class="table-responsive-sm table-middle">

						<table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr>
									<th scope="col" class="product-thumbnail">訂單編號</th>
                                    <th scope="col" class="product-thumbnail">產品</th>
                                    <th scope="col" class="product-quantity">收件者</th>
									<th scope="col" class="product-price">總價</th>
                                    <th scope="col" class="product-quantity">付款方式</th>
									<th scope="col" class="product-name">電話</th>
                                    <th scope="col" class="product-quantity">交貨方式</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
			try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
			String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8";
			String sql="";
			Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
			sql="use final";
			con.createStatement().execute(sql);
			sql="select * from orderlist where mid='"+session.getAttribute("mid")+"'"; 
			ResultSet rs=con.createStatement().executeQuery(sql);
			 while(rs.next())
                {
				out.println("<tr>");
								out.println("<td class='product-thumbnail'>"+rs.getString(1)+"</td>");
								out.println("<td class='product-thumbnail'>");
						out.println(rs.getString(3)+"</td>");
							out.println("<td class='product-name'>"+rs.getString(4));
							out.println("</td>");
								out.println("<td class='product-price'>NT$&nbsp;"+rs.getString(9)+"</td>");
							out.println("<td class='product-quantity'>");
                                        out.println("use&nbsp;"+rs.getString(7));
                                    out.println("</td>");
									out.println("<td class='product-quantity'>");
                                        out.println("0"+rs.getString(6));
                                    out.println("</td>");
									out.println("<td class='product-quantity'>");
                                        out.println("at&nbsp;"+rs.getString(8));
                                    out.println("</td>");
                                out.println("</tr>");
				}
			con.close();
			}
				}
			catch (SQLException sExec)
			{
				out.println("SQL錯誤"+sExec.toString());
			}
				}
			catch (ClassNotFoundException err)
			{
			out.println("class錯誤"+err.toString());
			}
			%>
                                
                            </tbody>
                        </table>
<a href="member.jsp"><img src="back.png" ></a></
                    </div>
                </div>
        
            </div>
        </div>
    </section>
    <!-- 購物車/end -->
<%@include file="ender.jsp"%>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip({trigger: "click"});
        })
    </script>
</body>
</html>