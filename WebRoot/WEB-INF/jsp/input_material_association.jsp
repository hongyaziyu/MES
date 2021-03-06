<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<jsp:include page="headandfoot.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>原材料外协入库记录</title>
    <link href="../css/bootstrap-multiselect.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../css/bootstrap.min.new.css"/>
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="../css/main.css"/>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-3.2.1.min.js"></script>  
        <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-datetimepicker.js"></script>
    <script src="../js/bootstrap-datetimepicker.zh-CN.js"></script>
       
	<script type="text/javascript" >	
	$(function(){
		$('.date').datetimepicker({
			language: 'zh-CN',
			weekStart: 0,
			todayBtn: 1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 3,
			minView: 2,
			forceParse: 0
		});
	});

	</script>
	
	<script type="text/javascript" >//$(document).ready(function(){
	// 原材料外协excel导出
	function revice(){
	 	var material_no=document.getElementById("wl").value;
	 	var start_date=document.getElementById("st").value;
	 	var end_date=document.getElementById("et").value;
		location.href="${pageContext.request.contextPath}/record/toInputMaterialsAssociationexcel.action?material_no="+material_no+"&start_date="+start_date+"&end_date="+end_date;
	
	}
	function revise(obj){
	 	var recordId=$(obj).prev().val();
		location.href="${pageContext.request.contextPath}/record/deleteInputMaterialsAssociation.action?recordId="+recordId;
	}
</script>
</head>
<body>
	<div class="container">
		<h4 class="myClass navbar-left">原材料外协入库记录</h4>
		<form class="form-inline"  method="post" action="${pageContext.request.contextPath}/record/toIntputMaterialsAssociation.action">
		  	&nbsp;&nbsp;
		  	<div class="form-group">
		  		<label for="">物料号</label>
		   		<input type="text" class="form-control" style="width: 100px" name="material_no" id="wl" value="${HX.materialNo}">
		  	</div>
		  	<div class="form-group">
		  		<label for="">起始日期</label>
		    	<div class="input-group date form_date"  data-date-format="yyyy-mm-dd" >
            		<input class="form-control" size="10" type="text" name="start_date" value="${HX.shopName}" id="st"/>
            		 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
            		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
       			</div>
		  	</div>
		  	<div class="form-group">
		  		<label for="">截止日期</label>
		    	<div class="input-group date form_date"  data-date-format="yyyy-mm-dd">
            		<input class="form-control" size="10" type="text" name="end_date" value="${HX.materialName}" id="et"/>
            		 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
            		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
       			</div>
		  	</div>
		  &nbsp;
		  <button type="submit" class="btn btn-primary">查询</button>
		   &nbsp;
		   <input class="btn btn-warning" type="button" value="原材料外协入库excel" onclick="revice(this)">
		</form> 
		<br />
		<div class="container">	   
		<div class="table-responsive">
		  	<table class="table">
				<thead>
					<tr>
						<th>外协供应商</th>			
						<th>图号</th>
						<th>物料号</th>
						<th>计划单号</th>
						<th>批次号</th>
						<th>产品名称</th>
						<th>产品规格</th>	
						<th>入库重量(kg)</th>							
						<th>入库数量</th>
						<th>单位</th>							
						<th>入库日期</th>	
						<th>操作</th>															
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listintputmaterialassociation}" var="a">
			<!-- 循环输出forEach -->
					<tr>
						<td>${a.associationer}</td>					
						<td>${a.clientMaterialNo}</td>
						<td>${a.materialNo}</td>
						<td>${a.planNo}</td>
						<td>${a.batchNo}</td>
						<td>${a.productMc}</td>
						<td>${a.productSpec}</td>
						<td>${a.weight}</td>
					    <td>${a.productNum}</td> 
					    <td>${a.unit}</td>
						<td>${a.transDate}</td>	
						<td>
						<input type="hidden" name="recordId" value="${a.recordId}"/><input class="btn  btn-xs btn-danger" type="button" value="删除" onclick="revise(this)"> 
						</td>														
					</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
	</div>
	
	 <!-- 分页功能 start -->    
    <div align="center" >    
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第    
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/record/toIntputMaterialsAssociation.action?pageNow=1&material_no=${material_no}&start_date=${start_date}&end_date=${end_date}">首页</a>    
        <c:choose>    
            <c:when test="${page.pageNow - 1 > 0}">    
                <a href="${pageContext.request.contextPath}/record/toIntputMaterialsAssociation.action?pageNow=${page.pageNow - 1}&material_no=${material_no}&start_date=${start_date}&end_date=${end_date}">上一页</a>    
            </c:when>    
            <c:when test="${page.pageNow - 1 <= 0}">    
                <a href="${pageContext.request.contextPath}/record/toIntputMaterialsAssociation.action?pageNow=1&material_no=${material_no}&start_date=${start_date}&end_date=${end_date}">上一页</a>    
            </c:when>    
        </c:choose>    
        <c:choose>    
            <c:when test="${page.totalPageCount==0}">    
                <a href="${pageContext.request.contextPath}/record/toIntputMaterialsAssociation.action?pageNow=${page.pageNow}&material_no=${material_no}&start_date=${start_date}&end_date=${end_date}">下一页</a>    
            </c:when>    
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">    
                <a href="${pageContext.request.contextPath}/record/toIntputMaterialsAssociation.action?pageNow=${page.pageNow + 1}&material_no=${material_no}&start_date=${start_date}&end_date=${end_date}">下一页</a>    
            </c:when>    
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">    
                <a href="${pageContext.request.contextPath}/record/toIntputMaterialsAssociation.action?pageNow=${page.totalPageCount}&material_no=${material_no}&start_date=${start_date}&end_date=${end_date}">下一页</a>    
            </c:when>    
        </c:choose>    
        <c:choose>    
            <c:when test="${page.totalPageCount==0}">    
                <a href="${pageContext.request.contextPath }/record/toIntputMaterialsAssociation.action?pageNow=${page.pageNow}&material_no=${material_no}&start_date=${start_date}&end_date=${end_date}">尾页</a>    
            </c:when>    
            <c:otherwise>    
                <a href="${pageContext.request.contextPath }/record/toIntputMaterialsAssociation.action?pageNow=${page.totalPageCount}&material_no=${material_no}&start_date=${start_date}&end_date=${end_date}">尾页</a>    
            </c:otherwise>    
        </c:choose>  
        跳到<select name='topage' size='1' onchange="window.location=' ${pageContext.request.contextPath }/record/toIntputMaterialsAssociation.action?pageNow='+this.value+'&material_no=${material_no}&start_date=${start_date}&end_date=${end_date}'">
       <c:forEach var="i" begin="1" end="${page.totalPageCount}">
       <c:if test="${i==page.pageNow}"><option value='${i}' selected>${i}</option></c:if>
       <c:if test="${i!=page.pageNow}"><option value='${i}'>${i}</option></c:if>
       </c:forEach></select> 页
    </div>    
    <!-- 分页功能 End -->
	
	</div>
	<br />
</body>
</html>

