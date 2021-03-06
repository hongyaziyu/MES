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
    <title>模具出入库记录</title>
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
	function delMid(nowTr){
    	var mydecide=confirm("确认删除吗？");
		if(mydecide==true){
    	$ss = $(nowTr).parent().parent().remove();
    	setIndex(); 			
    	}
    }
	
	</script>
	
</head>
<body>

<div class="container">
    <h4 class="myClass navbar-left">模具出入库记录</h4>
		<form class="form-inline top"  method="post" action="${pageContext.request.contextPath}/record/moldRecord.action">
		 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;		  
		  <div class="form-group">
		  	<label for="equipmentNum">物料号</label>
		    <input type="text" name="materialNo" class="form-control" id="equipmentNum">
		  </div>
		  <div class="form-group">
		  	<label for="equipmentName">批次号</label>
		    <input type="text" name="batchNo" class="form-control" id="equipmentName">
		  </div>
		  <div class="form-group">
		  	<label for="equipmentName">模具编号</label>
		    <input type="text" name="moldNo" class="form-control" id="equipmentName">
		  </div>
		  &nbsp;&nbsp;&nbsp;&nbsp;
		  
		  <button  type="submit" class="btn btn-primary">查询</button>
		  
		  &nbsp;&nbsp;&nbsp;&nbsp;
	
		</form>
		<br />
	<div class="table-responsive">
	  <table class="table">
			<thead>
				<tr>
				    <th>计划单号</th>					
					<th>图号</th>  
					<th>物料号</th>					
					<th>批次号</th>
					<th>模具编号</th>
					<th>出库时间</th>
					<th>提供人</th>
					<th>入库时间</th>
					<th>接收人</th>
					<th>数量</th>
					<th>使用频次</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${listmoldrecord}" var="a">
			<!-- 循环输出forEach -->
				<tr>  
				    <td>${a.planNo}</td>
					<td>${a.clientMaterialNo}</td>
					<td>${a.materialNo}</td>
					<td>${a.batchNo}</td>
					<td>${a.moldNo}</td>
					<td>${a.outDate}</td>
					<td>${a.provider}</td>
					<td>${a.inDate}</td>
					<td>${a.acceptor}</td>
					<td>${a.num}</td>
					<td>${a.useTimes}</td>			
				</tr>
				</c:forEach>
			</tbody>	

</table>
</div>

<!-- 分页功能 start -->    
    <div align="center" >    
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第    
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/record/moldRecord.action?pageNow=1&materialNo=${materialNo}&batchNo=${batchNo}&moldNo=${moldNo}">首页</a>    
        <c:choose>    
            <c:when test="${page.pageNow - 1 > 0}">    
                <a href="${pageContext.request.contextPath}/record/moldRecord.action?pageNow=${page.pageNow - 1}&materialNo=${materialNo}&batchNo=${batchNo}&moldNo=${moldNo}">上一页</a>    
            </c:when>    
            <c:when test="${page.pageNow - 1 <= 0}">    
                <a href="${pageContext.request.contextPath}/record/moldRecord.action?pageNow=1&materialNo=${materialNo}&batchNo=${batchNo}&moldNo=${moldNo}">上一页</a>    
            </c:when>    
        </c:choose>    
        <c:choose>    
            <c:when test="${page.totalPageCount==0}">    
                <a href="${pageContext.request.contextPath}/record/moldRecord.action?pageNow=${page.pageNow}&materialNo=${materialNo}&batchNo=${batchNo}&moldNo=${moldNo}">下一页</a>    
            </c:when>    
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">    
                <a href="${pageContext.request.contextPath}/record/moldRecord.action?pageNow=${page.pageNow + 1}&materialNo=${materialNo}&batchNo=${batchNo}&moldNo=${moldNo}">下一页</a>    
            </c:when>    
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">    
                <a href="${pageContext.request.contextPath}/record/moldRecord.action?pageNow=${page.totalPageCount}&materialNo=${materialNo}&batchNo=${batchNo}&moldNo=${moldNo}">下一页</a>    
            </c:when>    
        </c:choose>    
        <c:choose>    
            <c:when test="${page.totalPageCount==0}">    
                <a href="${pageContext.request.contextPath }/record/moldRecord.action?pageNow=${page.pageNow}&materialNo=${materialNo}&batchNo=${batchNo}&moldNo=${moldNo}">尾页</a>    
            </c:when>    
            <c:otherwise>    
                <a href="${pageContext.request.contextPath }/record/moldRecord.action?pageNow=${page.totalPageCount}&materialNo=${materialNo}&batchNo=${batchNo}&moldNo=${moldNo}">尾页</a>    
            </c:otherwise>    
        </c:choose>  
        跳到<select name='topage' size='1' onchange="window.location=' ${pageContext.request.contextPath }/record/moldRecord.action?pageNow='+this.value+'&materialNo=${materialNo}&batchNo=${batchNo}&moldNo=${moldNo}'">
       <c:forEach var="i" begin="1" end="${page.totalPageCount}">
       <c:if test="${i==page.pageNow}"><option value='${i}' selected>${i}</option></c:if>
       <c:if test="${i!=page.pageNow}"><option value='${i}'>${i}</option></c:if>
       </c:forEach></select> 页
    </div>    
    <!-- 分页功能 End -->

</div>
</body>
</html>

